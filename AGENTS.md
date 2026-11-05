# AGENTS.md

**Audience:** coding agents and developers working on the GEOSgcm fixture.
**Describes:** the MAPL2 line, branch `main`.
**Verified against:** `GEOSgcm` @ `0f2e0fb` (2026-11-04); nested repositories are listed in `docs/ARCHITECTURE.md`.
**Placement:** the fixture root; other fixtures (GEOSadas, GEOSldas) place repositories differently.

`GEOSgcm` is the fixture repository of the GEOS atmosphere-ocean model: it
holds `components.yaml`, the top `CMakeLists.txt` and build glue. The model
code is in about 44 nested repositories that `mepo` clones into `src/`, `@env`
and `@cmake`; their directory names start with `@` (`components.yaml`).

## Getting the full tree

A bare `GEOSgcm` checkout has almost no model code. From the fixture root
(`README.md`): `mepo clone` clones everything in `components.yaml`;
`mepo status` lists each repository's branch or tag. Some repositories are
sparse checkouts (`config/*.sparse`).

## Documents

- `docs/ARCHITECTURE.md`: repository tree, run-time component tree, build
  structure, run-time configuration, observations. Read first.
- `docs/decisions.md`: why the fixture is arranged this way.
- [`src/Components/@GEOSgcm_GridComp/AGENTS.md`](src/Components/@GEOSgcm_GridComp/AGENTS.md): start there for
  any work on model components (needs `mepo clone`). Nested repositories with
  their own `AGENTS.md` (each needs `mepo clone`):
  [GEOSchem_GridComp](src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/AGENTS.md) (Chemistry; contains GOCART),
  [GEOSradiation_GridComp](src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp/AGENTS.md),
  [FVdycoreCubed_GridComp](src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp/AGENTS.md),
  [GEOS_OceanGridComp](src/Components/@GEOSgcm_GridComp/GEOSogcm_GridComp/@GEOS_OceanGridComp/AGENTS.md),
  [GEOSgcm_App](src/Applications/@GEOSgcm_App/AGENTS.md) (setup scripts and templates).

## Rules

- A nested repository is a separate Git repository, gitignored by the fixture:
  `git status` here does not show its changes. Find the owner with
  `git -C <dir> rev-parse --show-toplevel` before editing or committing; a
  change there needs its own branch and pull request.
- `components.yaml` pins `tag:` values. *Inferred:* changing a nested
  repository's version means tagging it, then editing `components.yaml`.
- Note bugs and surprises under "Observations" in `docs/ARCHITECTURE.md`; do
  not fix them unless asked. Keep documents current when a component tree,
  build option or `components.yaml` entry changes. Cite files and routines.

## Build and test

- `source @env/g5_modules.sh` (bash) or `@env/g5_modules` (tcsh), then
  `cmake -B build -S . -DCMAKE_INSTALL_PREFIX=install`,
  `cmake --build build -j N`, `cmake --install build`; or `./parallel_build.csh`
  (`README.md`). `CMakePresets.json` and `presets/` hold CMake presets.
- In-source builds are rejected (`CMakeLists.txt`).
- No tests are defined by the fixture CMake files read here:
  `esma_add_regression_tests` exists in `@cmake` but nothing in the fixture calls
  it. CI builds with several compilers: `.github/workflows/workflow.yml`.
