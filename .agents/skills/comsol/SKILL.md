---
name: comsol
description: Guidelines for retrieving COMSOL Multiphysics API documentation.
---

# COMSOL API Research Guidelines

This skill provides references for COMSOL Multiphysics programming. There is no fixed procedure for creating a simulation in COMSOL, as each physics problem is unique. Instead, use this skill to look up specific API commands and syntax when writing or modifying COMSOL scripts.

## Retrieving Documentation

The complete COMSOL API reference manual (originally a 1200-page PDF) has been processed and split into small, manageable markdown files for efficient retrieval.

**DO NOT** attempt to read the large, monolithic markdown files in the root of the `references/` directory.

Instead, follow this workflow to find API syntax:

1. Look in the `references/split/` directory, which categorizes commands into topics like `1_General_Commands`, `2_Geometry`, `3_Mesh`, etc.
2. Use `list_dir` or `grep_search` within a specific category to find the exact file corresponding to the command or topic you need (e.g., `model.geom()`, `Selections`, etc.).
3. Use the `view_file` tool to read the specific file. These files are typically under 100 lines, so you can safely view their entirety to understand the syntax, parameters, and examples.

By using the `split/` directory, you will maintain a focused context and find exact syntax much faster.
