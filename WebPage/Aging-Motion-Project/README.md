# Age-Conditioned Motion Diffusion Model - Project Webpage

This directory hosts the project webpage for the **Age-Conditioned Motion Diffusion Model** research. The webpage presents ongoing research into generating age-specific human motion using diffusion models with Low-Rank Adaptation (LoRA).

## Project Status

The research is currently in progress, with an extended abstract prepared for conference submission. The webpage serves as a public-facing interface to share research findings, demonstrations, and publications.

## Contents

- `index.html` - Main landing page (currently placeholder)
- `Aging-Motion-Project/` - Reference website design based on Nerfies
- `AGENTS.md` - Guidelines for agentic coding assistants
- Future pages and assets for the complete research presentation

## Quick Start

To view the webpage locally:

```bash
# Using Python's built-in HTTP server
python3 -m http.server 8000

# Or using Node.js http-server
http-server -p 8080
```

Then open `http://localhost:8000` or `http://localhost:8080` in your browser.

## Research Documentation

The main research documentation and LaTeX extended abstract are located in:

```
../Motion Diffusion Model Basics/4 - Age Diffusion Model/      # Research notes
../Motion Diffusion Model Basics/Reports/3DVSubmission/        # Extended abstract
```

## Credit

This webpage design is based on the **[Nerfies](https://nerfies.github.io)** project website, which is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.

Original Nerfies citation:
```
@article{park2021nerfies
  author    = {Park, Keunhong and Sinha, Utkarsh and Barron, Jonathan T. and Bouaziz, Sofien and Goldman, Dan B and Seitz, Steven M. and Martin-Brualla, Ricardo},
  title     = {Nerfies: Deformable Neural Radiance Fields},
  journal   = {ICCV},
  year      = {2021},
}
```

## Purpose

This webpage will eventually feature:
- Research overview and methodology
- Interactive demonstrations of age-conditioned motion generation
- Publication list and conference submissions
- Links to code repositories and datasets
- Team information and contact details

The site is built with HTML, CSS (Bulma framework), and JavaScript (jQuery, Bulma extensions).