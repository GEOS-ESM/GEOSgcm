# GEOSgcm fixture: system map

**Audience:** coding agents and developers working on the GEOSgcm fixture or arriving at the top of the GEOS atmosphere-ocean model source tree.
**Describes:** the MAPL2 line, branch `main`.
**Verified against:** `GEOSgcm` @ `0f2e0fb` (2026-11-04). Nested repositories were read as `mepo clone` left them: development-branch heads, not the tags `components.yaml` pins (except `@env`, `@cmake`, `@cmake/@ecbuild`, which were on tags). Cited nested repositories and heads:
`GEOSgcm_GridComp` @ `45e1f86f` (base `develop`), `GEOSchem_GridComp` @ `d6ad829` (`develop`), `GEOSradiation_GridComp` @ `0b402f6` (`develop`), `FVdycoreCubed_GridComp` @ `4deed15` (`develop`), `GEOS_OceanGridComp` @ `8d91ab7` (`develop`), `GEOSgcm_App` @ `9ef207f` (`develop`), `MAPL` @ `dc0eec14` (`release/v2`), `GMAO_Shared` @ `b0ebdca` (`main`), `GEOS_Util` @ `5b87f93` (`main`), `NCEP_Shared` @ `9b837cb` (`main`), `@cmake` (ESMA_cmake) @ `9833af5`, `@env` (ESMA_env) @ `d94be5e`, `@cmake/@ecbuild` @ `a34a9f4`.
**Placement:** as in the GEOSgcm fixture (`components.yaml` @ `0f2e0fb`).
Other fixtures (for example GEOSadas, GEOSldas) may place this repository
elsewhere; paths inside this repository do not change.

Paths are relative to the fixture root unless stated. Nested repositories use
a leading `@` in their directory name (for example
`src/Components/@GEOSgcm_GridComp`); the `@` is not part of the repository name.
Detail below the fixture level: [GEOSgcm_GridComp architecture](../src/Components/@GEOSgcm_GridComp/docs/ARCHITECTURE.md),
[its AGENTS.md](../src/Components/@GEOSgcm_GridComp/AGENTS.md), and, for the atmosphere composite
(dynamics, physics, IAU/replay) in depth,
[GEOSagcm_GridComp architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/ARCHITECTURE.md).
Unlabelled statements are Verified and carry a citation.

## 0. Where to look for X

| Question | Go to |
|---|---|
| which repository holds a component, at which version | section 2, `components.yaml` |
| which children a component creates, and under what condition | section 3 |
| why a library is built or stubbed | section 4 |
| which resource key selects a scheme, and where it is set | section 5 |
| physics run order and physics components | the physics `ARCHITECTURE.md` linked in section 3 |

## 1. What the fixture is

- The `GEOSgcm` repository holds almost no model code: `components.yaml`, the
  top `CMakeLists.txt`, the `src/CMakeLists.txt` files that join the nested
  repositories, `config/*.sparse`, `parallel_build.csh`, CMake presets
  (`CMakePresets.json`, `presets/`) and CI files (`components.yaml`, entry
  `GEOSgcm: fixture: true`).
- **Fixture** means: a repository whose `components.yaml` lists other
  repositories to clone into it. The tool is `mepo` (multiple-repository
  manager), used instead of Git submodules (`README.md`, "Setting up `mepo`").
  `mepo clone` assembles the tree; `mepo status` shows each repository with its
  branch `(b)` or tag `(t)` (`README.md`, "Mepo").
- `components.yaml` has 44 nested entries (count of `local:` keys). Each gives
  `local` (path), `remote`, a pinned `tag`, and usually a `develop` branch;
  optional keys are `sparse` (a pattern file under `config/`), `blobless`,
  `recurse_submodules`, `ignore_submodules`. No entry uses a `branch:` key
  (`components.yaml`).
- `mepo develop <repos>` switches the named repositories to their `develop:`
  branch. The README and `parallel_build.csh -develop` do this for
  `GEOSgcm_GridComp`, `GEOSgcm_App`, `GMAO_Shared` and `GEOS_Util` only
  (`README.md`, "Develop Version of GEOS GCM"; `parallel_build.csh`).
- Tag-pinned repositories show `(DH)`, detached HEAD, in `mepo status`.
  *Inferred:* an edit there belongs on a branch of that repository, followed by
  a new `tag:` in `components.yaml`.
