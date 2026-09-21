#!/usr/bin/env python3
"""Download the public Wall Street Quants ebook as Obsidian notes (stdlib only)."""

from __future__ import annotations

import argparse
from collections import Counter
from datetime import datetime, timezone
import json
from pathlib import Path
import re
import sys
import time
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


BASE_URL = "https://www.thewallstreetquants.com"
SOURCE_URL = BASE_URL + "/ebook"
DEFAULT_OUTPUT = Path(__file__).resolve().parent


def atomic_write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(text, encoding="utf-8")
    temporary.replace(path)


def write_json(path: Path, value: object) -> None:
    atomic_write(path, json.dumps(value, ensure_ascii=False, indent=2) + "\n")


class Client:
    def __init__(self, timeout: float, retries: int, delay: float):
        self.timeout = timeout
        self.retries = retries
        self.delay = delay
        self.last_request = 0.0

    def get(self, endpoint: str) -> dict:
        for attempt in range(self.retries + 1):
            time.sleep(max(0, self.delay - (time.monotonic() - self.last_request)))
            retry_after = 0.0
            try:
                self.last_request = time.monotonic()
                request = Request(
                    BASE_URL + endpoint,
                    headers={"Accept": "application/json", "User-Agent": "WSQ-Obsidian-Downloader/1.0"},
                )
                with urlopen(request, timeout=self.timeout) as response:
                    value = json.load(response)
                if not isinstance(value, dict):
                    raise ValueError(f"Expected a JSON object from {endpoint}")
                return value
            except HTTPError as error:
                # Retry temporary failures; don't retry authentication or missing endpoints.
                if error.code not in (408, 429, 500, 502, 503, 504):
                    raise
                header = error.headers.get("Retry-After", "")
                if header.isdigit():
                    retry_after = float(header)
                if attempt == self.retries:
                    raise
            except (URLError, TimeoutError, ConnectionError):
                if attempt == self.retries:
                    raise
            wait = max(retry_after, min(2 ** attempt, 30))
            print(f"Temporary request failure; retrying in {wait:g}s", file=sys.stderr)
            time.sleep(wait)
        raise RuntimeError("Request retries exhausted")


def validate_catalog(data: dict) -> list[dict]:
    entries = data.get("entries")
    if not isinstance(entries, list) or not entries:
        raise ValueError("The catalog has no entries; the source API may have changed")
    for n, entry in enumerate(entries):
        if not isinstance(entry, dict) or type(entry.get("n")) is not int or entry["n"] != n:
            raise ValueError("Catalog question numbers must be unique and contiguous from zero")
        for key in ("company", "companyLabel", "title"):
            if not isinstance(entry.get(key), str) or not entry[key].strip():
                raise ValueError(f"Catalog entry {n} has no valid {key}")
        if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", entry["company"]):
            raise ValueError(f"Unsafe company folder name at entry {n}")
    return entries


def validate_batch(data: dict, start: int, entries: list[dict]) -> list[dict]:
    if data.get("total") != len(entries):
        raise ValueError("Question total changed or cache is stale; rerun with --refresh")
    items = data.get("items")
    if not isinstance(items, list) or not items:
        raise ValueError(f"Empty question batch at {start}; refusing an incomplete export")
    for offset, item in enumerate(items):
        n = start + offset
        if (not isinstance(item, dict) or type(item.get("n")) is not int
                or item["n"] != n or n >= len(entries)):
            raise ValueError(f"Missing, duplicate, or out-of-order question at {n}")
        for key in ("company", "companyLabel"):
            if item.get(key) != entries[n][key]:
                raise ValueError(f"Catalog/batch mismatch at {n}; rerun with --refresh")
        if not isinstance(item.get("question"), str) or not item["question"].strip():
            raise ValueError(f"Question {n + 1} has no question text")
        for key in ("title", "solution"):
            if item.get(key) is not None and not isinstance(item[key], str):
                raise ValueError(f"Question {n + 1} has an invalid {key}")
    return items


def download(client: Client, output: Path, batch_size: int, refresh: bool) -> list[dict]:
    cache = output / ".cache"
    catalog = client.get("/api/ebook/toc")
    entries = validate_catalog(catalog)
    write_json(cache / "toc.json", catalog)
    items: list[dict] = []
    print(f"Catalog: {len(entries):,} questions", flush=True)
    while len(items) < len(entries):
        start = len(items)
        cache_path = cache / f"pages-{start:05d}-{batch_size}.json"
        batch = None
        if cache_path.exists() and not refresh:
            try:
                batch = validate_batch(json.loads(cache_path.read_text(encoding="utf-8")), start, entries)
            except (ValueError, AttributeError):
                print(f"Refetching invalid cache: {cache_path.name}", file=sys.stderr)
        if batch is None:
            query = urlencode({"start": start, "count": batch_size})
            data = client.get("/api/ebook/pages?" + query)
            batch = validate_batch(data, start, entries)
            write_json(cache_path, data)
        items.extend(batch)
        print(f"\rDownloaded/validated {len(items):,}/{len(entries):,}", end="", flush=True)
    print()
    return items


