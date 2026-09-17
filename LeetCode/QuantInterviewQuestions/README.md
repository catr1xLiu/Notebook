# Quant interview questions

Download all questions and available solutions from [The Wall Street Quants ebook](https://www.thewallstreetquants.com/ebook#p=2). Python 3.10+ is sufficient; no packages, browser, account, or API key are required.

From the repository root:

```sh
python3 LeetCode/QuantInterviewQuestions/download_questions.py
```

Open [[Index]] in Obsidian to browse questions by firm. Each question is a separate note in its firm's folder, with a stable `WSQ-0001.md` filename, source link, metadata, and a collapsed solution:

```markdown
> [!success]- Solution (Click to expand)
> Solution text, equations, tables, and code go here.
```

The script discovers the current catalog through `/api/ebook/toc` and downloads `/api/ebook/pages` in small batches. It validates that all question numbers are present exactly once and match the catalog before exporting. The source uses zero-based question numbers; question 1 links to ebook page `#p=2`.

Solutions retain the source's Markdown and LaTeX. Question text is escaped as literal text, matching how the website displays it, so currency amounts do not accidentally become math. The script does not rewrite, solve, or correct questions. Company labels reflect the source's claims.

Downloads are cached under `.cache/` (ignored by Git), so interrupted downloads resume. Existing question notes are preserved by default, and `Index.md` is regenerated. To retrieve source changes and replace existing notes, including any personal edits:

```sh
python3 LeetCode/QuantInterviewQuestions/download_questions.py --refresh --overwrite
```

Use `--output /path/to/folder` for another destination. Run `--help` for request delay, timeout, retry, and batch-size options. The output directory defaults to the script's folder, regardless of the current working directory.
