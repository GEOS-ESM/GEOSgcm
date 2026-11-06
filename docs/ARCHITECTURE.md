# GEOSgcm fixture: system map

**Audience:** coding agents and developers working on the GEOSgcm fixture or arriving at the top of the GEOS atmosphere-ocean model source tree.
**Describes:** the MAPL3 line, branch `release/MAPL-v3`.
**Verified against:** `GEOSgcm` @ `f50622d` (2026-11-06). Nested repositories were read as `mepo clone` left them on their `release/MAPL-v3` branches (`GEOSradiation_GridComp` @ `13f8eb8`; `GEOSgcm_GridComp` @ `84f0aae3`, `GEOSgcm_App` @ `e65517a`, both as `origin/release/MAPL-v3`), `MAPL` on `develop`.
**Placement:** as in the GEOSgcm fixture (`components.yaml` @ `f50622d`).
Other fixtures (for example GEOSadas, GEOSldas) may place this repository
elsewhere; paths inside this repository do not change.

Paths are relative to the fixture root unless stated. Nested repositories use
a leading `@` in their directory name (for example
`src/Components/@GEOSgcm_GridComp`); the `@` is not part of the repository name.
Detail below the fixture level (on this line the documents of nested repositories are not all written yet; the MAPL2-line versions are on their `develop` branches): GEOSgcm_GridComp architecture (`../src/Components/@GEOSgcm_GridComp/docs/ARCHITECTURE.md` in the fixture),
its AGENTS.md (`../src/Components/@GEOSgcm_GridComp/AGENTS.md` in the fixture), and, for the atmosphere composite
(dynamics, physics, IAU/replay) in depth,
GEOSagcm_GridComp architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/ARCHITECTURE.md` in the fixture).
Unlabelled statements are Verified and carry a citation.

> **Build status on this line:** the component tree builds only partly.
> `release/MAPL-v3` builds these parts, and the rest is not yet ported to MAPL3
> (each parent's `CMakeLists.txt` carries its own comment saying the entry or
> block is to be restored when ported to MAPL3; the wording below is quoted per
> file):
>
> - `src/CMakeLists.txt`: `Shared` and `Components` are added;
>   `add_subdirectory(Applications)` and `add_subdirectory(FoundationModels)` are
>   commented out. So `GEOSgcm_App`, `UMD_Etc`, `CPLFCST_Etc` and
>   `GenCast_GEOS-FP` are not built, and no `GEOSgcm.x` is produced.
> - `src/Shared/CMakeLists.txt`: only `GMAO_Shared` (not `NCEP_Shared`) and, if
>   no external MAPL is found, `MAPL`.
> - `src/Shared/@GMAO_Shared/CMakeLists.txt`: sets `HERMES_LIGHT ON` and adds
>   only `GMAO_mpeu`, `GMAO_hermes` (light) and `GEOS_Shared`. The full list
>   (`GMAO_pilgrim`, `GMAO_etc`, `GEOS_Util`, `GMAO_transf`, `GMAO_stoch`,
>   `GMAO_gfio`, ...) is commented out.
> - `src/Components/@GEOSgcm_GridComp/CMakeLists.txt`: only `GEOSagcm_GridComp`;
>   `GEOSdataatm_`, `GEOSmkiau_`, `GEOSogcm_` and `GEOSwgcm_GridComp` are
>   commented out, and the top `GEOS_GcmGridComp.F90` library block is commented
>   out ("Temporarily bypass GEOSgcm_GridComp top-level library").
> - `GEOSagcm_GridComp/CMakeLists.txt`: `components.yaml` gives `GEOSgcm_GridComp`
>   `sparse: ./config/GEOSgcm_GridComp.sparse`, which excludes
>   `GEOS_AgcmSimpleGridComp.F90`, `agcm-simple.yaml` and `GEOShs_GridComp`. In
>   that default checkout the file takes its `else` branch and adds
>   `GEOSsuperdyn_GridComp` and `GEOSphysics_GridComp` as plain subdirectories;
>   no Agcm library is built (the `GEOS_AgcmGridComp.F90` library block is
>   commented out). A checkout without that sparse file would build the
>   Held-Suarez library (`SUBCOMPONENTS GEOSsuperdyn_GridComp GEOShs_GridComp`)
>   instead.
> - `GEOSsuperdyn_GridComp/CMakeLists.txt`: builds the library
>   `GEOS_SuperdynGridComp.F90` (`esma_add_library`, inside
>   `if (EXISTS ...)`) with `SUBCOMPONENTS FVdycoreCubed_GridComp`;
>   `GEOSdatmodyn_GridComp` is commented out.
> - `GEOSphysics_GridComp/CMakeLists.txt`: `GEOSchem_GridComp` (GOCART only,
>   see below), `GEOSgwd_GridComp` and `GEOSradiation_GridComp`; `GEOSmoist_`,
>   `GEOSsurface_` and `GEOSturbulence_GridComp` are commented out, as is the
>   `GEOS_PhysicsGridComp.F90` library.
> - `@GEOSchem_GridComp/CMakeLists.txt`: only `GOCART` (for `GOCART2G_GridComp`);
>   `Shared` (`Chem_Base`, `Chem_Shared`, `HEMCO`), `TR`, `GMI`, `StratChem`,
>   `MAM`, `MATRIX`, `CARMA`, `GAAS`, `ACHEM` and the Chemistry top-level
>   library (`GEOS_ChemGridComp.F90`) are commented out ("Restore subdirs as
>   components are ported to MAPL3").
> - `@GEOSradiation_GridComp/CMakeLists.txt` (on its `release/MAPL-v3`) builds
>   the Radiation parent library (`GEOS_RadiationGridComp.F90`) with
>   `SUBCOMPONENTS` `GEOS_RadiationShared`, `GEOSsolar_GridComp`,
>   `GEOSirrad_GridComp` and `GEOSsatsim_GridComp`; its log shows the Solar
>   (`ebaed6e`) and SatSim (`13f8eb8`) ports. The comment "restricted to IRRAD
>   only" in `GEOSphysics_GridComp/CMakeLists.txt` predates those ports.
>
> Sections below describe the MAPL2-line architecture of the full tree unless
> they say otherwise; subtrees that are not built are present as source only.
> Documents of child repositories on this line: those for GAAS, ACHEM, MAM,
> MATRIX, CARMA, RRG, GOCART, GMAO_Shared, GEOS_Util, GEOSgcm_GridComp and
> GEOSgcm_App are in progress; those for FVdycoreCubed, Ocean, Radiation,
> Chemistry, QuickChem, TR, StratChem, GMI and MAPL come later. Links below
> point to the paths where they will be.

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
  `GEOSgcm: fixture: true`). On this line `components.yaml` also differs from the MAPL2 line as described in section 2 and the status block above.
- **Fixture** means: a repository whose `components.yaml` lists other
  repositories to clone into it. The tool is `mepo` (multiple-repository
  manager), used instead of Git submodules (`README.md`, "Setting up `mepo`").
  `mepo clone` assembles the tree; `mepo status` shows each repository with its
  branch `(b)` or tag `(t)` (`README.md`, "Mepo").
- `components.yaml` has 44 nested entries (count of `local:` keys). Each gives
  `local` (path), `remote`, a `tag` or a `branch`, and usually a `develop` branch;
  optional keys are `sparse` (a pattern file under `config/`), `blobless`,
  `recurse_submodules`, `ignore_submodules`. On this line 26 entries use
  `branch:` (24 of them `release/MAPL-v3` or `geos/release/MAPL-v3`; `cmake` uses
  `release/v4`, `MAPL` uses `develop`) and 18 use `tag:` (`components.yaml`).
  The `GEOS_FieldDictionary` entry (`src/Shared/@MAPL/@GEOS_FieldDictionary`, `tag: v0.2.1`) is new relative to the MAPL2 line.
- `mepo develop <repos>` switches the named repositories to their `develop:`
  branch. The README and `parallel_build.csh -develop` do this for
  `GEOSgcm_GridComp`, `GEOSgcm_App`, `GMAO_Shared` and `GEOS_Util` only
  (`README.md`, "Develop Version of GEOS GCM"; `parallel_build.csh`).
- Tag-pinned repositories show `(DH)`, detached HEAD, in `mepo status`.
  *Inferred:* an edit there belongs on a branch of that repository, followed by
  a new `tag:` in `components.yaml`. On this line most model repositories are
  tracked by `branch:` and show a branch.
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
| GMAO_Shared | `src/Shared/@GMAO_Shared` | shared libraries and tools (`GEOS_Shared`, `GMAO_mpeu`, `GMAO_gfio`, `GMAO_hermes`, `GMAO_transf`, `GMAO_etc`, `GMAO_stoch`, `LANL_Shared/CICE4`; see its document (`../src/Shared/@GMAO_Shared/docs/ARCHITECTURE.md` in the fixture)); sparse (`config/GMAO_Shared.sparse`; `src/Shared/@GMAO_Shared/CMakeLists.txt`); on this line built restricted to `GMAO_mpeu`, `GMAO_hermes` (light) and `GEOS_Shared` (status block) |
| GEOS_Util | `src/Shared/@GMAO_Shared/@GEOS_Util` (not built on this line) | pre-processing, post-processing, plotting and coupled-diagnostics tools (`pre`, `post`, `plots`, `plots_v2`, `coupled_diagnostics`); see its document (`../src/Shared/@GMAO_Shared/@GEOS_Util/docs/ARCHITECTURE.md` in the fixture) |
| GMAO_perllib | `src/Shared/@GMAO_Shared/@GMAO_perllib` | Perl library |
| NCEP_Shared | `src/Shared/@NCEP_Shared` | NCEP libraries (`NCEP_sp`, `NCEP_w3`, ...); sparse (`config/NCEP_Shared.sparse`); not built on this line (`src/Shared/CMakeLists.txt` comment: not needed without the full GMAO_Shared cascade) |

### 2.3 MAPL
`src/Shared/@MAPL`: MAPL (Modeling Analysis and Prediction Layer), the
framework over ESMF (Earth System Modeling Framework). On this line the entry
is `branch: develop`, `develop: develop` (`components.yaml`): MAPL3. Built from
source only when no external MAPL is found (`src/Shared/CMakeLists.txt`). The
fixture's own claims about MAPL internals (`MAPL_Cap`) are those
of the MAPL2 line and are not re-verified here. MAPL3 documents in the checkout:
`src/Shared/@MAPL/docs/mapl3/` (`api-changes.md`, `diffs-from-mapl2.md`,
`gridcomp-template.md`, `vertical-alignment.md`, `field_dictionary_developer.md`)
and `src/Shared/@MAPL/docs/user_guide`; there is no `AGENTS.md` at
`src/Shared/@MAPL/` in this checkout. MAPL's architecture documents for this
line come later. `GEOS_FieldDictionary` is cloned into `src/Shared/@MAPL/@GEOS_FieldDictionary`.

### 2.4 GEOS component repositories
| Repository | Local path | Role |
|---|---|---|
| GEOSgcm_GridComp | `GG` | root `GCM` component and most components; sparse (`config/GEOSgcm_GridComp.sparse`) |
| FVdycoreCubed_GridComp | `GG/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp` | cubed-sphere finite-volume dynamical core (module `FVdycoreCubed_GridComp`, `DynCore_GridCompMod.F90`); architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp/docs/ARCHITECTURE.md` in the fixture) |
| GEOSchem_GridComp | `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp` | `CHEMISTRY` component (`GEOS_ChemGridComp.F90`); architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/docs/ARCHITECTURE.md` in the fixture) |
| GEOSradiation_GridComp | `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp` | `RADIATION` with `SOLAR`, `IRRAD`, `SATSIM` (`GEOS_RadiationGridComp.F90`); architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp/docs/ARCHITECTURE.md` in the fixture) |
| GEOS_OceanGridComp | `GG/GEOSogcm_GridComp/@GEOS_OceanGridComp` | `OCEAN` component and ocean plug-ins (`GEOS_OceanGridComp.F90`); architecture (`../src/Components/@GEOSgcm_GridComp/GEOSogcm_GridComp/@GEOS_OceanGridComp/docs/ARCHITECTURE.md` in the fixture) |

