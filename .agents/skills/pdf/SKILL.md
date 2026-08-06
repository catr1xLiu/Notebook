---
name: pdf
description: The only approved way to read a PDF — inspect page count, cut with qpdf, convert to markdown with marker-pdf. Covers short documents, long documents (table-of-contents recon then section-wise splitting), GPU memory limits, and figure extraction.
---

# Skill: Reading PDFs

**Never read a PDF with the Read tool.** Feeding a PDF to `Read` burns an enormous number of
tokens on page images, loses equations and tables, and cannot be searched or re-read cheaply. This
skill is *always* the preferred path — for papers, textbooks, lab manuals, datasheets, slides,
scanned handouts, anything. Convert once to markdown, then read, grep, and cite the markdown.

The output of this skill is a markdown file plus extracted figures. That markdown is what you read.

---

## Tooling

| Tool | Purpose | Location |
| --- | --- | --- |
| `pdfinfo` | page count, page size, metadata | `/usr/bin` (poppler-utils) |
| `qpdf` | lossless page-range cutting | `/usr/bin` |
| `marker_single` | PDF → markdown + figures | repo uv venv (`marker-pdf` 1.10.x) |
| `pdftoppm` / `pdftocairo` | vector/PDF figure → PNG | `/usr/bin` (poppler-utils) |

`marker_single` **must** be invoked through the repo's uv environment:

```bash
uv run marker_single <args>
```

`uv run` finds the project by walking up to the repo root, so it works from any
subdirectory of the vault.

**Do not upgrade `marker-pdf` past 1.x.** `pyproject.toml` pins `marker-pdf>=1.8,<2`
deliberately. Marker 2.x replaces the in-process surya models with a VLM served by an
auto-spawned `vllm/vllm-openai` Docker container; its GPU sizing table bottoms out at
16 GB and it claims 85% of VRAM, which does not fit this laptop's 8 GB RTX 5060 —
conversions stall on container boot and CUDA-graph capture rather than failing cleanly.
If a run is interrupted mid-spawn the container and a `surya.ocr_error.server` process
orphan themselves and keep pinning ~6.9 GB; clear them with
`docker stop surya-vllm-<port>` and by killing the server pid.

Use a scratch working directory outside the repo for intermediate chunks (e.g.
`/tmp/pdf-<name>/`), and write only the final markdown + media into the repo.

---

## Step 1 — Inspect before converting

Never convert blind. Always establish the page count first, because it decides the entire strategy.

```bash
PDF=path/to/document.pdf
pdfinfo "$PDF"                 # Pages, Page size, Producer, encryption
qpdf --show-npages "$PDF"      # page count only, quick
ls -lh "$PDF"                  # file size
```

Two numbers matter:

- **Pages** — from `pdfinfo`.
- **Bytes per page** — `file size ÷ pages`. This is the media-density proxy:
  - `< 100 KB/page` → text-dominant (a plain paper, lecture notes, a spec sheet).
  - `100–500 KB/page` → mixed figures.
  - `> 500 KB/page` → media-rich (scanned pages, slide decks, image-heavy textbooks). Halve every
    chunk size below.

If `pdfinfo` reports `Encrypted: yes`, strip the (empty-password) encryption first — marker will
otherwise fail:

```bash
qpdf --decrypt "$PDF" /tmp/pdf-work/decrypted.pdf
```

## Step 2 — Choose a strategy from the page count

| Pages | Strategy |
| --- | --- |
| ≤ 80 (text-dominant) | **Direct convert** — one `marker_single` call, no cutting. Go to Step 5. |
| ≤ 40 (media-rich) | Direct convert. |
| > 80, or > 40 media-rich | **TOC recon then section-wise split** — Steps 3 → 4 → 5. |

**Hard limit — read this before every conversion.** This laptop's GPU handles roughly **80 pages**
of a text-dominant document in a single `marker_single` run. Media-rich documents exhaust VRAM far
faster: budget **30–40 pages** for scanned or slide-heavy material, and less if pages are
full-bleed images. Exceeding the budget produces a CUDA OOM part-way through and wastes the whole
run — chunks are cheap, restarts are not. When unsure, cut smaller.