def note_path(item: dict) -> Path:
    # Stable filenames avoid duplicates if a source title or question text changes.
    return Path(item["company"]) / f"WSQ-{item['n'] + 1:04d}.md"


def plain_text_markdown(text: str) -> str:
    """Questions are rendered as plain text by the website, unlike solutions."""
    return re.sub(r"([\\`*_{}\[\]<>#!|$~])", r"\\\1", text.strip())


def render_note(item: dict, downloaded_at: str) -> str:
    number = item["n"] + 1
    source = f"{SOURCE_URL}#p={item['n'] + 2}"
    title = item.get("title") or "Interview question"
    # JSON-quoted strings are valid YAML scalars, including colons and quotes.
    metadata = {
        "source": source,
        "publisher": "The Wall Street Quants",
        "question_number": number,
        "company": item["companyLabel"],
        "interview": title,
        "downloaded_at": downloaded_at,
    }
    frontmatter = "\n".join(f"{key}: {json.dumps(value, ensure_ascii=False)}" for key, value in metadata.items())
    solution = (item.get("solution") or "").strip() or "The source does not provide a solution."
    # Prefix EVERY line, including blanks, fences, tables and display math. Otherwise
    # part of a solution can escape the folded callout and become visible.
    folded = "\n".join("> " + line if line else ">" for line in solution.splitlines())
    return (
        f"---\n{frontmatter}\ntags:\n  - quant-interview\n  - {item['company']}\n---\n\n"
        f"> [!example] Question {number} · {item['companyLabel']}\n"
        f"> ## {plain_text_markdown(title)}\n\n"
        f"{plain_text_markdown(item['question'])}\n\n"
        f"[Source]({source})\n\n"
        f"> [!success]- Solution (Click to expand)\n{folded}\n"
    )


def export_notes(items: list[dict], output: Path, overwrite: bool) -> tuple[int, int]:
    downloaded_at = datetime.now(timezone.utc).isoformat(timespec="seconds")
    written = skipped = 0
    counts = Counter(item["companyLabel"] for item in items)
    lines = [
        "> [!abstract] Question bank", "> ## The Wall Street Quants", "",
        f"[Source ebook]({SOURCE_URL}) · {len(items):,} questions", "",
        "Company labels and solutions are reproduced from the source; interview provenance and answers have not been independently verified.",
        "", "| Firm | Questions |", "| --- | ---: |",
        *(f"| {label} | {count} |" for label, count in counts.items()), "",
    ]
    company = None
    for item in items:
        relative = note_path(item)
        path = output / relative
        if path.exists() and not overwrite:
            skipped += 1
        else:
            atomic_write(path, render_note(item, downloaded_at))
            written += 1
        if company != item["company"]:
            company = item["company"]
            lines.extend(["---", "", "> [!example] Questions", f"> ## {item['companyLabel']}", ""])
        preview = " ".join(item["question"].split())
        if len(preview) > 120:
            preview = preview[:117] + "…"
        # A relative Markdown link works in Obsidian and outside this vault.
        lines.append(f"- [{item['n'] + 1:04d}]({relative.as_posix()}) — {plain_text_markdown(preview)}")
    atomic_write(output / "Index.md", "\n".join(lines) + "\n")
    return written, skipped


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT, help="Output directory (default: beside this script)")
    parser.add_argument("--batch-size", type=int, default=8, help="Questions per request (default: site's own batch size, 8)")
    parser.add_argument("--delay", type=float, default=0.25, help="Minimum seconds between requests (default: 0.25)")
    parser.add_argument("--timeout", type=float, default=45, help="Request timeout in seconds")
    parser.add_argument("--retries", type=int, default=4, help="Retries for temporary network failures")
    parser.add_argument("--refresh", action="store_true", help="Refetch all batches instead of using the resumable cache")
    parser.add_argument("--overwrite", action="store_true", help="Replace existing question notes (otherwise preserve edits)")
    args = parser.parse_args()
    if args.batch_size < 1 or args.delay < 0 or args.timeout <= 0 or args.retries < 0:
        parser.error("batch-size and timeout must be positive; delay and retries must be nonnegative")
    try:
        items = download(Client(args.timeout, args.retries, args.delay), args.output, args.batch_size, args.refresh)
        written, skipped = export_notes(items, args.output, args.overwrite)
    except (OSError, ValueError) as error:
        print(f"Error: {error}\nCached batches are retained; rerun to resume.", file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print("\nInterrupted. Cached batches are retained; rerun to resume.", file=sys.stderr)
        return 130
    print(f"Complete: {written:,} notes written, {skipped:,} existing notes preserved. Index: {args.output / 'Index.md'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
