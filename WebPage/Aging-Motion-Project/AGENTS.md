# AGENTS.md - Project Webpage for Age Diffusion Model Research

## Overview

This repository hosts the project webpage for the **Age-Conditioned Motion Diffusion Model** research. The research project is currently in progress, with an extended abstract prepared for conference submission. The webpage is a static site built with HTML, CSS (Bulma), and JavaScript (jQuery, Bulma extensions). The LaTeX extended abstract is located in `../Motion Diffusion Model Basics/Reports/3DVSubmission/`.

**Agent Role**: You are a web development assistant responsible for maintaining and enhancing the project webpage. You may also assist with LaTeX document formatting when requested, following the separate AGENTS.md in the Reports repository.

## Repository Structure

```
WebPage/
├── index.html                    # Main landing page (placeholder)
├── AGENTS.md                     # This file
├── Aging-Motion-Project/         # Cloned Nerfies website (reference design)
│   ├── index.html                # Full example webpage
│   ├── static/
│   │   ├── css/                  # Bulma and custom CSS
│   │   ├── js/                   # Custom JavaScript and libraries
│   │   └── interpolation/        # Image assets
│   └── README.md                 # Original Nerfies credits
└── (future assets)               # Additional pages, images, etc.

Motion Diffusion Model Basics/
├── 4 - Age Diffusion Model/      # Research notes and project documentation
│   ├── 1- Project Overview.md
│   ├── 2 - Dataset Processing Pipeline.md
│   └── Dataset Overview/
└── Reports/
    ├── 3DVSubmission/            # Extended abstract (LaTeX)
    │   ├── main.tex              # Main document
    │   ├── sec/                  # Section files
    │   ├── sec.back/             # Backup sections (consult before editing)
    │   ├── cvpr.sty              # Conference template
    │   └── README.md             # Specific guidelines
    └── AGENTS.md                 # LaTeX‑focused agent instructions
```

## Build, Lint, and Test Commands

### Local Development Server

```bash
# Python 3 simple HTTP server (port 8000)
python3 -m http.server 8000

# Alternative: using Node.js `http-server` (install globally: npm install -g http-server)
http-server -p 8080
```

### HTML Validation

```bash
# Install html5validator (Python package)
pip install html5validator

# Validate all HTML files
html5validator --root . --ignore "*.min.js,*.min.css"
```

### CSS Linting

```bash
# Install stylelint and configuration
npm init -y
npm install --save-dev stylelint stylelint-config-standard

# Run stylelint on CSS files
npx stylelint "**/*.css"
```

### JavaScript Linting

```bash
# Install ESLint and configuration
npm install --save-dev eslint eslint-config-standard

# Run ESLint
npx eslint "**/*.js"
```

### Prettier Code Formatting

```bash
# Install Prettier
npm install --save-dev prettier

# Format all HTML, CSS, JS files
npx prettier --write "**/*.{html,css,js}"
```

### LaTeX Compilation

Refer to `../Motion Diffusion Model Basics/Reports/AGENTS.md` for detailed LaTeX commands. Basic workflow:

```bash
cd "../Motion Diffusion Model Basics/Reports/3DVSubmission"
latexmk -pdf main.tex          # Compile PDF
latexmk -c                     # Clean auxiliary files
```

### Running a Single Test

Currently no test suite is defined. If tests are added (e.g., using Jest for JavaScript), run:

```bash
npx jest path/to/testfile.js   # Example for Jest
```

## Code Style Guidelines

### General Principles

- **Consistency**: Follow existing patterns in the `Aging-Motion-Project` directory.
- **Readability**: Use clear naming, avoid overly clever code.
- **Progressive Enhancement**: Ensure core content works without JavaScript.

### HTML

- Use HTML5 semantics (`<header>`, `<main>`, `<section>`, `<article>`).
- Indent with 2 spaces (observe existing files).
- Always include `alt` attributes on images.
- Use double quotes for attributes.
- Load CSS in `<head>`, JavaScript before `</body>` (except analytics).
- Keep lines under 120 characters where possible.

### CSS

- Follow the BEM-like naming seen in `index.css` (e.g., `.publication-title`).
- Use kebab‑case for custom class names (`.interpolation-panel`).
- Define custom properties (CSS variables) for colors, spacing.
- Avoid `!important` unless overriding third‑party styles.
- Use flexbox/grid for layouts; Bulma classes are encouraged.

### JavaScript

- Use `var` for top‑level variables (as in existing code) or `const`/`let` for new code.
- Prefer arrow functions for callbacks, regular `function` for hoisting.
- Use template literals for string interpolation.
- Handle errors with `try…catch` for async operations.
- Comment complex logic, but avoid obvious comments.
- Use jQuery for DOM manipulation (already included).
- Keep functions small and single‑purpose.

### Imports and Dependencies

- External libraries are loaded via CDN (Google Fonts, jQuery, Bulma).
- Local scripts are placed in `static/js/` and loaded after libraries.
- CSS files: Bulma first, then custom CSS.

### Naming Conventions

- **Files**: kebab‑case (`dataset-overview.html`).
- **CSS classes**: kebab‑case (`.age‑diffusion‑model`).
- **JavaScript variables**: camelCase (`interpolationImages`).
- **Constants**: UPPER_SNAKE_CASE (`NUM_INTERP_FRAMES`).
- **IDs**: kebab‑case (`#interpolation-slider`).

### Error Handling

- Validate user input before processing.
- Use `console.error` for debugging; remove before deployment.
- Graceful degradation: if a feature fails, fall back to static content.

### LaTeX (Summary)

- **Always consult `sec.back/` before editing sections**.
- Follow the conference template exactly (CVPR style).
- Use `\input{sec/file}` for modular sections.
- Keep lines under 80 characters in `.tex` files.
- Cite with `\cite{key}`; bibliography in `references.bib`.

## Agent Responsibilities

1. **Webpage Development**
   - Implement new pages and features as requested.
   - Ensure cross‑browser compatibility (Chrome, Firefox, Safari).
   - Optimize images and assets for fast loading.
   - Maintain mobile‑first responsive design.

2. **Content Updates**
   - Integrate research findings, figures, and videos.
   - Keep publication list and author information current.
   - Link to preprints, code repositories, and datasets.

3. **Quality Assurance**
   - Run linting and validation commands before committing.
   - Test the website locally and on GitHub Pages.
   - Check for broken links and missing assets.

4. **LaTeX Assistance** (when asked)
   - Refer to the Reports AGENTS.md for detailed instructions.
   - Compile the extended abstract and fix formatting issues.
   - Never modify template files (`cvpr.sty`, `preamble.tex`) unless instructed.

## References

- [Bulma CSS Framework](https://bulma.io/documentation/)
- [jQuery API Documentation](https://api.jquery.com/)
- [LaTeX Project](https://www.latex-project.org/)
- [HTML5 Validator](https://validator.w3.org/)
- [Stylelint](https://stylelint.io/)
- [ESLint](https://eslint.org/)
- [Prettier](https://prettier.io/)

---
*This AGENTS.md file is intended for agentic coding assistants working on the project webpage. Update it as the project evolves.*