Never convert a 300-page textbook in one call, and never convert it as 300 pages of blind 80-page
slabs either — split along the document's own structure, which is what Steps 3–4 are for.

## Step 3 — Table-of-contents recon (long documents only)

You cannot split sensibly without knowing where the sections start. Cut a cheap probe off the front
of the document and convert only that.

```bash
WORK=/tmp/pdf-work; mkdir -p "$WORK"
qpdf "$PDF" --pages . 1-5 -- "$WORK/probe.pdf"
uv run marker_single "$WORK/probe.pdf" \
  --output_format markdown \
  --disable_image_extraction \
  --output_dir "$WORK/probe-out"
```

`--disable_image_extraction` keeps the probe fast — you only want the text of the contents page.

Read `$WORK/probe-out/probe/probe.md` and pull out the section titles and their page numbers. If
five pages weren't enough (front matter, long preface, multi-page contents), widen the probe:
`--pages . 1-12`. Some documents put the contents at the back — check `pdfinfo`'s page count and
probe the last pages instead. If the document has PDF bookmarks, they are faster and exact:

```bash
pdftk "$PDF" dump_data 2>/dev/null | grep -A2 BookmarkTitle   # if pdftk is available
```

**Calibrate the page offset.** The page numbers printed in a table of contents are *logical* page
numbers and rarely match physical PDF page indices — front matter, roman-numeral prefaces, and
cover pages shift them. Verify before cutting:

1. Take one section whose printed start page is `P`.
2. Cut a single page around your guess and check what landed there:
   ```bash
   qpdf "$PDF" --pages . 37 -- "$WORK/check.pdf"
   uv run marker_single "$WORK/check.pdf" --output_format markdown \
     --disable_image_extraction --output_dir "$WORK/check-out"
   ```
3. The difference between the physical index and the printed number is the offset. Apply it to
   every section boundary. Confirm the offset holds near the *end* of the document too — inserted
   plates or blank pages can shift it mid-document.

## Step 4 — Cut into sections with qpdf

`qpdf` page selection is lossless and fast. The syntax is `--pages <file> <range> --` where `.`
means "the input file itself":

```bash
qpdf "$PDF" --pages . 1-40   -- "$WORK/ch1.pdf"     # inclusive range
qpdf "$PDF" --pages . 41-88  -- "$WORK/ch2.pdf"
qpdf "$PDF" --pages . 89-z   -- "$WORK/ch3.pdf"     # 'z' = last page
qpdf "$PDF" --pages . 5,9,12-15 -- "$WORK/picks.pdf" # discontiguous
```

Cutting rules:

- **Cut on section boundaries**, not arbitrary page multiples — a chunk that starts mid-derivation
  produces markdown with a dangling equation and no heading to anchor it.
- **Respect the page budget from Step 2.** If a chapter is 140 pages, split it again at its
  sub-section boundaries; do not hand marker a 140-page chunk because "it's one chapter."
- **Name chunks by content**, zero-padded so they sort: `01_Introduction.pdf`,
  `02_Kinematics.pdf`. The chunk filename becomes the markdown filename.
- **Verify each chunk** before the expensive step: `qpdf --show-npages "$WORK/ch1.pdf"`.

If you only need one specific section (the common case — "what does the manual say about X?"), cut
**only that section** and convert it. There is no obligation to convert a whole textbook.

## Step 5 — Convert with marker_single

```bash
uv run marker_single "$WORK/01_Introduction.pdf" \
  --output_format markdown \
  --output_dir "$WORK/out"
```

Output lands in a subdirectory named after the input stem:

```
$WORK/out/01_Introduction/
├── 01_Introduction.md            # the markdown
├── 01_Introduction_meta.json     # marker metadata
└── _page_N_Figure_M.jpeg         # extracted figure screenshots
```

Useful flags:

