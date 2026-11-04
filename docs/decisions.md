# GEOSgcm fixture: previous architectural decisions

**Audience:** coding agents and developers working on the GEOSgcm fixture.
**Describes:** the MAPL2 line, branch `main`.
**Verified against:** `GEOSgcm` @ `0f2e0fb` (2026-11-04); nested repositories as listed in [ARCHITECTURE.md](ARCHITECTURE.md) (development-branch heads, not the pinned tags).
**Placement:** as in the GEOSgcm fixture (`components.yaml` @ `0f2e0fb`).
Other fixtures (for example GEOSadas, GEOSldas) may place this repository
elsewhere; paths inside this repository do not change.

Only what is easy to see now; see [ARCHITECTURE.md](ARCHITECTURE.md) for
context.

### Fixture of nested repositories managed by mepo
- Pattern: the model is split into about 44 repositories listed in
  `components.yaml` (`GEOSgcm: fixture: true`) and cloned into fixed paths by
  `mepo`, not by Git submodules (`components.yaml`; `README.md`, "Setting up
  `mepo`"). Repositories nest inside each other, for example
  `GEOSchem_GridComp` inside `GEOSgcm_GridComp` and `GOCART` inside
  `GEOSchem_GridComp` (`components.yaml`, `local:`).
- Likely reason: *Inferred:* components and upstream codes are developed and
  released independently by different groups, and several fixtures reuse them.
- Question for maintainers: is the nesting depth (for example `GOCART`,
  `QuickChem` and `HEMCO` inside `GEOSchem_GridComp` inside
  `GEOSgcm_GridComp`) a deliberate choice or history?

### Leading `@` in nested directory names, found by CMake
- Pattern: nested repositories sit in `@name` directories; CMake looks for
  `name`, `@name` and `name@` and uses the first that exists
  (`@cmake/esma_support/esma_mepo_style.cmake`, `esma_mepo_style`;
  `esma_add_subdirectories.cmake`, `esma_add_subdirectory`). The top
  `CMakeLists.txt` does the same for `cmake` and `env`, and `.gitignore`
  lists the three spellings.
- Likely reason: *Inferred:* the `@` marks directories owned by another
  repository so they are visible in listings, while older checkouts without
  the marker still build.

### Pinned tags in releases, `develop` branches on request
- Pattern: most entries carry `tag:` (reproducible release) and a
  `develop:` branch; `mepo develop <names>` switches to the branch, and
  `parallel_build.csh -develop` does this for four repositories only
  (`components.yaml`; `parallel_build.csh`; `README.md`, "Develop Version of
  GEOS GCM").
  `MAPL` is pinned to a tag but its `develop:` is `release/v2`
  (`components.yaml`, entry `MAPL`).
- Likely reason: *Inferred:* the fixture `main` should always name a tested
  set of versions; developers of the four repositories need their heads.
- Question for maintainers: why are only these four in the `-develop` set?

### Sparse checkouts of shared repositories
- Pattern: `GMAO_Shared`, `NCEP_Shared`, `GEOSgcm_GridComp` and `RRTMGP`
  carry a `sparse:` file under `config/` that restricts what is checked out
  (`components.yaml`; `config/*.sparse`). Missing directories are skipped by
  the build, and a missing subcomponent becomes a generated stub
  (`@cmake/esma_support/esma_add_library.cmake`, `esma_add_library`,
  `SUBCOMPONENTS`).
- Likely reason: *Inferred:* these repositories hold code that the GCM does
  not use (for example data-assimilation libraries in `GMAO_Shared`,
  Held-Suarez in `GEOSgcm_GridComp`) and that would slow the build.

### Upstream science codes reached through plug-in components
- Pattern: upstream models (MOM5, MOM6, MITgcm, CICE, WW3, umwm, geos-chem,
  GFDL cubed-sphere) are separate repositories nested inside the GEOS
  component that wraps them (`components.yaml`, `local:`; section 2.6 of
  `ARCHITECTURE.md`). The MOM, MOM6 and CICE6 plug-ins are shared libraries
  (`TYPE SHARED` in the plug-in `CMakeLists.txt`) added as children by name
  with `sharedObj` (`GEOS_OceanGridComp.F90`, `GEOS_SeaIceGridComp.F90`); they
  are also listed as CMake `SUBCOMPONENTS` of the ocean and sea-ice libraries
  (`@GEOS_OceanGridComp/CMakeLists.txt`, `GEOSseaice_GridComp/CMakeLists.txt`),
  which makes them link dependencies of those libraries
  (`@cmake/esma_support/esma_add_library.cmake`). *Unverified:* whether
  `GEOSgcm.x` itself links them; not checked in a build.
- Likely reason: *Inferred:* an ocean or sea-ice model can be chosen by a
  resource (`OCEAN_NAME`, `SEAICE_NAME`) and the upstream build systems and
  precision settings stay isolated in their own libraries.

### Run-time component tree selected by resources, not by build
- Pattern: most children of `GCM` are chosen in `SetServices` by resources
  such as `USE_DATA_ATM4OCN`, `USE_WAVES`, `DYCORE`, `OCEAN_NAME` and the
  `ENABLE_*` keys of `GEOS_ChemGridComp.rc`; only a few are chosen at build
  time (`BUILD_WITH_GIGATRAJ`, `BUILD_MIT_OCEAN`; the guards `AQUA_PLANET` and
  `SCM` are also preprocessor-time, *Unverified:* where they are defined)
  (`GEOS_GcmGridComp.F90`; `GEOS_SuperdynGridComp.F90`;
  `GEOS_ChemGridComp.F90`).
- Likely reason: *Inferred:* one executable serves many configurations, set
  up per experiment by `gcm_setup` from templates.

### Run-time configuration generated from templates by `gcm_setup`
- Pattern: `AGCM.rc.tmpl`, `CAP.rc.tmpl`, `HISTORY*.rc.tmpl` and `gcm_run.j`
  hold `@NAME` placeholders that `gcm_setup` replaces with `sed` to make the
  experiment's files (`src/Applications/@GEOSgcm_App/gcm_setup`; CMake
  `configure_file(... @ONLY)` for the setup scripts themselves in
  `src/Applications/@GEOSgcm_App/CMakeLists.txt`).
- Likely reason: *Inferred:* the number of options is large and one template
  family keeps coupled, atmosphere-only and data-ocean runs consistent.