### 2.5 Chemistry repositories (inside GEOSchem_GridComp)
Path prefix `GG/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/`.
Chemistry architecture: GEOSchem_GridComp (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/docs/ARCHITECTURE.md` in the fixture). `GOCART` (`@GOCART`; `GOCART`, `GOCART2G`; architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/@GOCART/docs/ARCHITECTURE.md` in the fixture)), `ACHEM`, `CARMA`, `GAAS`, `GMI`,
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
| GEOSgcm_App | `src/Applications/@GEOSgcm_App` | setup scripts and run-time templates (the `GEOSgcm.F90` main program is deleted on this line) (section 5); architecture (`../src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md` in the fixture) |
| UMD_Etc | `src/Applications/@UMD_Etc` | *Inferred:* University of Maryland tools (`UMD_oletkf`, `UMD_rc`) |
| CPLFCST_Etc | `src/Applications/@CPLFCST_Etc` | *Inferred:* coupled forecast scripts |
| GenCast_GEOS-FP | `src/FoundationModels/@GenCast_GEOS-FP` | *Inferred:* machine-learning forecast model; the directory is installed, not built (`src/FoundationModels/CMakeLists.txt`) |

## 3. Run-time component tree

This section describes the full tree as written in the source (the MAPL2-line
structure). On this line only the parts listed in the status block are built;
`GEOSgcm.x` is not built, so no run-time tree exists from this fixture.