| Flag | When to use |
| --- | --- |
| `--disable_image_extraction` | Text-only pass (TOC probes, offset checks, prose chapters). Faster and much lighter on memory. |
| `--page_range 0,5-10` | Convert a subset **without** cutting. 0-indexed, unlike qpdf. Fine for small selections; still prefer qpdf chunks for long documents, since the chunk files are reusable and the naming carries meaning. |
| `--disable_multiprocessing` | First fallback on an OOM or a hang. |
| `--highres_image_dpi 144` | Lower than the 192 default; reduces memory on media-rich chunks. |
| `--disable_ocr` | Born-digital PDFs with a real text layer — skips the OCR pass entirely. Do **not** use on scans. |
| `--output_format json` / `chunks` | Only when you need structured blocks rather than prose. |

Loop over chunks sequentially — **never in parallel**, they contend for the same GPU:

```bash
for f in "$WORK"/[0-9]*.pdf; do
  uv run marker_single "$f" --output_format markdown --output_dir "$WORK/out" \
    || echo "FAILED: $f"
done
```

## Step 6 — Sanity check the markdown

Marker is good but not perfect. Before relying on the output, skim it and confirm:

- **Equations** rendered as LaTeX (`$...$` / `$$...$$`), not as garbled text or dropped images.
- **Tables** converted to markdown tables rather than flattened into a single line.
- **Section headers** intact, so the file is greppable by structure.
- **No large gaps** — compare the markdown length against the chunk's page count; a 40-page chunk
  producing two paragraphs means OCR failed.

If a chunk came out badly, re-run it alone with `--disable_multiprocessing` and, for scans, a
higher `--highres_image_dpi`.

## Step 7 — Figures

Marker's `_page_N_Figure_M.jpeg` files are **page screenshots** and are frequently blurry. If the
figures matter (they usually do for notes and reviews):

1. Move the real figures out of the marker output into a `media/` directory; drop logos,
   decorative photos, and redundant screenshots.
2. If a higher-quality original exists (a LaTeX source tree, an accompanying figure folder, or a
   vector PDF), prefer it and rasterize at high DPI:
   ```bash
   pdftoppm -png -r 300 input.pdf outname            # -> outname-1.png
   pdftocairo -png -r 300 -singlefile input.pdf outname
   ```
3. Standardize on **PNG** for anything that will be embedded in a note.
4. Update the image references in the markdown to the cleaned filenames.

## Step 8 — Place output and clean up

- Keep the converted markdown somewhere durable if it will be re-read — a `sources/<DocName>/`
  folder next to the notes that cite it. Throwaway conversions can stay in `/tmp`.
- Delete the chunk PDFs and probe output once the markdown is verified: `rm -rf "$WORK"`.
- Do **not** commit the source PDF or intermediate chunks into the repo.

---

## Acquiring a PDF from arXiv

arXiv rejects blank or default user agents, so always pass a browser-like `-A` string and follow
redirects:

```bash
ID=2401.01234
DL=/tmp/arxiv-$ID; mkdir -p "$DL"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
curl -L -A "$UA" -o "$DL/paper.pdf" "https://arxiv.org/pdf/$ID"
```

Papers are almost always under 80 pages and text-dominant, so they convert directly — no cutting
needed. For the full paper→note workflow (including pulling the LaTeX source for high-resolution
figures), see the [`literature-review`](../literature_review/SKILL.md) skill.

---

## Troubleshooting

| Symptom | Cause | Fix |
| --- | --- | --- |
| CUDA out of memory | Chunk too large or too media-rich | Cut smaller (halve it), add `--disable_multiprocessing`, lower `--highres_image_dpi`, or `--disable_image_extraction` if figures aren't needed |
| Run hangs with no progress | Multiprocessing contention | `--disable_multiprocessing` |
| Markdown is near-empty | Scanned pages, OCR failed | Ensure `--disable_ocr` is **not** set; raise `--highres_image_dpi` |
| `marker_single: command not found` | Ran outside the env | Prefix with `uv run` |
| Fails to open the file | Encrypted PDF | `qpdf --decrypt in.pdf out.pdf` first |
| Cut section starts at the wrong content | Logical vs. physical page offset | Recalibrate per Step 3 |
| Equations dropped or mangled | Dense math with an unusual font | Re-run that chunk alone; a smaller chunk often recovers them |
