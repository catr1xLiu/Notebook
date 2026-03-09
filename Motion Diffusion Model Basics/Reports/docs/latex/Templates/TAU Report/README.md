# Tau Class Template

Professional academic article/research report template with STIX2 fonts, custom environments, and code highlighting.

## Description

Tau is a LaTeX2e document class designed for creating professional, well-structured research articles, lab reports, and academic documentation.

## Features

- Self-contained structure (class files in single folder)
- STIX2 serif font for excellent readability
- Custom environments for notes and information blocks
- Enhanced code presentation with syntax highlighting (minted/listings)
- Translation package support for multilingual documents
- Professional title and abstract design

## Files

- `main.tex` - Main document file
- `tau.bib` - Bibliography file
- `tau-class/` - Class files and custom packages
  - `tau.cls` - Main document class
  - `taubabel.sty` - Language/translation configuration
  - `tauenvs.sty` - Custom environments
- `figures/` - Place figures here

## Usage

1. Copy the entire template folder to your project location
2. Edit `main.tex` with your content
3. Update `tau.bib` with your references
4. Compile with `latexmk -pdf main.tex`

## Configuration

Key commands in `main.tex`:
- `\doctype{}` - Document type
- `\dates{}` - Date information
- `\setboolean{es-babel}{true/false}` - Spanish language support

## License

Creative Commons CC BY 4.0

For more details, see `tau-class/README.md`.
