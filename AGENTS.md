# GEOSgcm: guide for agents

**Describes:** the MAPL3 line, branch `release/MAPL-v3`; verified against `GEOSgcm` @ `56ce4e8` (2026-11-12).
**Placement:** the fixture root. Other fixtures (GEOSadas, GEOSldas) place the nested repositories differently. Paths below are relative to this repository.

`GEOSgcm` is the fixture of the GEOS atmosphere-ocean model. It holds `components.yaml`, the top `CMakeLists.txt`, `src/**/CMakeLists.txt` glue, `config/*.sparse`, CMake presets and CI files, and almost no model code. The model code is in 44 nested repositories that `mepo clone` places in `@`-prefixed directories (`components.yaml`).

> **Build status on this line:** the model is not built. `src/CMakeLists.txt` adds `Shared` and `Components`, while `Applications` and `FoundationModels` are commented out ("not yet ported to MAPL3"). So there is no `GEOSgcm.x`, and ported components run only in their repositories' standalone regression cases. `src/Shared/CMakeLists.txt` builds `GMAO_Shared` (restricted to `GMAO_mpeu`, `GMAO_hermes` and `GEOS_Shared` with `HERMES_LIGHT`) and MAPL (unless an external MAPL is found); `NCEP_Shared` is not built. Which components are built is recorded in each component repository's `AGENTS.md`, not here.

## Rules for agents

- Read [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) (how the fixture is put together: repository tree, build mechanism, top of the run-time tree, where configuration lives) before changing `components.yaml`, the CMake glue or sparse files. Update it when one of those changes. It describes only what changes rarely, so keep status and to-dos out of it.
- A nested repository is a separate Git repository and is gitignored here, so `git status` at the root does not show its changes. Find the owner with `git -C <dir> rev-parse --show-toplevel` before editing or committing. A change there needs its own branch and pull request in that repository.
- Note bugs and oddities, but do not fix them unless asked. Record a bug or an open question as a GitHub issue in the repository that owns the code, not in a document. A document may link to the issue.
- Keep this file current: update it when the status, a rule or a `components.yaml` entry it relies on changes, and update its "verified against" commit.
- Cite files and routines, never line numbers. Label unchecked statements *Inferred:* or *Unverified:*.

## Where to go next

Each of these repositories has its own `AGENTS.md`, which exists after `mepo clone`. `GG` stands for `src/Components/@GEOSgcm_GridComp`.

| Work on | Start at |
|---|---|
| any model component; the GCM, Agcm, Superdyn and Physics composites; Moist, GWD, Turbulence | `GG/AGENTS.md`, then `GG/GEOSagcm_GridComp/AGENTS.md` |
| Chemistry; GOCART2G aerosols | `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/AGENTS.md`; GOCART: its `@GOCART/AGENTS.md` |
| Radiation (Solar, IRRAD, SatSim) | `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp/AGENTS.md` |
| FV3 dynamical core | `GG/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp/AGENTS.md` |
| Ocean and ocean plug-ins | `GG/GEOSogcm_GridComp/@GEOS_OceanGridComp/AGENTS.md` |
| setup scripts, run-time templates | `src/Applications/@GEOSgcm_App/AGENTS.md` |
| MAPL (framework) | `src/Shared/@MAPL/AGENTS.md` |
| shared libraries; pre- and post-processing tools | `src/Shared/@GMAO_Shared/AGENTS.md`; `src/Shared/@GMAO_Shared/@GEOS_Util/AGENTS.md` |

## Known traps

- **Branches, not tags, on this line.** `components.yaml` has 26 `branch:` entries (most on `release/MAPL-v3`, `MAPL` on `develop`, `cmake` on `release/v4`) and 18 `tag:` entries. A branch-tracked repository follows its branch. *Inferred:* changing a tag-pinned repository's version means tagging it and then editing `components.yaml`.
- **A missing directory is not a build error.** CMake skips an absent nested directory and replaces an absent `SUBCOMPONENTS` entry with a generated stub (`@cmake/esma_support/esma_add_library.cmake`). A sparse or partial checkout therefore builds without a warning.
- **The sparse file decides the Agcm build.** `config/GEOSgcm_GridComp.sparse` leaves out the Held-Suarez files, so `GEOSagcm_GridComp/CMakeLists.txt` takes its `else` branch. A checkout without that sparse file builds Held-Suarez instead.
- **`@cmake` has two maintained lines.** The fixture tracks `release/v4` (`components.yaml`), while ESMA_cmake's `develop` is v5. A fix needed by both lines needs a pull request on each.
- **`mepo develop` leaves the MAPL3 line.** The `develop:` keys in `components.yaml` name each repository's MAPL2 development branch (`develop`, `main` or `geos/develop`), not `release/MAPL-v3`. `mepo develop` and `parallel_build.csh -develop` (which runs `mepo develop GEOSgcm_GridComp GEOSgcm_App GMAO_Shared GEOS_Util`) therefore switch those repositories to MAPL2 code. Use `mepo status` to check what each repository is on.

## Build and test

- `source @env/g5_modules.sh` (bash) or `source @env/g5_modules` (tcsh), then `cmake -B build -S . -DCMAKE_INSTALL_PREFIX=install`, `cmake --build build -j N`, `cmake --install build`. Alternatively, `./parallel_build.csh` clones the tree if it is absent and then builds (`README.md`). `CMakePresets.json` and `presets/` hold presets. In-source builds are rejected (`CMakeLists.txt`).
- The fixture defines no tests. The regression tests (`ctest -L REGRESSION`) come from component repositories, which call `esma_add_regression_tests` (`@cmake/esma_support/esma_regression_tests.cmake`); they read data from `$LOCAL_REGRESSION_DATA_DIR`, which is set at configure time. CI builds the fixture with several compilers (`.github/workflows/workflow.yml`).
- Pull requests for this line target `release/MAPL-v3`, not `main`. They need a 0-diff/non-0-diff label (`.github/workflows/enforce-labels.yml`) and get an entry under "Unreleased" in `CHANGELOG.md` (by convention; no workflow checks it).
