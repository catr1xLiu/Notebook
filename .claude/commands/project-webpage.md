# Skill: Create / Update Project Webpage

Build or update a research project webpage under `WebPage/`, following the conventions in `WebPage/Aging-Motion-Project/AGENTS.md`.

## Mandatory steps

1. **Read** `WebPage/Aging-Motion-Project/AGENTS.md` for the full HTML/CSS/JS style spec and agent responsibilities.
2. **Reference design**: use `WebPage/Aging-Motion-Project/index.html` (Nerfies template) as the design baseline. The stack is HTML5 + Bulma CSS + jQuery.
3. **Content conversion**: when converting from a technical report or Notion draft, fix grammar and sentence structure but preserve technical accuracy and the author's tone. Complete half-finished sentences automatically.
4. **Assets**: check `<project>/media/` for figures and videos before referencing them. Use relative paths.
5. **Code style**:
   - HTML: 2-space indent, semantic tags, `alt` on all images, double-quoted attributes.
   - CSS: BEM-like kebab-case classes; Bulma utility classes preferred; no `!important`.
   - JS: `const`/`let` for new code; jQuery for DOM; arrow functions for callbacks.
   - File naming: kebab-case.
6. **Test locally** before reporting done: `python3 -m http.server 8000` then open `http://localhost:8000`.
7. **Deployment**: the GitHub Actions workflow at `.github/workflows/deploy-static-page.yml` auto-deploys `WebPage/` to GitHub Pages on push to `main`. No manual step needed.

## File placement

New project pages go under `WebPage/<ProjectName>/`. An `index.html` in that directory is the entry point.