On the MAPL2 line (MAPL `release/v2`), `GEOSgcm.x` runs `MAPL_Cap('GCM', ROOT_SetServices, ...)`, where
`ROOT_SetServices` is `SetServices` of `GEOS_GcmGridCompMod`
(`GEOSgcm.F90`, program `GEOS5_Main`, in `GEOSgcm_App` on the MAPL2 line; deleted on this line). The cap
adds the root, `HIST` (History) and `EXTDATA` (external data) as its children
(MAPL2-line `MAPL_CapGridComp.F90`, `MAPL_AddChild`; nothing in MAPL `develop` is cited here). Every
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
  `SetServices` child order. Detail: physics architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/ARCHITECTURE.md` in the fixture);
  also turbulence (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSturbulence_GridComp/ARCHITECTURE.md` in the fixture),
  gravity-wave drag (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSgwd_GridComp/ARCHITECTURE.md` in the fixture),
  moist (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSmoist_GridComp/ARCHITECTURE.md` in the fixture),
  surface (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/GEOSsurface_GridComp/ARCHITECTURE.md` in the fixture).
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
  architecture documents, linked in section 2.4 (Chemistry (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/docs/ARCHITECTURE.md` in the fixture), Radiation (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSradiation_GridComp/docs/ARCHITECTURE.md` in the fixture), FVdycoreCubed (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSsuperdyn_GridComp/@FVdycoreCubed_GridComp/docs/ARCHITECTURE.md` in the fixture), Ocean (`../src/Components/@GEOSgcm_GridComp/GEOSogcm_GridComp/@GEOS_OceanGridComp/docs/ARCHITECTURE.md` in the fixture); aerosols: GOCART (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/@GOCART/docs/ARCHITECTURE.md` in the fixture); application: GEOSgcm_App (`../src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md` in the fixture)).

## 4. Build structure

```
CMakeLists.txt                  project GEOSgcm; finds ESMA_cmake; include(esma)
  |-- esma_add_subdirectory(env)    (@env)
  `-- src/CMakeLists.txt
        |-- Shared/        GMAO_Shared (HERMES_LIGHT), then MAPL  (NCEP_Shared not added)
        |-- Components/    GEOSgcm_GridComp (partial; see status block)
        |   (Applications/ and FoundationModels/ are commented out: not yet ported to MAPL3)
```

- **Top `CMakeLists.txt`.** On this line the block that located NetCDF, HDF5, ESMF, GFTL_SHARED, ZLIB, FMS and MAPL when Baselibs is not found is removed (diff from the MAPL2 line); library discovery is left to `@cmake`. Walks the spellings `cmake`, `@cmake`, `cmake@`,
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
- **Held-Suarez switch.** On this line `GEOSagcm_GridComp/CMakeLists.txt` builds
  the Held-Suarez model if `GEOS_AgcmSimpleGridComp.F90` exists; the
  `GEOS_AgcmGridComp.F90` branch is commented out and the fallback adds
  `GEOSsuperdyn_GridComp` and `GEOSphysics_GridComp` as subdirectories. `config/GEOSgcm_GridComp.sparse` lists `/*`, then
  `!/GEOSagcm_GridComp/GEOS_AgcmSimpleGridComp.F90`,
  `!/GEOSagcm_GridComp/agcm-simple.yaml` (new on this line),
  `!/GEOSagcm_GridComp/GEOShs_GridComp` and two superdyn entries
  (`config/GEOSgcm_GridComp.sparse`).
  `/*` includes everything in the sparse checkout, and the `!` lines exclude the Held-Suarez file and directory from it, so the
  default checkout lacks Held-Suarez and takes the `else` branch; a checkout
  without the sparse file would build the Held-Suarez library instead.
- **Options:** `BUILD_WITH_GIGATRAJ`, `BUILD_WITH_PYMLINC` (`GG/CMakeLists.txt`);
  `BUILD_MIT_OCEAN`; `FV_PRECISION`.
- **Executables:** none on this line: `src/CMakeLists.txt` does not add
  `Applications`. `GEOSgcm_App/CMakeLists.txt` on this line defines only
  `idfupd.x`; the `GEOSgcm.x` target and `GEOSgcm.F90` are removed.
- **MAPL** is built from `src/Shared/@MAPL` unless an external one is found
  (`src/Shared/CMakeLists.txt`). `components.yaml` still has the comment "When
  updating the MAPL version, also update the MAPL version in the CMakeLists.txt
  file for non-Baselibs builds", while that block was removed from the top
  `CMakeLists.txt` on this line.
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
  list, and the rest of setup, are in the GEOSgcm_App architecture (`../src/Applications/@GEOSgcm_App/docs/ARCHITECTURE.md` in the fixture).
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
  GOCART architecture (`../src/Components/@GEOSgcm_GridComp/GEOSagcm_GridComp/GEOSphysics_GridComp/@GEOSchem_GridComp/@GOCART/docs/ARCHITECTURE.md` in the fixture). `GEOS_OceanGridComp.F90`: `USE_DATASEA`
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
