# GEOSgcm fixture architecture

A map of the fixture: which repository holds what, how CMake joins them, and where the run-time tree and its configuration begin. Paths are relative to the fixture root, and `GG` stands for `src/Components/@GEOSgcm_GridComp`. This page names files and routines rather than linking to lines. It describes only what changes rarely; the build status, rules and traps are in [`AGENTS.md`](../AGENTS.md).

## Bird's-eye view

The model is split into about 44 repositories listed in `components.yaml` (entry `GEOSgcm: fixture: true`). `mepo` (multiple-repository manager, used instead of Git submodules) clones each repository to its `local:` path (`README.md`, "Mepo"). Each entry gives a `remote`, a `tag` or a `branch`, usually a `develop` branch, and optionally `sparse` (a pattern file under `config/`), `blobless` or `recurse_submodules`. `mepo status` shows each repository's branch `(b)`, tag `(t)` or detached HEAD `(DH)`. `mepo-cd <component>` moves between the component repositories (`mepo-cd` alone returns to the fixture root); it is a shell function around `mepo whereis -i <component>`, so in a non-interactive shell use `mepo whereis` to get the path.

Repositories nest inside each other: `@GEOSchem_GridComp` is inside `GG`, and `@GOCART` is inside `@GEOSchem_GridComp`. The leading `@` marks a directory owned by another repository; it is not part of the repository's name.

## Repository tree

| Area | Repositories (local path) |
|---|---|
| Build and environment | ESMA_env (`@env`: `g5_modules*`), ESMA_cmake (`@cmake`: `esma.cmake`, `esma_support/`), ecbuild (`@cmake/@ecbuild`) |
| Framework | MAPL (`src/Shared/@MAPL`), GEOS_FieldDictionary (`src/Shared/@MAPL/@GEOS_FieldDictionary`) |
| Shared libraries | GMAO_Shared (`src/Shared/@GMAO_Shared`, sparse), GEOS_Util (`.../@GMAO_Shared/@GEOS_Util`), GMAO_perllib, NCEP_Shared (`src/Shared/@NCEP_Shared`, sparse) |
| Model components | GEOSgcm_GridComp (`GG`, sparse), which holds most components and nests FVdycoreCubed_GridComp, GEOSchem_GridComp (which nests GOCART, HEMCO, QuickChem and the other Chemistry children), GEOSradiation_GridComp and GEOS_OceanGridComp |
| Upstream science codes | fvdycore (GFDL_atmos_cubed_sphere), geos-chem, mom, mom6, mit, cice6, Icepack, sis2, ww3, umwm, RRTMGP (sparse), GigaTraj, geos_state_bias, Topo, each nested in the GEOS component that wraps it |
| Applications | GEOSgcm_App (`src/Applications/@GEOSgcm_App`), UMD_Etc, CPLFCST_Etc, GenCast_GEOS-FP (`src/FoundationModels`) |

`components.yaml` is the source of truth for paths and versions.

## Build structure

```
CMakeLists.txt          project GEOSgcm; finds @cmake; include(esma)
  |-- @env
  `-- src/CMakeLists.txt
        |-- Shared/       GMAO_Shared, NCEP_Shared, MAPL (if no external MAPL)
        |-- Components/   GEOSgcm_GridComp, and below it the component tree
        |-- Applications/
        `-- FoundationModels/
```

- **Top `CMakeLists.txt`.** Finds `cmake`, `@cmake` or `cmake@`, puts it on `CMAKE_MODULE_PATH`, then `include (esma)`, `ecbuild_declare_project()`, adds `@env` and `src`. It also sets `FV_PRECISION` (default `R4R8`) and rejects in-source builds.
- **ESMA_cmake** (`@cmake/esma.cmake`): compiler and MPI detection, library discovery (`FindBaselibs`, else `ConfigureExternalLibraries`), then the `esma_support` macros.
- **Joining a nested repository.** `esma_add_subdirectory(name)` tries `name`, `@name` and `name@` and adds the first that exists. A missing directory is only a debug message (`@cmake/esma_support/esma_add_subdirectories.cmake`, `esma_mepo_style.cmake`).
- **One library per component directory.** `esma_set_this()`, then `esma_add_library(${this} SRCS ... SUBCOMPONENTS ... DEPENDENCIES ...)`. For each `SUBCOMPONENTS` name, `esma_add_library` strips `@`, adds the directory, and generates a stub component (MAPL's `mapl_stub.pl`) when the directory is missing. The library depends only on the subcomponents that are not stubbed (`esma_add_library.cmake`, `esma_create_stub_component.cmake`). The pattern repeats down the tree.
- **Options:** `BUILD_WITH_GIGATRAJ`, `BUILD_WITH_PYMLINC` (`GG/CMakeLists.txt`), `BUILD_MIT_OCEAN`, `FV_PRECISION`.

## Top of the run-time tree

In the full model, the executable runs MAPL's cap with `GCM` as root (`ROOT_NAME: GCM` in `GEOSgcm_App`'s `CAP.rc.tmpl`), next to History and ExtData. `GCM` (`GG/GEOS_GcmGridComp.F90`) adds its children in `SetServices`, chosen by resources:

```
GCM
|-- AGCM      unless USE_DATA_ATM4OCN (then DATAATM)     GG/GEOSagcm_GridComp: SUPERDYNAMICS, PHYSICS, ORBIT
|-- AIAU, ADFI   (not with DATAATM)                      GG/GEOSmkiau_GridComp
|-- GIGATRAJ     (not with DATAATM; HAS_GIGATRAJ)        GG/GEOSgigatraj_GridComp
|-- OGCM                                                 GG/GEOSogcm_GridComp: OBIO, ORAD, SEAICE, OCEAN
`-- WGCM         if USE_WAVES /= 0                       GG/GEOSwgcm_GridComp
```

Below this level, each component's repository describes its own children: the Agcm subtree in `GG/GEOSagcm_GridComp/docs/ARCHITECTURE.md`, Chemistry, Radiation, FVdycoreCubed and Ocean in their repositories' `docs/ARCHITECTURE.md`. Most children are chosen at run time by resources (`DYCORE`, `OCEAN_NAME`, the `ENABLE_*` keys of `GEOS_ChemGridComp.rc`), and only a few at build time (`BUILD_WITH_GIGATRAJ`, `BUILD_MIT_OCEAN`), so one executable serves many configurations.

## Where run-time configuration lives

`GEOSgcm_App` installs templates (`*.tmpl`) and setup scripts. `gcm_setup` copies the templates to an experiment directory and fills their `@NAME` placeholders with `sed`; `CAP.rc` names `AGCM.rc` as the root configuration, which the `GCM` tree reads through MAPL. Some components also read their own files (`GEOS_ChemGridComp.rc`, `GEOS_SurfaceGridComp.rc`, `WGCM.rc`). The keys, defaults and setup steps are in `src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md`.