- Other fixtures use their own `components.yaml` and may place the same
  repositories at other paths. *Unverified:* a comment in
  `GEOSland_GridComp/GEOS_LandGridComp.F90` ("includes GEOSldas ensemble
  simulations") suggests land code is shared with GEOSldas.

## 2. Repository tree

Source of truth: `components.yaml`. `GG` below abbreviates
`src/Components/@GEOSgcm_GridComp`.

### 2.1 Build and environment
| Repository | Local path | Role |
|---|---|---|
| GEOSgcm | `.` | fixture root |
| ESMA_env (`env`) | `@env` | `g5_modules`, `g5_modules.sh`, `g5_modules.zsh`, `build.csh`, `*.rc.in` (`@env/CMakeLists.txt` installs the first two and configures the `*.rc.in`) |
| ESMA_cmake (`cmake`) | `@cmake` | GEOS CMake modules (`esma.cmake`, `esma_support/`) |
| ecbuild | `@cmake/@ecbuild` | ecbuild, nested in `@cmake` |

### 2.2 Shared libraries
| Repository | Local path | Role |
|---|---|---|
| GMAO_Shared | `src/Shared/@GMAO_Shared` | shared libraries and tools (`GEOS_Shared`, `GMAO_mpeu`, `GMAO_gfio`, `GMAO_hermes`, `GMAO_transf`, `GMAO_etc`, `GMAO_stoch`, `LANL_Shared/CICE4`; see [its document](../src/Shared/@GMAO_Shared/docs/ARCHITECTURE.md)); sparse (`config/GMAO_Shared.sparse`; `src/Shared/@GMAO_Shared/CMakeLists.txt`) |
| GEOS_Util | `src/Shared/@GMAO_Shared/@GEOS_Util` | *Inferred:* post-processing and plotting utilities (directories `post`, `pre`, `plots`) |
| GMAO_perllib | `src/Shared/@GMAO_Shared/@GMAO_perllib` | Perl library |
| NCEP_Shared | `src/Shared/@NCEP_Shared` | NCEP libraries (`NCEP_sp`, `NCEP_w3`, ...); sparse (`config/NCEP_Shared.sparse`) |

### 2.3 MAPL
`src/Shared/@MAPL`: MAPL (Modeling Analysis and Prediction Layer), the
framework over ESMF (Earth System Modeling Framework). `develop:` is
`release/v2` (`components.yaml`). Built from source only when no external MAPL
is found (`src/Shared/CMakeLists.txt`). Provides `MAPL_Cap` (the main driver)
and the History, ExtData and Orbit gridded components
(`src/Shared/@MAPL/gridcomps/`).

### 2.4 GEOS component repositories
| Repository | Local path | Role |
|---|---|---|
| GEOSgcm_GridComp | `GG` | root `GCM` component and most components; sparse (`config/GEOSgcm_GridComp.sparse`) |
| FVdycoreCubed_GridComp | `GG/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp` | cubed-sphere finite-volume dynamical core (module `FVdycoreCubed_GridComp`, `DynCore_GridCompMod.F90`); [architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp/docs/ARCHITECTURE.md) |
| GEOSchem_GridComp | `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp` | `CHEMISTRY` component (`GEOS_ChemGridComp.F90`); [architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/docs/ARCHITECTURE.md) |
| GEOSradiation_GridComp | `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp` | `RADIATION` with `SOLAR`, `IRRAD`, `SATSIM` (`GEOS_RadiationGridComp.F90`); [architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp/docs/ARCHITECTURE.md) |
| GEOS_OceanGridComp | `GG/GEOSogcm_GridComp/@GEOS_OceanGridComp` | `OCEAN` component and ocean plug-ins (`GEOS_OceanGridComp.F90`); [architecture](../src/Components/@GEOSgcm_GridComp/GEOSogcm_GridComp/@GEOS_OceanGridComp/docs/ARCHITECTURE.md) |

### 2.5 Chemistry repositories (inside GEOSchem_GridComp)
Path prefix `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/`.
Chemistry architecture: [GEOSchem_GridComp](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/docs/ARCHITECTURE.md). `GOCART` (`@GOCART`; `GOCART`, `GOCART2G`; [architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/@GOCART/docs/ARCHITECTURE.md)), `ACHEM`, `CARMA`, `GAAS`, `GMI`,
`MAM`, `MATRIX`, `RRG`, `StratChem`, `TR` (each `@<name>`) are Chemistry
children, enabled by `ENABLE_*` keys (section 3). `HEMCO` (`Shared/HEMCO/@HEMCO`)
is source for `HEMCO_GridComp`. `QuickChem` (`@QuickChem`) is cloned but is not
a Chemistry child (no `MAPL_AddChild` for it in `GEOS_ChemGridComp.F90`).

### 2.6 Upstream science codes and their GEOS wrapper
An *upstream code* is a model developed outside GEOS and cloned from a
GEOS-ESM fork, nested inside the GEOS wrapper component that builds it. `PHYS` =
`GG/GEOSagcm_GridComp/GEOSphysics_GridComp`, `OCN` = `GG/GEOSogcm_GridComp/@GEOS_OceanGridComp`.

| Upstream (fixture name) | Nested at | Wrapper |
|---|---|---|
| GFDL_atmos_cubed_sphere (`fvdycore`) | `.../@FVdycoreCubed_GridComp/@fvdycore` | `FVdycoreCubed_GridComp` (`SUBCOMPONENTS fvdycore`) |
| geos-chem | `PHYS/@GEOSchem_GridComp/GEOSCHEMchem_GridComp/@geos-chem` | `GEOSCHEMchem_GridComp` (globs `@geos-chem` sources) |
| MOM5 (`mom`) | `OCN/MOM_GEOS5PlugMod/@mom` | `MOM_GEOS5PlugMod` |
| MOM6, stochastic_physics | `OCN/MOM6_GEOSPlug/@mom6`, `.../@stochastic_physics` | `MOM6_GEOSPlug` (stochastic physics optional) |
| MITgcm (`mit`) | `OCN/MIT_GEOS5PlugMod/@mit` | `MIT_GEOS5PlugMod` (with `BUILD_MIT_OCEAN`) |
| CICE (`cice6`), Icepack | `GG/GEOSogcm_GridComp/GEOSseaice_GridComp/CICE_GEOSPlug/@cice6` | `CICE_GEOSPlug` (`cice6_cmake`) |
| SIS2 (`sis2`) | `.../CICE_GEOSPlug/@sis2` | none found: no `CMakeLists.txt` under `GEOSogcm_GridComp` mentions `sis2` |
| WW3, umwm | `GG/GEOSwgcm_GridComp/GEOSwavewatch_GridComp/@ww3`, `.../GEOSumwm_GridComp/@umwm` | `GEOSwavewatch_GridComp`, `GEOSumwm_GridComp` |
| rte-rrtmgp (`RRTMGP`) | `.../@GEOSradiation_GridComp/GEOS_RadiationShared/@RRTMGP` | `GEOS_RadiationShared` (depends on `RRTMGP`) |
| gigatraj | `GG/GEOSgigatraj_GridComp/@GigaTraj` | `GEOSgigatraj_GridComp` (`BUILD_WITH_GIGATRAJ`) |
| geos_state_bias | `GG/GEOSmkiau_GridComp/pyMLINC/@geos_state_bias` | `GEOSmkiau_GridComp` (`BUILD_WITH_PYMLINC`) |
| Topo (`ncar_topo`) | `PHYS/GEOSsurface_GridComp/Utils/Raster/preproc/topography/@ncar_topo` | surface preprocessing tool |

### 2.7 Applications and other
| Repository | Local path | Role |
|---|---|---|
| GEOSgcm_App | `src/Applications/@GEOSgcm_App` | main program `GEOSgcm.F90`, setup scripts, run-time templates (section 5); [architecture](../src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md) |
| UMD_Etc | `src/Applications/@UMD_Etc` | *Inferred:* University of Maryland tools (`UMD_oletkf`, `UMD_rc`) |
| CPLFCST_Etc | `src/Applications/@CPLFCST_Etc` | *Inferred:* coupled forecast scripts |
| GenCast_GEOS-FP | `src/FoundationModels/@GenCast_GEOS-FP` | *Inferred:* machine-learning forecast model; the directory is installed, not built (`src/FoundationModels/CMakeLists.txt`) |

## 3. Run-time component tree

`GEOSgcm.x` runs `MAPL_Cap('GCM', ROOT_SetServices, ...)`, where
`ROOT_SetServices` is `SetServices` of `GEOS_GcmGridCompMod`
(`src/Applications/@GEOSgcm_App/GEOSgcm.F90`, program `GEOS5_Main`). The cap
adds the root, `HIST` (History) and `EXTDATA` (external data) as its children
(`src/Shared/@MAPL/gridcomps/Cap/MAPL_CapGridComp.F90`, `MAPL_AddChild`). Every
node below is a `MAPL_AddChild` in the `SetServices` of its parent's source file
(`GEOS_<Parent>GridComp.F90`, in the parent's directory). Conditions are of two
kinds: **resources** read in that `SetServices`, and **preprocessor guards**
(`HAS_GIGATRAJ`, set by `BUILD_WITH_GIGATRAJ` in `GG/CMakeLists.txt`;
`BUILD_MIT_OCEAN`, set in `GEOSogcm_GridComp/CMakeLists.txt` and
`GEOSseaice_GridComp/CMakeLists.txt`; `SCM`; `AQUA_PLANET`). No CMake file in
the fixture outside MAPL defines `SCM` or `AQUA_PLANET` (grep); *Unverified:*
where they are defined.
AGCM is the atmospheric general circulation model; GCM the coupled model; SCM
*Inferred:* single-column model (script names `scm_setup`, `scm_run.j`).
`GG` = `src/Components/@GEOSgcm_GridComp`; a repository name means that
repository holds the component.

```
CAP (MAPL)  --  children: GCM, HIST (MAPL History), EXTDATA (MAPL ExtData)
GCM  (GG/GEOS_GcmGridComp.F90)
|-- DATAATM        if USE_DATA_ATM4OCN                     GG/GEOSdataatm_GridComp
|     `-- SURFACE  (the surface SetServices)
|-- AGCM           otherwise                               GG/GEOSagcm_GridComp
|   |-- SUPERDYNAMICS  (SCMDYNAMICS if built with SCM)      GG/.../GEOSsuperdyn_GridComp
|   |   |-- DYN    DYCORE=FV3|FV3+ADV: FVdycoreCubed_GridComp;  DYCORE=DATMO: GG/.../GEOSdatmodyn_GridComp
|   |   `-- ADV    only DYCORE=FV3+ADV                     FVdycoreCubed_GridComp (AdvCore_GridCompMod)
|   |-- PHYSICS                                            GG/.../GEOSphysics_GridComp
|   |   |-- GWD, MOIST, TURBULENCE                         GG/.../GEOSgwd_, GEOSmoist_, GEOSturbulence_GridComp
|   |   |-- CHEMISTRY                                      GEOSchem_GridComp (architecture linked in 2.4)
|   |   |     CHEMENV, HEMCO, PCHEM, ACHEM, GOCART, GOCART.data, GOCART2G, RRG, GAAS, H2O,
|   |   |     STRATCHEM, GMICHEM, CARMA, GEOSCHEMCHEM, MATRIX, MAM, MAM.data, TR, DNA
|   |   |     (all but CHEMENV only if ENABLE_<name> is true in GEOS_ChemGridComp.rc)
|   |   |-- SURFACE                                        GG/.../GEOSsurface_GridComp
|   |   |     SALTWATER; unless AQUA_PLANET: LAKE, LANDICE, LAND, ROUTE
|   |   |       LAND:      VEGDYN, CATCH (LSM_CHOICE=1) or CATCHCN (2,3), IGNI (FIRE_DANGER)
|   |   |       SALTWATER: SEAICETHERMO (variant by USE_CICE_Thermo), OPENWATER,
|   |   |                  OBIOIMPORTS (if USE_OCEANOBIOGEOCHEM /= 0)
|   |   `-- RADIATION                                      GEOSradiation_GridComp
|   |         SOLAR, IRRAD, SATSIM (if the sum of USE_SATSIM and the USE_SATSIM_* keys > 0)
|   `-- ORBIT                                              MAPL gridcomps/Orbit
|-- GIGATRAJ  (not with DATAATM; only with HAS_GIGATRAJ)   GG/GEOSgigatraj_GridComp
|-- AIAU      (not with DATAATM) incremental analysis update  GG/GEOSmkiau_GridComp
|-- ADFI      (not with DATAATM) digital filter            GG/GEOSmkiau_GridComp (DFI_GridComp.F90)
|-- OGCM                                                   GG/GEOSogcm_GridComp
|   |-- OBIO       if USE_OCEANOBIOGEOCHEM /= 0            GG/.../GEOS_OceanBioGeoChemGridComp
|   |-- ORAD       (GEOS_OradBioGridComp if OBIO)          GG/.../GEOS_OradGridComp
|   |-- SEAICE                                             GG/.../GEOSseaice_GridComp
|   |     USE_DATASEAICE /= 0: DATASEAICE. Else with BUILD_MIT_OCEAN: MITSEAICEDYNA
|   |     (SEAICE_NAME not read); else SEAICE_NAME = CICE4 | CICE6
|   `-- OCEAN                                              GEOS_OceanGridComp
|         USE_DATASEA /= 0: DATASEA. Else OCEAN_NAME = MOM | MOM6 | MIT (MIT only with BUILD_MIT_OCEAN)
|         (the Ogcm composite itself reads OCEAN_NAME whatever USE_DATASEA is; see section 5)
`-- WGCM           if USE_WAVES /= 0                       GG/GEOSwgcm_GridComp
      UMWM or WW3plug by wave_model in WGCM.rc (any other value raises an error)
```

Files holding the `MAPL_AddChild` calls: `GEOS_GcmGridComp.F90`,
`GEOS_AgcmGridComp.F90`, `GEOS_SuperdynGridComp.F90` (`DYCORE:`),
`GEOS_PhysicsGridComp.F90`, `GEOS_ChemGridComp.F90`, `GEOS_SurfaceGridComp.F90`,
`GEOS_LandGridComp.F90`, `GEOS_SaltWaterGridComp.F90`,
`GEOS_RadiationGridComp.F90`, `GEOS_OgcmGridComp.F90`,
`GEOS_SeaIceGridComp.F90`, `GEOS_OceanGridComp.F90`, `GEOS_WgcmGridComp.F90`,
`GEOS_DataAtmGridComp.F90` (only `SURFACE`).

Points that matter when reading the tree:
- **Physics run order** (`GEOS_PhysicsGridComp.F90`, `Run`): GWD, MOIST; stage 1
  sync of U/V and T/Q (`SYNCUV`, `SYNCTQ`); SURFACE phase 1, CHEMISTRY phase 1,
  TURBULENCE phase 1; negative-water fill and stage 2 sync; SURFACE phase 2,
  TURBULENCE phase 2; negative-water fill and stage 3 sync (feeds RADIATION
  and CHEMISTRY phase 2); CHEMISTRY phase 2; RADIATION. This differs from the
  `SetServices` child order. Detail: [physics architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/ARCHITECTURE.md);
  also [turbulence](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSturbulence_GridComp/ARCHITECTURE.md),
  [gravity-wave drag](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSgwd_GridComp/ARCHITECTURE.md),
  [moist](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSmoist_GridComp/ARCHITECTURE.md),
  [surface](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSsurface_GridComp/ARCHITECTURE.md).
- **Plug-ins loaded by name.** `MOM`, `MOM6` and `CICE6` are added with
  `MAPL_AddChild(name, 'setservices_', parentGC=GC, sharedObj=...)` from shared
  libraries named by resources `MOM_GEOS5PLUGMOD:`, `MOM6_GEOSPLUG:`,
  `CICE_GEOSPLUG:` (`GEOS_OceanGridComp.F90`, `GEOS_SeaIceGridComp.F90`). The
  plug-ins are built `TYPE SHARED` (their `CMakeLists.txt`) *and* are CMake
  `SUBCOMPONENTS` of `GEOS_OceanGridComp` / `GEOS_Seaice_GridComp`
  (`@GEOS_OceanGridComp/CMakeLists.txt`, `GEOSseaice_GridComp/CMakeLists.txt`),
  and `esma_add_library` adds non-stubbed subcomponents to the library's
  dependencies (`@cmake/esma_support/esma_add_library.cmake`). *Unverified:*
  whether `GEOSgcm.x` is therefore also linked against them; not checked in a
  build.
- `CICE4` is built from `src/Shared/@GMAO_Shared/LANL_Shared/CICE4` (library
  dependency in `GEOSogcm_GridComp/CMakeLists.txt`).
- `DUAL_OCEAN` adds a second `DATASEA` child (`OCEAN`) and a second
  `DATASEAICE` child (`SEAICE`) (`GEOS_OceanGridComp.F90`, `GEOS_SeaIceGridComp.F90`).
- Chemistry, radiation, dynamical-core and ocean repositories have their own
  architecture documents, linked in section 2.4 ([Chemistry](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/docs/ARCHITECTURE.md), [Radiation](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp/docs/ARCHITECTURE.md), [FVdycoreCubed](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp/docs/ARCHITECTURE.md), [Ocean](../src/Components/@GEOSgcm_GridComp/GEOSogcm_GridComp/@GEOS_OceanGridComp/docs/ARCHITECTURE.md); aerosols: [GOCART](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/@GOCART/docs/ARCHITECTURE.md); application: [GEOSgcm_App](../src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md)).

## 4. Build structure

```
CMakeLists.txt                  project GEOSgcm; finds ESMA_cmake; include(esma)
  |-- esma_add_subdirectory(env)    (@env)
  `-- src/CMakeLists.txt
        |-- Shared/        GMAO_Shared, NCEP_Shared, then MAPL
        |-- Components/    GEOSgcm_GridComp
        |-- Applications/  GEOSgcm_App, UMD_Etc, CPLFCST_Etc
        `-- FoundationModels/   installs GenCast_GEOS-FP (no build)
```

- **Top `CMakeLists.txt`.** Walks the spellings `cmake`, `@cmake`, `cmake@`,
  puts the existing one on `CMAKE_MODULE_PATH` and `ESMA_CMAKE_PATH`, then
  `include (esma)`, `ecbuild_declare_project()`,
  `esma_mepo_style(env env_dir)` + `esma_add_subdirectory (${env_dir})`,
  `add_subdirectory (src)`. It also sets `FV_PRECISION` (default `R4R8`) and
  option `INSTALL_SOURCE_TARFILE`; in-source builds are an error (`CMakeLists.txt`).
- **ESMA_cmake** (`@cmake/esma.cmake`): `ecbuild_system`, compiler and MPI
  detection, library discovery (`FindBaselibs`, else `ConfigureExternalLibraries`),
  then `esma_support`, which defines the macros below.
- **Joining a nested repository.** `esma_add_subdirectory(name)` calls
  `esma_mepo_style`, which tries `name`, `@name`, `name@` in the current source
  directory and calls `add_subdirectory` on the first that exists; a missing
  directory is not an error (debug message only)
  (`@cmake/esma_support/esma_add_subdirectories.cmake`; `esma_mepo_style.cmake`).
  Hence sparse checkouts and absent repositories are tolerated.
- **Libraries.** Most component directories are one CMake library:
  `esma_set_this()`, then `esma_add_library(${this} SRCS ... SUBCOMPONENTS ...
  DEPENDENCIES ...)`. Some override the name: `GEOSseaice_GridComp` is
  `GEOS_Seaice_GridComp` (`esma_set_this (OVERRIDE ...)`), `GEOSsurface_GridComp/Shared`
  is `GEOS_SurfaceShared`. For every `SUBCOMPONENTS` name `esma_add_library`
  strips `@`, calls `esma_add_subdirectory`, and if the directory is missing
  generates a stub component with MAPL's `mapl_stub.pl`; the library depends
  only on the non-stubbed ones (`esma_add_library.cmake`;
  `esma_create_stub_component.cmake`). Example: `GG/CMakeLists.txt` builds
  `GEOSgcm_GridComp` from `GEOS_GcmGridComp.F90` with `SUBCOMPONENTS
  GEOSagcm_GridComp GEOSdataatm_GridComp GEOSmkiau_GridComp GEOSogcm_GridComp
  GEOSwgcm_GridComp` (+ `GEOSgigatraj_GridComp` with `BUILD_WITH_GIGATRAJ`). The
  pattern repeats down the tree.
- **Held-Suarez switch.** `GEOSagcm_GridComp/CMakeLists.txt` builds the
  Held-Suarez model if `GEOS_AgcmSimpleGridComp.F90` exists and the full AGCM if
  `GEOS_AgcmGridComp.F90` exists. `config/GEOSgcm_GridComp.sparse` is three
  lines: `/*`, then `!/GEOSagcm_GridComp/GEOS_AgcmSimpleGridComp.F90` and
  `!/GEOSagcm_GridComp/GEOShs_GridComp` (`config/GEOSgcm_GridComp.sparse`).
  *Inferred:* `/*` includes everything in the sparse checkout, and the two
  `!` lines exclude the Held-Suarez file and directory from it, so the
  default checkout has the full AGCM but not Held-Suarez, and the full AGCM
  branch is taken.
- **Options:** `BUILD_WITH_GIGATRAJ`, `BUILD_WITH_PYMLINC` (`GG/CMakeLists.txt`);
  `BUILD_MIT_OCEAN`; `FV_PRECISION`.
- **Executables:** `GEOSgcm.x` (links `GEOSgcm_GridComp`) and `idfupd.x`
  (`src/Applications/@GEOSgcm_App/CMakeLists.txt`).
- **MAPL** is built from `src/Shared/@MAPL` unless an external one is found
  (`src/Shared/CMakeLists.txt`). A comment in `components.yaml` says a breaking
  MAPL change also needs an edit in `ESMA_cmake/external_libraries/ConfigureExternalLibraries.cmake`.
- **Build commands** (`README.md`): `./parallel_build.csh` (runs `mepo clone
  --partial blobless` if the tree is absent, then builds; `parallel_build.csh`),
  or `source @env/g5_modules`, `cmake -B build -S . -DCMAKE_INSTALL_PREFIX=install`,
  `cmake --build build -j N`, `cmake --install build`. Presets: `CMakePresets.json`
  includes `presets/CMake<name>Presets.json` via `CMAKE_PRESET_NAME`.
- **Tests.** No fixture `CMakeLists.txt` read here (outside MAPL) calls
  `add_test` or `esma_add_regression_tests`; `esma_enable_tests.cmake` calls
  `enable_testing()` and `esma_regression_tests.cmake` defines
  `esma_add_regression_tests` (S3 data sync). CI: `.github/workflows/workflow.yml`.

## 5. Where run-time configuration lives

`GEOSgcm_App` (`src/Applications/@GEOSgcm_App`) installs templates and setup
scripts; an experiment directory is generated from them.

- `CMakeLists.txt` installs `*.tmpl` to `etc/`, the `gcm_*.j`/`*.setup` scripts
  to `bin/`, and runs `configure_file(... @ONLY)` on `gcm_setup` and the other
  `*_setup` scripts before installing them to `bin/`.
- `gcm_setup` (csh) prompts for the configuration, copies `$GEOSDIR/etc/*` to
  `$EXPDIR/RC`, deletes the `*.tmpl` there, and fills `@NAME` placeholders by
  `sed` in a list of about 16 templates and scripts, including `CAP.rc`,
  `AGCM.rc`, `HISTORY.rc` and `gcm_run.j` (`gcm_setup`, sections "Copy Model
  Executable and RC Files" and "Produce Final script and .rc files"). The full
  list, and the rest of setup, are in the [GEOSgcm_App architecture](../src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md), section 3.
- `CAP.rc.tmpl`: `ROOT_NAME: GCM`, `ROOT_CF: AGCM.rc`, `HIST_CF: HISTORY.rc`,
  `HEARTBEAT_DT`, `USE_EXTDATA2G`. `AGCM.rc` is the main configuration the
  `GCM` tree reads through MAPL; some components also read their own files
  (`WGCM.rc`, `GEOS_ChemGridComp.rc`, `GEOS_SurfaceGridComp.rc`, below).
- **Keys in `AGCM.rc.tmpl`** that change structure: `DYCORE`, `USE_WAVES`,
  `USE_DATA_ATM4OCN`, `OCEAN_NAME`, `USE_DATASEA`, `USE_DATASEAICE`,
  `USE_CICE_Thermo`, `SEAICE_NAME`, `CONVPAR_OPTION`, `AERO_PROVIDER`,
  `LSM_CHOICE`, `USE_SATSIM`, `USE_SATSIM_*`. `SATSIM` is added when `USE_SATSIM` plus the five `USE_SATSIM_*` keys sum to more than 0 (`GEOS_RadiationGridComp.F90`, `SetServices`). `gcm_setup` substitutes `@ISCCP_SATSIM` with 1 (`gcm_setup`, `sed` list), so `USE_SATSIM_ISCCP: 1` is set and `SATSIM` is on by default in new experiments. Grid/layout: `NX`, `NY`, `AGCM_IM`, `AGCM_JM`,
  `AGCM_LM`, prefixed keys such as `AGCM.GRID_TYPE`, `OGCM.IM_WORLD`. In the
  template `USE_DATASEA` and `USE_DATASEAICE` appear only on `@COUPLED` lines,
  and `DUAL_OCEAN` only as the commented hint `@MOM5#DUAL_OCEAN: 1`.
- **Keys read by code but absent from `AGCM.rc.tmpl`:** `USE_OCEANOBIOGEOCHEM`
  (`GEOS_OgcmGridComp.F90`, `GEOS_PhysicsGridComp.F90`, ...; *Unverified:*
  where it is meant to be set; not in `gcm_setup` or any template);
  `FIRE_DANGER` (read from the surface file, `GEOS_SurfaceGridComp.F90`,
  `GEOS_LandGridComp.F90`); `wave_model` (in `GG/GEOSwgcm_GridComp/WGCM.rc`, file
  name fixed as `WGCM_CONFIG_FILE` in `GEOS_WgcmGridComp.F90`).
- **Redirects to other files.** `SURFRC:` (default `GEOS_SurfaceGridComp.rc`;
  `GEOS_SurfaceGridComp.F90`, `GEOS_PhysicsGridComp.F90`) and
  `GEOS_ChemGridComp_RC_File:` (default `GEOS_ChemGridComp.rc`,
  `GEOS_ChemGridComp.F90`). `GEOS_ChemGridComp.rc` carries the `ENABLE_*` keys
  (installed by `@GEOSchem_GridComp/CMakeLists.txt`); `GEOS_SurfaceGridComp.rc`
  is installed from `GEOSsurface_GridComp/Shared/CMakeLists.txt`. `gcm_setup`
  edits some keys in `$EXPDIR/RC` (for example `ENABLE_PCHEM`, `LAND_PARAMS`).
- **Defaults and checks in `SetServices`.** `GEOS_GcmGridComp.F90`: if
  `CONVPAR_OPTION` is `NULL` it is set to `RAS`, and if `AERO_PROVIDER` is
  `NULL` it is set to `GOCART.data`, both written back into the shared config,
  so later children read the value. The `AERO_PROVIDER` defaults differ by
  place: `GOCART.data` in `GEOS_GcmGridComp.F90` when the key is missing,
  `GOCART2G` in `GEOS_ChemGridComp.F90` (`ESMF_ConfigGetAttribute`, `Default=`
  and `GetProvider_`), and `gcm_setup` writes `GOCART2G` (`set AERO_PROVIDER`).
  Chemistry's default applies when the key is absent from the configuration
  Chemistry reads (*Unverified:* whether the Gcm's `MAPL_ConfigSetAttribute`
  write-back in `GEOS_GcmGridComp.F90` reaches that configuration). Provider mechanism:
  [GOCART architecture](../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/@GOCART/docs/ARCHITECTURE.md), section 5.2. `GEOS_OceanGridComp.F90`: `USE_DATASEA`
  and `USE_DATASEAICE` default to 1 (data ocean, data ice), `OCEAN_NAME` to
  `MOM` (read there only when `USE_DATASEA` is 0; `GEOS_OgcmGridComp.F90`
  reads `OCEAN_NAME`, default `MOM`, unconditionally); `GEOS_SeaIceGridComp.F90`:
  `SEAICE_NAME` defaults to `CICE4` (read only when not data ice and not
  `BUILD_MIT_OCEAN`). `GEOS_OgcmGridComp.F90` asserts: `USE_DATA_ATM4OCN` needs
  `USE_DATASEA=0`; `USE_DATASEA/=0` needs `USE_CICE_Thermo=0`,
  `USE_DATASEAICE/=0` and `USE_OCEANOBIOGEOCHEM=0`. `GEOS_GcmGridComp.F90`
  asserts `DUAL_OCEAN` needs `REPLAY_MODE: Regular`.
- Output collections: `HISTORY*.rc.tmpl`; `gcm_setup` picks the default
  (`DEFAULT_HISTORY_TEMPLATE`). Forcing data: ExtData YAML files copied to the
  run directory by `gcm_run.j` (`cp -f $HOMDIR/*.yaml .`).

## 6. Traps

- A nested repository is gitignored by the fixture (`.gitignore`,
  `src/Components/.gitignore`, `src/Shared/.gitignore`,
  `src/Applications/.gitignore`), so `git status` at the fixture root does not
  show changes in it. Find the owner with `git -C <dir> rev-parse
  --show-toplevel`; this matters inside `src/Components/@GEOSgcm_GridComp/`,
  where `@GEOSchem_GridComp`, `@GEOSradiation_GridComp` and
  `@FVdycoreCubed_GridComp` are other repositories.
- Both CMake spellings resolve: `esma_add_subdirectory` accepts `name`, `@name`
  and `name@`, and `esma_add_library` strips `@` from `SUBCOMPONENTS` (examples:
  `esma_add_subdirectory (${env_dir})` with `env_dir=@env`; `SUBCOMPONENTS @mom`
  in `MOM_GEOS5PlugMod/CMakeLists.txt`). Plain names are the norm.
- A component missing from a sparse or partial checkout becomes a generated
  stub, not a build error (`esma_add_library.cmake`).
- `MAPL_AddChild` order matters: in `GEOS_PhysicsGridComp.F90` a comment says
  chemistry must be added before surface, otherwise the `AERO_DP` import
  restart read by surface is empty. It is not the run order (section 3).
- `AGCM.rc.tmpl` placeholders are replaced only by `gcm_setup`.
  *Inferred:* a generated `AGCM.rc` does not follow later template changes.

## 7. Observations (noted, not fixed)

1. `README.md` "Current State of GEOSgcm Subrepos" differs from
   `components.yaml` for MOM5 (`1.2.0` vs `2.1.0`), Icepack (`v0.3.0` vs
   `v0.4.0`) and RRTMGP (`v1.7` vs `v1.8`). The RRTMGP checkout read here is `git describe` `geos/v1.7+2.0.0-58-gabd4b1d` (58 commits after the tag `geos/v1.7+2.0.0`; `components.yaml` pins `geos/v1.8+1.0.0`), so neither README number names the code that was read.
2. `QuickChem` is in `components.yaml`, but nothing in the `GEOSgcm_GridComp`
   tree outside `@QuickChem` mentions it and `@GEOSchem_GridComp/CMakeLists.txt`
   neither adds nor depends on it.
3. `@GEOSchem_GridComp/CMakeLists.txt` lists `H2O_GridComp` in `alldirs`, and
   `GEOS_ChemGridComp.F90` uses `H2O_GridCompMod`, but no `H2O_GridComp`
   directory exists in `GEOSchem_GridComp` @ `d6ad829`; `esma_add_library`
   therefore generates a stub. `ENABLE_H2O` is `.FALSE.` in `GEOS_ChemGridComp.rc`.
4. `README.md` has an empty heading "Create Build Directory".
5. `mit` and `ecbuild` in `components.yaml` have no `develop:` key.
