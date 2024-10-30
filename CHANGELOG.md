# Changelog

## Unreleased

## [11.6.2] - 2024-10-23

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:

* gcc14: Compile icepack data file at `-O0` [#982](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/982)
* Add new C1120 resolution to BCS package [#961](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/961)
* Add new C1120 resolution to remap restarts [#94](https://github.com/GEOS-ESM/GEOS_Util/pull/94)
* Add GEOS-IT option for remap restarts [#96](https://github.com/GEOS-ESM/GEOS_Util/pull/96)
* Add land constants as HISTORY export variables [#970](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/970)
* Add definition of land constants collection into `HISTORY.rc.tmpl` [#636](https://github.com/GEOS-ESM/GEOSgcm_App/pull/636)
* Remove filling of `WET1` (a.k.a. `GWETTOP`) with 1s over non-land [#974](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/974)
* Fixed conversion of minimal `CAPAC` to `RUNOFF` (catchment.F90) [#991](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/991)
* Send clear message to log when `mk_LakeLandiceSaltRestarts` fails [#1006](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/1006)
* Fixes [#984](https://github.com/GEOS-ESM/GEOSgcm_GridComp/issues/984), bug in which `ZLCL` was unfilled with BACM or MGB2 [#985](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/985)
* Fixes [#1009](https://github.com/GEOS-ESM/GEOSgcm_GridComp/issues/1009), incorrect units in GF precip fluxes [#1010](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/1010)
* Plots package bug fixes for `EXPID` names containing periods [#103](https://github.com/GEOS-ESM/GEOS_Util/pull/103)
* gcc14: Add int to main in `makdep.c` [#356](https://github.com/GEOS-ESM/GMAO_Shared/pull/356)
* v11: Update Intel MPI flags [#652](https://github.com/GEOS-ESM/GEOSgcm_App/pull/652)
* Remove executables on tmpdir [#644](https://github.com/GEOS-ESM/GEOSgcm_App/pull/644)
* Update n4zip to fix deprecated option [#354](https://github.com/GEOS-ESM/GMAO_Shared/pull/354)
* Update ESMF CMake target to `ESMF::ESMF` [#978](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/978) [#638](https://github.com/GEOS-ESM/GEOSgcm_App/pull/638) [#92](https://github.com/GEOS-ESM/GEOS_Util/pull/92) [#355](https://github.com/GEOS-ESM/GMAO_Shared/pull/355)

### Fixture Changes:
* ESMA_env  [v4.29.0 => v4.29.1](https://github.com/GEOS-ESM/ESMA_env/compare/v4.29.0...v4.29.1)
* ESMA_cmake  [v3.48.0 => v3.52.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.48.0...v3.52.0)
* ecbuild  [geos/v1.3.0 => geos/v1.4.0](https://github.com/GEOS-ESM/ecbuild/compare/geos/v1.3.0...geos/v1.4.0)
* GMAO_Shared  [v1.9.8 => v1.9.9](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.8...v1.9.9)
* GEOS_Util  [v2.1.2 => v2.1.3](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.1.2...v2.1.3)
* MAPL  [v2.47.1 => v2.50.1](https://github.com/GEOS-ESM/MAPL/compare/v2.47.1...v2.50.1)
* GEOSgcm_GridComp  [v2.6.1 => v2.6.2](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.6.1...v2.6.2)
* FVdycoreCubed_GridComp  [v2.11.1 => v2.12.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.11.1...v2.12.0)
* GEOS_OceanGridComp  [v2.1.6 => v2.3.0](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.6...v2.3.0)
* MOM6  [geos/v3.1 => geos/v3.3](https://github.com/GEOS-ESM/MOM6/compare/geos/v3.1...geos/v3.3)
* GEOSradiation_GridComp  [v1.8.0 => v1.9.0](https://github.com/GEOS-ESM/GEOSradiation_GridComp/compare/v1.8.0...v1.9.0)
* GEOSgcm_App  [v2.3.4 => v2.3.5](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.3.4...v2.3.5)


## [11.6.1] - 2024-08-01

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:

* `linkbcs` bugfix for coupled runs using v12 bcs [#623](https://github.com/GEOS-ESM/GEOSgcm_App/pull/623)
* Exports and `LONG_NAMES` changes for land water and energy balances [#957](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/957)
* New and renamed exports added to`HISTORY.rc.tmpl` for land water and energy balances [#621](https://github.com/GEOS-ESM/GEOSgcm_App/pull/621)
* Update GMI and StratChem HISTORY [#627](https://github.com/GEOS-ESM/GEOSgcm_App/pull/627)
* Routing Outlets in Boundary Conditions [#827](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/827)
* Bugfix to remove double-counting of heat corr (`StieglitzSnow.F90`) [#946](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/946)
* Bugfix whereby `TMPHIST` was not created during cloning [#626](https://github.com/GEOS-ESM/GEOSgcm_App/pull/626)
* Fixes for Ninja builds [#966](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/966)
* Added MASKFILE for time-discontinuous data for TEM diagnostics [#89](https://github.com/GEOS-ESM/GEOS_Util/pull/89)
* Add MOM6 C90 ogrid option to `remap_utils.py` [#83](https://github.com/GEOS-ESM/GEOS_Util/pull/83)
* Bugfix for `time_ave.rc` [#86](https://github.com/GEOS-ESM/GEOS_Util/pull/86)

### Fixture Changes:
* ESMA_cmake  [v3.45.2 => v3.48.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.45.2...v3.48.0)
* GMAO_Shared  [v1.9.7 => v1.9.8](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.7...v1.9.8)
* GEOS_Util  [v2.1.0 => v2.1.2](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.1.0...v2.1.2)
* MAPL  [v2.46.1 => v2.47.1](https://github.com/GEOS-ESM/MAPL/compare/v2.46.1...v2.47.1)
* GEOSgcm_GridComp  [v2.6.0 => v2.6.1](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.6.0...v2.6.1)
* GEOSchem_GridComp  [v1.13.1 => v1.14.0](https://github.com/GEOS-ESM/GEOSchem_GridComp/compare/v1.13.1...v1.14.0)
* TR  [v1.1.0 => v1.2.0](https://github.com/GEOS-ESM/TR/compare/v1.1.0...v1.2.0)
* GMI  [v1.1.0 => v1.3.0](https://github.com/GEOS-ESM/GMI/compare/v1.1.0...v1.3.0)
* GEOSgcm_App  [v2.3.3 => v2.3.4](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.3.3...v2.3.4)


## [11.6.0] - 2024-06-11

### Zero-diff to Previous Release: NO
### Restart Changes: NO (see details below)


## Potential non-zero-diff changes:
* Hotfix for uninitialized variables `tep` and `qp` when `wstar <= 0.001` [#931](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/931)
* `make_bcs` fix for bad HWSDv1.21 data in Argentina "peatland" [#944](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/944)

## Zero-diff changes:
* Sync `qr`/`qs` export naming to corresponding changes in MOIST (exports) [#605](https://github.com/GEOS-ESM/GEOSgcm_App/pull/605)
* Moving to new BCS directory structure [#551](https://github.com/GEOS-ESM/GEOSgcm_App/pull/551)
* Additional cleanup of Stieglitz snow code [#813](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/813)
* Adding new v12 BCS option (Argentina "peatland" fix) [#616](https://github.com/GEOS-ESM/GEOSgcm_App/pull/616) [#75](https://github.com/GEOS-ESM/GEOS_Util/pull/75)
* Adding new v11 BCS option, new `linkbcs`, and changes in setup scripts [#544](https://github.com/GEOS-ESM/GEOSgcm_App/pull/544)
* CICE6 cmake and namelist updates for post release v6.5.0 merge [#925](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/925)
* Fix up stretched grid tags [#613](https://github.com/GEOS-ESM/GEOSgcm_App/pull/613)
* Fix aerosol HISTORY for FP [#595](https://github.com/GEOS-ESM/GEOSgcm_App/pull/595)
* Allow history to overwrite previously written output [#594](https://github.com/GEOS-ESM/GEOSgcm_App/pull/594)
* Plot updates for automated TEM Diagnostics [#76](https://github.com/GEOS-ESM/GEOS_Util/pull/76)
* Minor update to GMI and StratChem setup scripts [#599](https://github.com/GEOS-ESM/GEOSgcm_App/pull/599)
* Replaced Default `$HOMEDIR` pathway with user's `$NOBACKUP` inside `gcm_setup` [#591](https://github.com/GEOS-ESM/GEOSgcm_App/pull/591)
* Add Milan support at NAS [#607](https://github.com/GEOS-ESM/GEOSgcm_App/pull/607)
* Updates for running GEOSgcm with Spack as libraries instead of Baselibs [#611](https://github.com/GEOS-ESM/GEOSgcm_App/pull/611)
* Remove mask from `read_Reynolds` [#73](https://github.com/GEOS-ESM/GEOS_Util/pull/73)

### Fixture Changes:
* ESMA_env  [v4.25.1 => v4.29.0](https://github.com/GEOS-ESM/ESMA_env/compare/v4.25.1...v4.29.0)
* ESMA_cmake  [v3.41.0 => v3.45.2](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.41.0...v3.45.2)
* GEOS_Util  [v2.0.7 => v2.1.0](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.0.7...v2.1.0)
* MAPL  [v2.44.0 => v2.46.1](https://github.com/GEOS-ESM/MAPL/compare/v2.44.0...v2.46.1)
* FMS  [2019.01.02+noaff.8 => 2019.01.02+noaff.10](https://github.com/GEOS-ESM/FMS/compare/geos/2019.01.02+noaff.8...geos/2019.01.02+noaff.10)
* GEOSgcm_GridComp  [v2.5.2 => v2.6.0](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.5.2...v2.6.0)
* FVdycoreCubed_GridComp  [v2.11.0 => v2.11.1](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.11.0...v2.11.1)
* fvdycore  [v2.8.1 => v2.9.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.8.1...geos/v2.9.0)
* GOCART [sdr_v2.2.1.1 => sdr_v2.2.1.2](https://github.com/GEOS-ESM/GOCART/compare/sdr_v2.2.1.1...sdr_v2.2.1.2)
* CICE6  [v0.1.3 => v0.2.0](https://github.com/GEOS-ESM/CICE/compare/geos/v0.1.3...geos/v0.2.0)
* icepack  [v0.2.0 => v0.3.0](https://github.com/GEOS-ESM/Icepack/compare/geos/v0.2.0...geos/v0.3.0)
* GEOSgcm_App  [v2.3.2 => v2.3.3](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.3.2...v2.3.3)

## [11.5.2] - 2024-03-04

### Zero-diff to Previous Release: YES
### Restart Changes: YES (see details below)

### Major Zero-Diff Changes:
* OBIO (NOBM) is integrated into the Krok Model [#871](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/871)
* SHOC-MF updates [#902](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/902)
* Refactor DataSea/DataIce `IS_FCST` to `OGCM_IS_FCST` [#910](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/910) [#583](https://github.com/GEOS-ESM/GEOSgcm_App/pull/583)
* Disable Catchment-CN4.5 land model option (LSM_CHOICE=3) for GCM simulations [#900](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/900) [#575](https://github.com/GEOS-ESM/GEOSgcm_App/pull/575)
* `AGCM.rc` updates to support RRTMGP v1.7 [#585](https://github.com/GEOS-ESM/GEOSgcm_App/pull/585)
* Add new history template `HISTORY.RADVAL.rc.tmpl` to support RRTMGP validation [#582](https://github.com/GEOS-ESM/GEOSgcm_App/pull/582)
* Assorted enhancements of `remap_restarts.py` package (EASE, SLES15, NAS, lake/landice log) [#43](https://github.com/GEOS-ESM/GEOS_Util/pull/43)
* Addition of new features to generate ocean boundary conditions for atmosphere-only forecasts [#47](https://github.com/GEOS-ESM/GEOS_Util/pull/47)
* Do not remap restarts when it is not necessary [#53](https://github.com/GEOS-ESM/GEOS_Util/pull/53)
* Add surface forcing  lfo_Nx+-  to HISTORY.rc.tmpl  [#578](https://github.com/GEOS-ESM/GEOSgcm_App/pull/578)
* Plot updates for transport images and stats montage fixes [#57](https://github.com/GEOS-ESM/GEOS_Util/pull/57)
* Bugfix in SCM #903 [#904](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/904)
* Fix for GNU `hystpdf` crash [#899](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/899)
* Initialize `USE_WAVES` to 0 [#569](https://github.com/GEOS-ESM/GEOSgcm_App/pull/569) [#570](https://github.com/GEOS-ESM/GEOSgcm_App/pull/570)
* Use `nccmp`, add readers/writers test to regress [#573](https://github.com/GEOS-ESM/GEOSgcm_App/pull/573)
* Use CMake to determine MPI Stack [#580](https://github.com/GEOS-ESM/GEOSgcm_App/pull/580)
* Move to use cp and tar at NAS [#56](https://github.com/GEOS-ESM/GEOS_Util/pull/56)
* Prepare for sparse checkout [#58](https://github.com/GEOS-ESM/GEOS_Util/pull/58)

### Fixture Changes:
* ESMA_cmake  [v3.38.0 => v3.41.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.38.0...v3.41.0)
* GEOS_Util  [v2.0.5 => v2.0.7](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.0.5...v2.0.7)
* MAPL  [v2.43.1 => v2.44.0](https://github.com/GEOS-ESM/MAPL/compare/v2.43.1...v2.44.0)
* GEOSgcm_GridComp  [v2.5.1 => v2.5.2](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.5.1...v2.5.2)
* FVdycoreCubed_GridComp  [v2.10.0 => v2.11.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.10.0...v2.11.0)
* GEOS_OceanGridComp  [v2.1.5 => v2.1.6](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.5...v2.1.6)
* MOM6  [geos/v2.2.3 => geos/v3.1](https://github.com/GEOS-ESM/MOM6/compare/geos/v2.2.3...geos/v3.1)
* icepack  [geos/v0.1.1 => geos/v0.2.0](https://github.com/GEOS-ESM/Icepack/compare/geos/v0.1.1...geos/v0.2.0)
* GEOSradiation_GridComp  [v1.6.0 => v1.8.0](https://github.com/GEOS-ESM/GEOSradiation_GridComp/compare/v1.6.0...v1.8.0)
* RRTMGP  [RRTMGP  geos/v1.6+1.1.0 => geos/v1.7+1.0.0](https://github.com/GEOS-ESM/rte-rrtmgp/compare/geos/v1.6+1.1.0...geos/v1.7+1.0.0)
* GEOSgcm_App  [v2.3.1 => v2.3.2](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.3.1...v2.3.2)

### Restart Changes:

The following changes occurred in `solar_internal_rst` but the overall state of the model is zero-diff with RRTMG.

- Metadata changes (`long_name`)
  - `CLDHISW`: "high-level_cloud_area_fraction_rrtmg_sw_REFRESH" → "high-level_cloud_area_fraction_RRTMG_P_SW_REFRESH"
  - `CLDLOSW`: "low-level_cloud_area_fraction_rrtmg_sw_REFRESH" → "low-level_cloud_area_fraction_RRTMG_P_SW_REFRESH"
  - `CLDMDSW`: "mid-level_cloud_area_fraction_rrtmg_sw_REFRESH" → "mid-level_cloud_area_fraction_RRTMG_P_SW_REFRESH"
  - `CLDTTSW`: "total_cloud_area_fraction_rrtmg_sw_REFRESH" → "total_cloud_area_fraction_RRTMG_P_SW_REFRESH"
- Removed fields
  - `TAUHIPAR`
  - `TAULOPAR`
  - `TAUMDPAR`
  - `TAUTTPAR`
- Added fields
  - `COTDENHIPAR`
  - `COTDENLOPAR`
  - `COTDENMDPAR`
  - `COTDENTTPAR` 
  - `COTHIPAR`
  - `COTLOPAR`
  - `COTMDPAR`
  - `COTTTPAR`
  - `COTNUMHIPAR`
  - `COTNUMLOPAR`
  - `COTNUMMDPAR` 
  - `COTNUMTTPAR`

## [11.5.1] - 2024-01-30

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:
* Integration of WMMA (WAVEWATCH, UMWM, sea spray) model components. This introduced new `AGCM.rc` parameters `USE_WAVES:` and `wave_model:`. Implementing WMMA involved the following changes:
  * [GEOSgcm #724](https://github.com/GEOS-ESM/GEOSgcm/pull/724)
  * [GEOSgcm_GridComp #872](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/872)
  * [GEOS_OceanGridComp #59](https://github.com/GEOS-ESM/GEOS_OceanGridComp/pull/59)
  * [GEOSgcm_App #552](https://github.com/GEOS-ESM/GEOSgcm_App/pull/552)
  * [GMAO_Shared #339](https://github.com/GEOS-ESM/GMAO_Shared/pull/339)
* SHOC-EDMF updates [#879](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/879)
* Restore the `MTRI` bundle [#881](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/881)
* Refine check for allowable bcs versions to be run with CatchCN [#882](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/882)
* Allow others to make coupled experiments [#558](https://github.com/GEOS-ESM/GEOSgcm_App/pull/558)
* Minor fixes of HISTORY for ADAS [#565](https://github.com/GEOS-ESM/GEOSgcm_App/pull/565)
* Default to Cascade Lake at NCCS for SLES12 [#556](https://github.com/GEOS-ESM/GEOSgcm_App/pull/556)

### Fixture Changes:
* ESMA_env  [v4.24.0 => v4.25.1](https://github.com/GEOS-ESM/ESMA_env/compare/v4.24.0...v4.25.1)
* ESMA_cmake  [v3.36.0 => v3.38.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.36.0...v3.38.0)
* GMAO_Shared  [v1.9.6 => v1.9.7](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.6...v1.9.7)
* MAPL  [v2.43.0 => v2.43.1](https://github.com/GEOS-ESM/MAPL/compare/v2.43.0...v2.43.1)
* GEOSgcm_GridComp  [v2.5.0 => v2.5.1](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.5.0...v2.5.1)
* GEOS_OceanGridComp  [v2.1.4 => v2.1.5](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.4...v2.1.5)
* GEOSgcm_App  [v2.3.0 => v2.3.1](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.3.0...v2.3.1)
* NEW [WW3 - WAVEWATCH III](https://github.com/GEOS-ESM/WW3/releases/tag/v6.07.1-geos-r2)
* NEW [UMWM - University of Miami Wave Model](https://github.com/GEOS-ESM/umwm/releases/tag/v2.0.0-geos-r1)


## [11.5.0] - 2024-01-23

### Zero-diff to Previous Release: NO
### Restart Changes: NO

### Major Non-Zero-Diff Changes:
* NWP patches to get `BACM` forecast RMSE back to Jason levels [#883](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/883)
* Changed `gcm_setup` to set `OX_RELAXTIME` to 0.0 s when using OPS emissions (consistent with DAS), otherwise it remains at 259200 s [#560](https://github.com/GEOS-ESM/GEOSgcm_App/pull/560)
* Corresponding upgrade of [FVdycoreCubed_GridComp v2.10.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/releases/tag/v2.10.0)
* Replay import patch for ozone in tag [GOCART sdr_v2.2.1.1](https://github.com/GEOS-ESM/GOCART/releases/tag/sdr_v2.2.1.1)

### Major Zero-Diff Changes:
* Added the necessary exports for TLM/ADJ back to `MOIST` [#883](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/883)
* Added connectivity for a few fields from `MOIST` to `CHEM` [#867](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/867)
* Run `make_bcs` in different installation path [#870](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/870)
* Fixes #547 - bad default target_lat [#548](https://github.com/GEOS-ESM/GEOSgcm_App/pull/548)
* Update MPT flags for use with MAPL 2.44 (current develop) [#553](https://github.com/GEOS-ESM/GEOSgcm_App/pull/553)
* Add tuning flags for Open MPI and Intel MPI on SLES15 at NCCS [#543](https://github.com/GEOS-ESM/GEOSgcm_App/pull/543)

### Fixture Changes:
* ESMA_env  [v4.22.0 => v4.24.0](https://github.com/GEOS-ESM/ESMA_env/compare/v4.22.0...v4.24.0)
* GEOS_Util  [v2.0.4 => v2.0.5](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.0.4...v2.0.5)
* MAPL  [v2.42.0 => v2.43.0](https://github.com/GEOS-ESM/MAPL/compare/v2.42.0...v2.43.0)
* GEOSgcm_GridComp  [v2.4.0 => v2.5.0](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.4.0...v2.5.0)
* FVdycoreCubed_GridComp  [v2.9.0 => v2.10.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.9.0...v2.10.0)
* fvdycore  [v2.8.0 => v2.8.1](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.8.0...geos/v2.8.1)
* GOCART [v2.2.1 => sdr_v2.2.1.1](https://github.com/GEOS-ESM/GOCART/compare/v2.2.1...sdr_v2.2.1.1)
* GEOSradiation_GridComp [v1.5.1 => v1.6.0](https://github.com/GEOS-ESM/GEOSradiation_GridComp/compare/v1.5.1...v1.6.0)
* GEOSgcm_App  [v2.2.8 => v2.3.0](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.8...v2.3.0)


## [11.4.0] - 2023-12-01

### Zero-diff to Previous Release: YES
### Restart Changes: YES (see below)

* Updates to moist from `feature/wmputman/KM_v11_3_2_Moist_WMP` as of 2023-11-21 [#858](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/858). The following restarts have changed:
   1. `moist_import_checkpoint` was cleaned up to reduce the file size by removing the following variables:
   DQVDTDYN, DTDTDYN, OMEGA, PHIS, PLE, PLE_DYN_IN, PREF, QV_DYN_IN, T, TAUOROX, TAUOROY, T_DYN_IN, U, U_DYN_IN, V, V_DYN_IN, W, ZLE
   2. `gocart_import_checkpoint` fixed variable: QCTOT
* Use 3 specific `MOM6` resolutions [#542](https://github.com/GEOS-ESM/GEOSgcm_App/pull/542)
* Added support for `CICE6` thermo state rewind for replay [#854](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/854)
* New release of fvdycore [v2.8.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/releases/tag/geos%2Fv2.8.0) fixed non-layout-reproducibility at C180 and higher which was introduced in v2.
* Bugfix in boundary conditions for coupled T3MOM6 option [#861](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/861)
* Add ocean version to tile file header info [#860](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/860)
* Major fixes to enable `EASY` coupled model experiments [#538](https://github.com/GEOS-ESM/GEOSgcm_App/pull/538)
* Sync `DT` changes from `gcm_setup` into other setup scripts [#541](https://github.com/GEOS-ESM/GEOSgcm_App/pull/541)
* Fixture changes:
   * ESMA_env  [v4.20.6 => v4.22.0](https://github.com/GEOS-ESM/ESMA_env/compare/v4.20.6...v4.22.0)
   * GEOSgcm_GridComp  [v2.3.2 => v2.4.0](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.3.2...v2.4.0)
   * fvdycore  [v2.7.0 => v2.8.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.7.0...geos/v2.8.0)
   * GEOS_OceanGridComp  [v2.1.3 => v2.1.4](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.3...v2.1.4)
   * MOM6  [geos/v2.2.2 => geos/v2.2.3](https://github.com/GEOS-ESM/MOM6/compare/geos/v2.2.2...geos/v2.2.3)
   * CICE6  [geos/v0.1.2 => geos/v0.1.3](https://github.com/GEOS-ESM/CICE/compare/geos/v0.1.2...geos/v0.1.3)
   * GEOSgcm_App  [v2.2.7 => v2.2.8](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.7...v2.2.8)

## [11.3.3] - 2023-11-17

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:
* Merge branches `feature/wmputman/hwt_spring_exp` and `feature/donifan/KrokMG3` into `develop` [#855](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/855)
   * Merges in the latest changes of MGB2_2M code
   * More updates to GF2020 and GFDL
* Update DTs in `gcm_setup` for non-stock configurations [#537](https://github.com/GEOS-ESM/GEOSgcm_App/pull/537)
* Updated/added command line feature for `remap_restarts.py` [#19](https://github.com/GEOS-ESM/GEOS_Util/pull/19)
* Further cleanup of boundary conditions [#846](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/846)
* Minor land related code cleanup (coeffsib) [#845](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/845)
* Add fv namelist entry for AIST work [#696](https://github.com/GEOS-ESM/GEOSgcm/pull/696)
* Fixture changes:
   * NCEP_Shared  [v1.2.1 => v1.3.0](https://github.com/GEOS-ESM/NCEP_Shared/compare/v1.2.1...v1.3.0)
   * GMAO_Shared  [v1.9.5 => v1.9.6](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.5...v1.9.6)
   * GEOS_Util  [v2.0.3 => v2.0.4](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.0.3...v2.0.4)
   * GEOSgcm_GridComp  [v2.3.1 => v2.3.2](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.3.1...v2.3.2)
   * FVdycoreCubed_GridComp  [v2.8.0 => v2.9.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.8.0...v2.9.0)
   * fvdycore  [v2.6.0 => v2.7.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.6.0...geos/v2.7.0)
   * GEOSgcm_App  [v2.2.6 => v2.2.7](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.6...v2.2.7)

## [11.3.2] - 2023-10-31

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:
* Changes were made in this release to accomodate the newly availible SCU17 at NCCS, which introduced two separate operating systems. When running at NCCS, the `parallel_build.csh` script was changed to append `-SLES12` to the `build` and `install` directories for Skylake and Cascade Lake nodes running SLES 12. Alternatively, `parallel_build.csh -mil` can be specified to build on the Milan nodes running SLES 15. In that case, `-SLES15` will be appended to the `build` and `install` directories to avoid confusion and ensure compatibility with each respective platform. The following changes were made to the repositories to accomodate these updates:
   * ESMA_env  [v4.20.0 => v4.20.6](https://github.com/GEOS-ESM/ESMA_env/compare/v4.20.0...v4.20.6)
   * ESMA_cmake  [v3.35.0 => v3.36.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.35.0...v3.36.0)
   * MAPL  [v2.41.1 => v2.42.0](https://github.com/GEOS-ESM/MAPL/compare/v2.41.1...v2.42.0)
   * GEOSgcm_App  [v2.2.5 => v2.2.6](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.5...v2.2.6)

## [11.3.1] - 2023-10-20

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:
* Updates for SCU17 [#669](https://github.com/GEOS-ESM/GEOSgcm/pull/669)
* Patched GF2020: reverting order of plumes and allowing plume overlap and consistent autoconversion with classic GF [#838](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/838)
* Enable `FV3_CONFIG: HWT` for NH runs, `CONVPAR_OPTION: NONE` for ultra-high-res [#521](https://github.com/GEOS-ESM/GEOSgcm_App/pull/521)
* Add in missing `ESMF_ConfigSetAttribute` for `SNOW_ALBEDO_INFO` [#826](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/826)
* Add checks on snow states after application of LDAS increments; StieglitzSnow cleanup [#834](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/834)
* Add support for cice6 dumping intermediate restart in `CICE_plug` [#841](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/841)
* Fixes for running coupled on macOS [#526](https://github.com/GEOS-ESM/GEOSgcm_App/pull/526)
* Fixture changes:
   * ESMA_env  [v4.19.0 => v4.20.0](https://github.com/GEOS-ESM/ESMA_env/compare/v4.19.0...v4.20.0)
   * ESMA_cmake  [v3.34.0 => v3.35.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.34.0...v3.35.0)
   * GMAO_Shared  [v1.9.4 => v1.9.5](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.4...v1.9.5)
   * MAPL  [v2.41.0 => v2.41.1](https://github.com/GEOS-ESM/MAPL/compare/v2.41.0...v2.41.1)
   * GEOSgcm_GridComp  [v2.3.0 => v2.3.1](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.3.0...v2.3.1)
   * FVdycoreCubed_GridComp  [v2.7.0 => v2.8.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.7.0...v2.8.0)
   * CICE6  [geos/v0.1.0 => geos/v0.1.1](https://github.com/GEOS-ESM/CICE/compare/geos/v0.1.0...geos/v0.1.2)
   * icepack  [geos/v0.1.0 => geos/v0.1.1](https://github.com/GEOS-ESM/Icepack/compare/geos/v0.1.0...geos/v0.1.1)
   * GEOSgcm_App  [v2.2.3 => v2.2.5](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.3...v2.2.5)

## [11.3.0] - 2023-09-29

### Zero-diff to Previous Release: NO
### Restart Changes: NO

### Major Non-Zero-Diff Changes:
* Change default parameters to reduce 900mb T/Q forecast RMSE [#835](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/835)
* Updates to `fv_mapz.F90` in fvdycore  [v2.5.0 => v2.6.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.5.0...geos/v2.6.0)

## [11.2.1] - 2023-09-29

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:
* Updates from `feature/wmputman/hwt_spring_exp` [#828](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/828) [#515](https://github.com/GEOS-ESM/GEOSgcm_App/pull/515) [#75](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/pull/75) [#253](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/pull/253)
* Enhancements for MODIS-based snow albedo over land [#687](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/687)
* Add stretched Cube Sphere option to BCS package [#801](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/801)
* Combine stretched CS grid and regular CS grid [#817](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/817)
* Correct `LONG_NAME` of `CDCR2` [#818](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/818)
* Rename coupled grids [#695](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/695)
* Allow for tolerance option for SSTs and seaice fractions [#823](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/823)
* Enable `C-EVP` in `CICE6` [#824](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/824)
* `HISTORY.rc tmpl` for `GEOS-MITgcm` coupled model [#510](https://github.com/GEOS-ESM/GEOSgcm_App/pull/510)
* More cleanup of app scripts and add simtime to logging [#508](https://github.com/GEOS-ESM/GEOSgcm_App/pull/508)
* Fix `WSUB` use in other scripts [#512](https://github.com/GEOS-ESM/GEOSgcm_App/pull/512)
* Fix doubled logger output [#514](https://github.com/GEOS-ESM/GEOSgcm_App/pull/514)
* Bugfix for handling `GAAS` in replays and forecasts [#518](https://github.com/GEOS-ESM/GEOSgcm_App/pull/518)
* Fixture changes:
   * ESMA_cmake  [v3.31.1 => v3.34.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.31.1...v3.34.0)
   * GMAO_Shared  [v1.9.2 => v1.9.4](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.2...v1.9.4)
   * MAPL  [v2.40.3 => v2.41.0](https://github.com/GEOS-ESM/MAPL/compare/v2.40.3...v2.41.0)
   * GEOSgcm_GridComp  [v2.2.0 => v2.2.1](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.2.0...v2.2.1)
   * FVdycoreCubed_GridComp  [v2.6.0 => v2.7.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.6.0...v2.7.0)
   * fvdycore  [v2.4.1 => v2.5.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.4.1...geos/v2.5.0)
   * GEOS_OceanGridComp  [v2.1.2 => v2.1.3](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.2...v2.1.3)
   * MOM6  [geos/v2.2.1 => geos/v2.2.2](https://github.com/GEOS-ESM/MOM6/compare/geos/v2.2.1...geos/v2.2.2)
   * CICE6  [geos/v0.0.2 => geos/v0.1.0](https://github.com/GEOS-ESM/CICE/compare/geos/v0.0.2...geos/v0.1.0)
   * icepack  [geos/v0.0.3 => geos/v0.1.0](https://github.com/GEOS-ESM/Icepack/compare/geos/v0.0.3...geos/v0.1.0)
   * GEOSgcm_App  [v2.2.2 => v2.2.3](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.2...v2.2.3)


## [11.2.0] - 2023-08-25

### Zero-diff to Previous Release: NO
### Restart Changes: YES

### Major Non-Zero-Diff Changes:
* Extensive updates to the SHOC-EDMF turbulence parameterizations in [#783](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/783)
* Fixes for [UW and Turb bugs](https://github.com/GEOS-ESM/GEOSgcm_GridComp/issues/800) in [#802](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/802)
* Uptick to [GOCART v2.2.1](https://github.com/GEOS-ESM/GOCART/releases/tag/v2.2.1) with QFED path update.
* Uptick to [GEOSchem_GridComp v1.13.1](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.13.1) with QFED path update.
* Uptick to [TR v1.1.0](https://github.com/GEOS-ESM/TR/releases) which is non-zero-diff for certain tracers.
* Uptick to [GMI v1.1.0](https://github.com/GEOS-ESM/GMI/releases/tag/v1.1.0)


## [11.1.2] - 2023-08-24

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:

* Add GEOS-Chem washout parameterization to MOIST [#797](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/797)
* Add data atmosphere for ocean [#799](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/799)
* Move to `MAPL_GetResource` in Moist GC [#796](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/796)
* Remove convert script and clean some dead variables [#504](https://github.com/GEOS-ESM/GEOSgcm_App/pull/504)
* Add copy of `gwd_internal_rst` to SCM [#499](https://github.com/GEOS-ESM/GEOSgcm_App/pull/499)
* Changes to better support singularity [#488](https://github.com/GEOS-ESM/GEOSgcm_App/pull/488)
* Sensible defaults for stretched grid [#501](https://github.com/GEOS-ESM/GEOSgcm_App/pull/501)
* Fixed the cmpz plots for rms and anomaly correlation [#31](https://github.com/GEOS-ESM/GEOS_Util/pull/31)
* Eliminate accidental post-processing of `*.nc4-partial` files [#32](https://github.com/GEOS-ESM/GEOS_Util/pull/32)
* Update `CircleCI` to use Orb Default Baselibs and BCs for multiple repositories
* Fixture changes:
   * ESMA_cmake  [v3.31.0 => v3.31.1](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.31.0...v3.31.1)
   * GMAO_Shared  [v1.9.1 => v1.9.2](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.9.1...v1.9.2)
   * GEOS_Util  [v2.0.2 => v2.0.3](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.0.2...v2.0.3)
   * MAPL  [v2.40.0 => v2.40.3](https://github.com/GEOS-ESM/MAPL/compare/v2.40.0...v2.40.3)
   * GEOSgcm_GridComp  [v2.1.4 => v2.1.5](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.1.4...v2.1.5)
   * FVdycoreCubed_GridComp  [v2.5.0 => v2.6.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.5.0...v2.6.0)
   * GEOS_OceanGridComp  [v2.1.1 => v2.1.2](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.1...v2.1.2)
   * MOM6  [geos/v2.2.0 => geos/v2.2.1](https://github.com/GEOS-ESM/MOM6/compare/geos/v2.2.0...geos/v2.2.1)
   * icepack  [geos/v0.0.2 => geos/v0.0.3](https://github.com/GEOS-ESM/Icepack/compare/geos/v0.0.1...geos/v0.0.3)
   * GEOSradiation_GridComp  [v1.4.0 => v1.5.1](https://github.com/GEOS-ESM/GEOSradiation_GridComp/compare/v1.4.0...v1.5.1)
   * GEOSgcm_App  [v2.2.1 => v2.2.2](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.1...v2.2.2)


## [11.1.1] - 2023-07-28

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-Diff Changes:

* Fix GFDL Regression issue [#782](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/782)
* Fixes for stretched grid [#476](https://github.com/GEOS-ESM/GEOSgcm_App/pull/476)
* Add new sea ice components for coupling to `CICE6` [#772](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/772) [#478](https://github.com/GEOS-ESM/GEOSgcm_App/pull/478)
* Set coupled ocean DT to heartbeat (for now) [#483](https://github.com/GEOS-ESM/GEOSgcm_App/pull/483)
* Fix issue with Ocean `TerminateImport` in Surf [#789](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/789)
* Faster river routing [#774](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/774)
* Add `CATCHMENT_SPINUP` mode (remove snow every Aug 1 in NH or Feb 1 in SH) [#751](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/751)
* Bug fix to correct vegetation fraction assessment in `GetIds_carbon` (getids.F90) [#770](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/770)
* CO2 for CatchCN [#771](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/771)
* Added support for `READ_RESTART_BY_FACE` option [#459](https://github.com/GEOS-ESM/GEOSgcm_App/pull/459)
* Moving catchcn CO2 file to bcs dir [#481](https://github.com/GEOS-ESM/GEOSgcm_App/pull/481)
* Boundary conditions cleanup [#786](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/786)
* Cleanup of `make_bcs` tools that generate raster and tile files [#763](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/763)
* Fixes for SCM Model [#725](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/725)
* Add new `SCM` cases [#494](https://github.com/GEOS-ESM/GEOSgcm_App/pull/494)
* Update to new SCM file dir [#477](https://github.com/GEOS-ESM/GEOSgcm_App/pull/477)
* Fix for cloning in setup scripts [#492](https://github.com/GEOS-ESM/GEOSgcm_App/pull/492)
* Add `gwd_internal_rst` to `gcm_regress.j` [#475](https://github.com/GEOS-ESM/GEOSgcm_App/pull/475)
* Update `WSUB_ExtData.yaml`[#777]( https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/777)
* Move from `FLAP` to `fArgParse` [#441](https://github.com/GEOS-ESM/GEOSgcm_App/pull/441)
* Updates for Singularity: Add site option [#484](https://github.com/GEOS-ESM/GEOSgcm_App/pull/484)
* Remove Haswell at NCCS, other cleanup [#489](https://github.com/GEOS-ESM/GEOSgcm_App/pull/489)
* Fixture changes:
   * ESMA_env  [v4.17.0 => v4.19.0](https://github.com/GEOS-ESM/ESMA_env/compare/v4.17.0...v4.19.0)
   * ESMA_cmake  [v3.29.0 => v3.31.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.29.0...v3.31.0)
   * GEOS_Util  [v2.0.0 => v2.0.2](https://github.com/GEOS-ESM/GEOS_Util/compare/v2.0.0...v2.0.2)
   * MAPL  [v2.39.1 => v2.40.0](https://github.com/GEOS-ESM/MAPL/compare/v2.39.1...v2.40.0)
   * GEOSgcm_GridComp  [v2.1.3 => v2.1.4](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.1.3...v2.1.4)
   * GEOSgcm_App  [v2.2.0 => v2.2.1](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.2.0...v2.2.1)
   * FVdycoreCubed_GridComp  [v2.4.4 => v2.5.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.4.4...v2.5.0)
   * New [icepack](https://github.com/GEOS-ESM/Icepack)

## [11.1.0] - 2023-06-08

### Zero-diff to Previous Release: NO
### Restart Changes: NO

### Major Non-Zero-Diff Changes:
* Bugfix for GOCART: In dust and sea-salt, changed dimensions back to `globalCellCountPerDim` since these are needed to determine emission tuning parameters, not to allocate arrays. See changes [here](https://github.com/GEOS-ESM/GOCART/compare/sdr_v2.1.2.6...sdr_v2.1.2.7)
* Update to use NRL 2022 Solar Cycle File. Therefore, non-zero-diff results from Y2022 onward. [#468](https://github.com/GEOS-ESM/GEOSgcm_App/pull/468)
* Updates GEOSgcm to use [ESMA_env v4.17.0](https://github.com/GEOS-ESM/ESMA_env/releases/tag/v4.17.0). This update mainly brings in ESMF v8.5.0b22 which is a non-zero-diff change for GEOSgcm due to precision changes in grid generation. It also brings in many new features for MAPL development.

### Major Zero-Diff Changes:
* Updates GEOSgcm to use [FVdycoreCubed_GridComp v2.4.4](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/releases/tag/v2.4.4) and [GFDL_atmos_cubed_sphere geos/v2.4.1](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/releases/tag/geos%2Fv2.4.1). These updates bring in fixes for the FV3 standalone allowing it to work correctly. The GEOSgcm is zero-diff to these changes.

## [11.0.4] - 2023-06-07

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Changes:
* Bugfix for vegetation type `ity` to ignore variable when reading from restart file [#757](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/757)
* Correct `LONG_NAME` for absorbed and emitted longwave flux in Surface [#764](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/764)
* Add Held-Suarez GridComp (`GEOShs_GridComp`) [#756](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/756)
* Use `-O2` optimization in moist with GNU Release [#762](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/762)
* Fix `COUPLEDIR` at NAS [#469](https://github.com/GEOS-ESM/GEOSgcm_App/pull/469)
* Add PM fields to HISTORY [#467](https://github.com/GEOS-ESM/GEOSgcm_App/pull/467)
* Make `CICE4` built as a shared library [#322](https://github.com/GEOS-ESM/GMAO_Shared/pull/322)
* Brought `LANL_Shared/CICE4/source/ice_therm_vertical.F90` from `feature/atrayano/MITgcm-DYAMOND` branch to reset the ice to default profile under some error conditions [#326](https://github.com/GEOS-ESM/GMAO_Shared/pull/326)
* Uptick to [GEOS_OceanGridComp v2.1.1](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.1.0...v2.1.1)
* Uptick to [FVdycoreCubed_GridComp v2.4.3](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.4.0...v2.4.3)

## [11.0.3] - 2023-05-26

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Changes:
* Bugfix in `GEOSgcm_GridComp` to enable current Moist to run with binary restarts [#759](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/759)
* Uptick `ESMA_env` to fix a parallel_build issue with tmpdir at NAS
* Uptick `FVdycoreCubed_GridComp` to add an interface to `GEOS-gtFV3` as well as adding a return code and verify to DynSetup.

## [11.0.2] - 2023-05-23

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Changes:
* Updates related to MITgcm
  * Uptick to MITgcm to next [checkpoint](https://github.com/GEOS-ESM/MITgcm/commit/628b4a6c855aa63b5a0abd98cd35d549b969caa7)
  * Uptick to [MOM6 geos/v2.2.0](https://github.com/GEOS-ESM/MOM6/compare/geos/v2.1.0...geos/v2.2.0)
  * Uptick to [GEOS_OceanGridComp v2.1.0](https://github.com/GEOS-ESM/GEOS_OceanGridComp/compare/v2.0.0...v2.1.0)

## [11.0.1] - 2023-05-18

### Zero-diff to Previous Release: YES
### Restart Changes: NO, with minor exception to solar mentioned below

### Major Changes:
* Merge in GEOS/mitgcm [#547](https://github.com/GEOS-ESM/GEOSgcm/pull/547) [#724](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/724) [#423](https://github.com/GEOS-ESM/GEOSgcm_App/pull/423) [#22](https://github.com/GEOS-ESM/UMD_Etc/pull/22) [GEOS_OceanGridComp v2.0.0](https://github.com/GEOS-ESM/GEOS_OceanGridComp/releases/tag/v2.0.0)
* Add datalake [#557](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/557)
* Restructure `make_bcs` scripts [#740](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/740)
* Update `make_bcs` legacy input path [#718 and associated PRs](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/718)
* Reorganize `make_bcs` output directory [#729](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/729)
* Bug fixes to address errors that caused fail of start-stop regression test for most Catchment-CN4.5 land tiles [#657](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/657)
* Bug fix remapping of CatchCN restart variables (`RZMM`, `TGWM`, `SFMM`) [#741](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/741)
* Updated `AGCM.rc.tmpl` for reordered sw cloud optics file in RRTMGP v1.6 [#446](https://github.com/GEOS-ESM/GEOSgcm_App/pull/446). The INTERNAL state of SOLAR now has `COSZSW`, `CLDxxSW`, and `TAUxxPAR` added to it.
* Remove Rome detection at NAS, fixes for AWS and unknown [#460](https://github.com/GEOS-ESM/GEOSgcm_App/pull/460)
* Fixture changes:
   * [GEOSgcm_App  v2.1.0 => v2.1.2](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.1.0...v2.1.2)
   * [GEOSgcm_GridComp  v2.0.0 => v2.1.1](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.0.0...v2.1.1)
   * [MAPL  v2.38.1 => v2.39.1](https://github.com/GEOS-ESM/MAPL/compare/v2.38.1...v2.39.1)
   * [GEOSradiation_GridComp  v1.3.0 => v1.4.0](https://github.com/GEOS-ESM/GEOSradiation_GridComp/compare/v1.3.0...v1.4.0)
   * [RRTMGP  geos/v1.5+1.0.0 => geos/v1.6+1.1.0](https://github.com/GEOS-ESM/rte-rrtmgp/compare/geos%2Fv1.5%2B1.0.0...geos%2Fv1.6%2B1.1.0)
   * [GEOS_Util  v1.1.1 => v2.0.0](https://github.com/GEOS-ESM/GEOS_Util/compare/v1.1.1...v2.0.0)
   * [ESMA_cmake  v3.28.0 => v3.29.0](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.28.0...v3.29.0)
   * [ESMA_env  v4.9.1 => v4.9.2](https://github.com/GEOS-ESM/ESMA_env/compare/v4.9.1...v4.9.2)
   * New [MITgcm](https://github.com/GEOS-ESM/MITgcm)

## [11.0.0] - 2023-05-11

### Zero-diff to Previous Release: NO
### Restart Changes: YES

### Major Changes:
* Updated L181 and L91 ak/bk to remove kinks in 1st derivative of DZ. Adjusted top four aks for L137.
* Brought in changes from Hazardous Weather Testbed tags.
* Stretched-grid updates.
* Ability to output to generic X-Y grids (such as Lambert Conformal).
* New output diagnostics availible.
* Re-enabling wet scavenging tendency output.
* Additional tunings for physics.
* Improvements to `gcm_regress.j` for separate start-stop and layout tests.
* More details regarding the changes can be found here:
   * [GEOSgcm_App](https://github.com/GEOS-ESM/GEOSgcm_App/compare/v2.0.0...v2.1.0)
   * [GEOSgcm_GridComp](https://github.com/GEOS-ESM/GEOSgcm_GridComp/compare/v2.0.0...v2.1.0)
   * [FVdycoreCubed_GridComp](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/compare/v2.0.0...v2.3.0)
   * [fvdycore](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/compare/geos/v2.0.0...geos/v2.4.0)
   * [GMAO_Shared](https://github.com/GEOS-ESM/GMAO_Shared/compare/v1.8.0...v1.9.0)
   * [GOCART](https://github.com/GEOS-ESM/GOCART/compare/sdr_v2.1.2.1...sdr_v2.1.2.6)
   * [MAPL](https://github.com/GEOS-ESM/MAPL/compare/v2.35.2...v2.38.1)

## [11.0.0-rc.1] - 2023-03-10

### Zero-diff to Previous Release: NO
### Restart Changes: YES

### Major Non-zero-diff Changes:

* Refactor MoistGridComp to separate GF, UW, BACM, GFDL and MGB2 codebases into distinct interface modules and leverage shared process level code in a new moist Process_Library module (L72 defaults to BACM_1M).
* TRB and Moist refactoring support updates to new vertical levels beyond L72 including a move to GF2020 and new cldmicro schemes (L72 defaults to GF-Legacy).
* GWD code includes new convective background scheme and anisotropic ridge orographic scheme (L72 defaults to old schemes).
* FV3 updated to support stretched grids and dual hydrostatic/non-hydrostatic build.

## [10.25.1] - 2023-03-08

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-diff Changes:

* Introducing `IGNI` as a new component that integrates fire weather observations into fuel moisture codes and fire behavior indexes based on the CFFWI system by @adarmenov in [#699](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/699) [#710](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/710) [#410](https://github.com/GEOS-ESM/GEOSgcm_App/pull/410)
* "make boundary conditions" (`make_bcs`) package updates:
   * Update paths to use a new inputs area by @biljanaorescanin in [#694](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/694)
   * Cleanup and reorganization of files in `./Raster` by @gmao-rreichle in [#707](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/707)
   * Add new 0.66 degree MOM6 grid into `make_bcs` by @yvikhlya in [#712](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/712)
* Cleanup of Catchment-CN constants in `CatchmentCNRst.F90` by @gmao-jkolassa in [#682](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/682)
* Removed unused code in GWD by @bena-nasa in [#705](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/705)
* NAS updates:
   * Allow only Rome builds to run on Romes at NAS by @mathomp4 in [#411](https://github.com/GEOS-ESM/GEOSgcm_App/pull/411)
   * Add Rome detections to other setup scripts by @mathomp4 in [#414](https://github.com/GEOS-ESM/GEOSgcm_App/pull/414)
* Got `AERO_PROVIDER=GMICHEM` working with necessary changes to `AGCM.rc` to run with it (aerosol optics files) by @ssteenro in [#416](https://github.com/GEOS-ESM/GEOSgcm_App/pull/416)
* Additions to `GMAO_ods` to include trace gas support for `CoDAS`. Also includes more OMPS and AMSR support from Ricardo's `rt_g530_1.6.0_merge` tag by @briardew in [#311](https://github.com/GEOS-ESM/GMAO_Shared/pull/311)
* Move `regrid` and `remap_restarts` from `post` directory to `pre` directory by @mathomp4 in [#3](https://github.com/GEOS-ESM/GEOS_Util/pull/3)
* Plot updates:
   * Updates for QBO labeling and added `MOIST` variables by @sdrabenh in [#6](https://github.com/GEOS-ESM/GEOS_Util/pull/6)
   * `3CH` and `quickplot` updates by @lltakacs in [#8](https://github.com/GEOS-ESM/GEOS_Util/pull/8)
* Update to Baselibs 7.8.1 (ESMF 8.4.1) to avoid possible memory corruption bug [#533](https://github.com/GEOS-ESM/GEOSgcm/pull/533)
* Update to ESMA_cmake v3.26.0 to better handle Rome nodes [#531](https://github.com/GEOS-ESM/GEOSgcm/pull/531)
* Updates to [MAPL 2.35.2](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.35.2) which includes:
   * Changes from @weiyuan-jiang needed by the land group.
   * Bug fixes for `ExtData` from @bena-nasa and fixes for UFS folks

## [10.25.0] - 2023-01-20

### Zero-diff to Previous Release: Not always
### Restart Changes: NO

### Potential Non-zero-diff Changes:
* Updated to use 2021 NRL Solar File by @mathomp4 in https://github.com/GEOS-ESM/GEOSgcm_App/pull/366
* Updated to use ExtData2G by default by @vbuchard in https://github.com/GEOS-ESM/GEOSgcm_App/pull/381

## Zero-diff Changes for Stock Configuration
* Fixes to allow non-72-level runs to use ExtData2G by @mathomp4 in https://github.com/GEOS-ESM/GEOSgcm_App/pull/389
* Updated `logging.yaml` by adding YAML linter by @mathomp4 in https://github.com/GEOS-ESM/GEOSgcm_App/pull/391

## Structural Changes
* Moved `GEOS_Util` out of `GMAO_Shared` into its own repository.

## [10.24.0] - 2023-01-18

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-diff Changes:

* Moved TR, GMI, and StratChem to separate repositories by @mathomp4 in [#509](https://github.com/GEOS-ESM/GEOSgcm/pull/509)

## [10.23.3] - 2023-01-17

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-diff Changes:

* Improved the user interface of `mk_runofftbl.F90` by @sanAkel in [#693](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/693)
* Updates for WSTAR Calculation and plots package by @lltakacs in [#313](https://github.com/GEOS-ESM/GMAO_Shared/pull/313)
* Upticks to additional repositories:
  1. MAPL [v2.33.0 -> v2.34.2](https://github.com/GEOS-ESM/MAPL/releases) highlights:
     * Fixed the naming convention of the split field name [(#1874)](https://github.com/GEOS-ESM/MAPL/issues/1874). For this, before on split fields in History you'd get out `DU`, `DU002`, `DU003`. But now MAPL will do `DU001`, `DU002`, `DU003`
     * Updates for better support of State Specs in GOCART (see https://github.com/GEOS-ESM/GOCART/issues/202)
       1. Support for `*` expansion in long names
       2. Support to fill `%d` in long names
  2. ESMA_cmake [v3.21.0 -> v3.24.0](https://github.com/GEOS-ESM/ESMA_cmake/releases)
  3. GEOSchem_GridComp [v1.11.0](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.11.0)
  4. GEOS_OceanGridComp [v1.2.1](https://github.com/GEOS-ESM/GEOS_OceanGridComp/releases/tag/v1.2.1)
  5. MOM6 [geos/v2.1.0](https://github.com/GEOS-ESM/MOM6/tree/geos/v2.1.0)


## [10.23.2] - 2022-12-16

### Zero-diff to Previous Release: YES
### Restart Changes: NO

### Major Zero-diff Changes:

* Read bcs parameters from target bc directory instead of from catchment restart file  by @weiyuan-jiang in [#670](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/670)
* Remove `snowalb` from restart file when target bc does not have it  by @weiyuan-jiang in [#673](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/673)
* Restore `mk_CatchRestarts` so `regrid.pl` will not work with new bcs with snowalb anymore  by @weiyuan-jiang in [#674](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/674)
* Add adjustable tolerance to the rasterization routine  by @atrayano in [#663](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/663)
* Add Option to Use MODIS-based Snow Albedo Climatology  by @biljanaorescanin in [#618](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/618)
* Further cleanup and reorganization of `make_bcs`  by @weiyuan-jiang in [#634](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/634)
* Add optional data sea ice thickness for atmosphere-only configuration  by @sanAkel in [#686](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/686)
* Add warning about QQJ,K in the context of new GMI mechanisms  by @mmanyin in [#378](https://github.com/GEOS-ESM/GEOSgcm_App/pull/378)
* Update path for `M2_REPLAY_ANA_LOCATION`  by @sanAkel in [#377](https://github.com/GEOS-ESM/GEOSgcm_App/pull/377)
* `HISTORY.AOGCM-MOM5.rc.tmpl` updated to be consistent with the MOM6 and AMIP templates  by @yvikhlya in [#382](https://github.com/GEOS-ESM/GEOSgcm_App/pull/382)
* `regrid_exch: tile_hist.data` removed from history template  by @yvikhlya in [#383](https://github.com/GEOS-ESM/GEOSgcm_App/pull/383)
* Add a warning message for users  that `regrid.pl` is being phased out and replaced with `remap_restarts.py`  by @biljanaorescanin in [#304](https://github.com/GEOS-ESM/GMAO_Shared/pull/304)
* Bug fix for remapping MERRA-2 from 2021-06 to 2021-09  by @mathomp4 in [#303](https://github.com/GEOS-ESM/GMAO_Shared/pull/303)
* Make MERRA2 remapping with `remap_restarts.py` consistent with `regrid.pl`  by @mathomp4 in [#308](https://github.com/GEOS-ESM/GMAO_Shared/pull/308)
* Modify `remap_restarts.py` to use `argparse`  by @mathomp4 in [#291](https://github.com/GEOS-ESM/GMAO_Shared/pull/291)
* Further OBIO support added to RRTMGP and Chou-Suarez in [GEOSradiation_GridComp v1.2.0](https://github.com/GEOS-ESM/GEOSradiation_GridComp/releases/tag/v1.2.0)
* Upticked from MAPL v2.30.2 to [MAPL v2.33.0](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.33.0)
* Upticks in `env`, `cmake`, and `ecbuild`


## [10.23.1] - 2022-11-17

### Zero-diff to Previous Release: YES and NO (see below)
### Restart Changes: YES

### Non-zero-diff Changes:
* Uptick `GEOSradiation_GridComp` to v1.1.0. Two fields (`FSWBANDN` and `FSWBANDNAN`) in `solar_internal_rst` were previously `MAPL_UNDEF` because there was no facility in RRTMG to calculate them yet. This facility is now added and thus this restart is technically non-zero-diff but these fields now have realistic values by @mathomp4 in [#483](https://github.com/GEOS-ESM/GEOSgcm/pull/483)

### Major Zero-diff Changes:
* Upticked GEOSchem_GridCom from v1.10.1 to [v1.10.4](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.10.4)
* Upticked MAPL from v2.25.0 to [v2.30.2](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.30.2)
* Upticked GOCART from v2.1.0 to [v2.1.2](https://github.com/GEOS-ESM/GOCART/releases/tag/v2.1.2)
* RRTMG can now provide two new exports `DROBIO` and `DFOBIO` (downwelling direct and diffuse fluxes all-sky, with aerosol) in the 33 bands used by ORadBioGC. These calculations can be turned on if `RRTMG_TO_OBIO: .TRUE.` appears in `AGCM.rc` when RRTMG SW is run by @mathomp4 in [#483](https://github.com/GEOS-ESM/GEOSgcm/pull/483)
* Updates for Spack Stack by @mathomp4 in [#643](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/643)
* Remove CUDA macros from `GEOS_GwdGridComp` by @darianboggs in [#636](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/636)
* Remove unused NCEP code from `GEOS_GwdGridComp` by @darianboggs in [#640](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/640)
* Modified `RUN1` to load balance by @aoloso in [#647](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/647)
* Support for catchcn ensemble run by @weiyuan-jiang in [#645](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/645)
* Add `CatchCN` vars to rst by @weiyuan-jiang in [#658](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/658)
* Correction of units for mislabeled `CatchCNCLM45` variables by @gmao-jkolassa in [#660](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/660)
* Update HISTORY for coupled model applications by @sanAkel in [#359](https://github.com/GEOS-ESM/GEOSgcm_App/pull/359)
* Update for `gmichem_setup` by @mmanyin in [#361](https://github.com/GEOS-ESM/GEOSgcm_App/pull/361)
* Update Oserver calculations by @mathomp4 in [#347](https://github.com/GEOS-ESM/GEOSgcm_App/pull/347)
* Add explicit CONTACT to History by @mathomp4 in [#367](https://github.com/GEOS-ESM/GEOSgcm_App/pull/367)
* Fix cloning for coupled experiments by @mathomp4 in [#365](https://github.com/GEOS-ESM/GEOSgcm_App/pull/365)
* Add `GEOSCHEMchem_ExtData.yaml` to list of yaml files for `EXTDATA2G` by @christophkeller in [#368](https://github.com/GEOS-ESM/GEOSgcm_App/pull/368)
* Update `gmichem_setup` and `stratchem_setup` by @mmanyin in [#270](https://github.com/GEOS-ESM/GEOSgcm_App/pull/370)
* Bugfix for forecast template and changes for default forecast HISTORY by @sdrabenh in [#373](https://github.com/GEOS-ESM/GEOSgcm_App/pull/373)
* Add preliminary support for Singularity by @mathomp4 in [#350](https://github.com/GEOS-ESM/GEOSgcm_App/pull/350)
* Make `GMAO_etc` to depend on `GMAO_perllib` by @mathomp4 in [#297](https://github.com/GEOS-ESM/GMAO_Shared/pull/297)
* Update EASE grid tile file name by @weiyuan-jiang in [#295](https://github.com/GEOS-ESM/GMAO_Shared/pull/295)
* Fix `gcmpost.script` logic to generate `xdf.tabl` for collections with `monthly:1` attribute by @sdrabenh in [#300](https://github.com/GEOS-ESM/GMAO_Shared/pull/300)
* In addition to the apove changes, these additional repositories were upticked as well:
   1. [cmake v3.19.0](https://github.com/GEOS-ESM/ESMA_cmake/releases/tag/v3.19.0)
   2. [env v4.6.0](https://github.com/GEOS-ESM/ESMA_env/releases/tag/v4.6.0)
   3. [NCEP_Shared v1.2.1](https://github.com/GEOS-ESM/NCEP_Shared/releases/tag/v1.2.1)
   4. [FVdycoreCubed_GridComp v1.12.1](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/releases/tag/v1.12.1)
   5. [fvdycore v1.5.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/releases/tag/geos%2Fv1.5.0)

## [10.23.0] - 2022-09-12

### Zero-diff to Previous Release: NO
### Restart Changes: NO

### Non-zero-diff Changes:
* Updates to GOCART-2G. Full list of changes can be fount here: [GOCART v2.1.0](https://github.com/GEOS-ESM/GOCART/releases/tag/v2.1.0)
* Change carbon species names in most for use with GOCART2G v2.1.0 by @vbuchard in [#624](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/624)
* Bugfix for correct TKE initialization value in turbulence by @sanAkel in [#603](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/603)
* Carbon species names changed in HISTORY templates for use with GOCART2G v2.1.0 by @weiyuan-jiang in [#317](https://github.com/GEOS-ESM/GEOSgcm_App/pull/317)
* Change names for BC, BR, and OC in plots package by @sdrabenh in [#290](https://github.com/GEOS-ESM/GMAO_Shared/pull/290)

## [10.22.6] - 2022-09-08

### Zero-diff to Previous Release: YES
### Restart Changes: Potentially

### Potential Non-zero-diff Change to restarts
* Removed extra variables that are in ice and water restarts. If the user is starting with `saltwater_internal_rst`, then variables are changed when `SaltIntSplitter` runs. Otherwise, this change is zero-diff by @weiyuan-jiang in [#623](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/623)

### Zero-diff Changes
* Load balance changes for `CICECORE` by @aoloso in [#626](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/626)
* Added a few connectivities in `AGCM` and `PHYS` by @mmanyin in [#613](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/613)
* Removed extraneous declaration by @mmanyin in [#617](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/617)
* Added OH restart files (commented out by default) by @mmanyin in [#342](https://github.com/GEOS-ESM/GEOSgcm_App/pull/342)
* Zero-diff bug fixes in `make_bcs` package by @weiyuan-jiang in [#601](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/601)
* Added `CircleCi` run of `GEOSgcm` by @mathomp4 in [#620](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/620)
* Added `CircleCi` tests to `GEOSgcm_App` by @mathomp4 in [#345](https://github.com/GEOS-ESM/GEOSgcm_App/pull/345)
* Fix missing back quote by @sdrabenh in [#351](https://github.com/GEOS-ESM/GEOSgcm_App/pull/351)
* Added warning message to `gcm_setup` regarding MOM5 model crash by @sanAkel in [#353](https://github.com/GEOS-ESM/GEOSgcm_App/pull/353)
* Added explicit regrid method in `HISTORY.AGCM.rc.tmpl` by @mathomp4 in [#344](https://github.com/GEOS-ESM/GEOSgcm_App/pull/344)
* Added `LD_PRELOAD` for Coupled Model by @mathomp4 in [#341](https://github.com/GEOS-ESM/GEOSgcm_App/pull/341)
* Added `S2Sv3` to `MOM6` test. Add YAML validator by @mathomp4 in [#281](https://github.com/GEOS-ESM/GMAO_Shared/pull/281)
* Added command line option for `remap_restarts.py` and moved temporary directory to `out_dir` for merra2.  Additional test cases were added by @weiyuan-jiang in [#276](https://github.com/GEOS-ESM/GMAO_Shared/pull/276)
* Fix in ncdiag for Intel 2022.1 by @mathomp4 in [#280](https://github.com/GEOS-ESM/GMAO_Shared/pull/280)
* Updated `obsys_rc.py`, `check_obsysrc.py`, and associated unit tests to Python 3. Features added to the `cmpdir.pl` script. by @gmao-jstassi in [#279](https://github.com/GEOS-ESM/GMAO_Shared/pull/279)
* Added new [QuickChem repo](https://github.com/GEOS-ESM/QuickChem/releases/tag/v1.0.0)
* Upticked to:
   1. MAPL [v2.25.0](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.25.0)
   2. [cmake v3.18.0](https://github.com/GEOS-ESM/ESMA_cmake/releases/tag/v3.18.0)
   3. [env v4.4.0](https://github.com/GEOS-ESM/ESMA_env/releases/tag/v4.4.0)
   4. [FVdycoreCubed_GridComp v1.11.0](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/releases/tag/v1.11.0)
   5. [GEOSchem_GridComp v1.10.1](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.10.1)
   6. [GEOS_OceanGridComp v1.1.1](https://github.com/GEOS-ESM/GEOS_OceanGridComp/releases/tag/v1.1.1)
   7. [mom6 v2.0.4](https://github.com/GEOS-ESM/MOM6/releases/tag/geos%2Fv2.0.4)

## [10.22.5] - 2022-07-27

### Zero-diff to Previous Release: YES
### Restart Changes: NO

Zero-Diff Changes:
* Moves `GEOSradiation_GridComp` from [GEOSgcm_GridComp](https://github.com/GEOS-ESM/GEOSgcm_GridComp) into its own repo [GEOSradiation_GridComp](https://github.com/GEOS-ESM/GEOSradiation_GridComp).

## [10.22.4] - 2022-07-25

### Zero-diff to Previous Release: YES for Intel compilers; NO for GNU compilers
### Restart Changes: NO

Zero-Diff Changes:
* Updates to allow ExtData2G by @bena-nasa in [#331](https://github.com/GEOS-ESM/GEOSgcm_App/pull/331)
* Cleanup history templates for GOCART2G and updates to use convective scavenging by @acollow in [#336](https://github.com/GEOS-ESM/GEOSgcm_App/pull/336)
* Added check for `INFINITY` and replacing with `UNDEF` by @aoloso in [#270](https://github.com/GEOS-ESM/GMAO_Shared/pull/270)
* Added timed barrier call after `DO_UPDATE_PHY` calls by @aoloso in [#602](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/602)
* Cleanup of Catch[CN]-related restart utilities in `./GEOSsurface_GridComp/Utils/mk_restarts` by @gmao-rreichle in [#571](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/571)
* Update CircleCI to use Baselibs 7.5.0 by @mathomp4 in [#605](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/605) [#273](https://github.com/GEOS-ESM/GMAO_Shared/pull/273)
* Set ks with bk in `m_set_eta` by @mathomp4 in [#271](https://github.com/GEOS-ESM/GMAO_Shared/pull/271)
* Added more robust check for history's monthly attribute by @sdrabenh in [#274](https://github.com/GEOS-ESM/GMAO_Shared/pull/274)
* Added python version of `regrid.pl` named `remap_restarts.py` by @weiyuan-jiang in [#238](https://github.com/GEOS-ESM/GMAO_Shared/pull/238)
* Create test suite for `remap_restarts.py` by @weiyuan-jiang in [#267](https://github.com/GEOS-ESM/GMAO_Shared/pull/267)
* Provide for setting up a no-aerosol GMI simulation by @mmanyin in [#333](https://github.com/GEOS-ESM/GEOSgcm_App/pull/333)
* Uptick to GEOSchem_GridComp [v1.9.5](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.9.5)
* Uptick to MAPL [v2.23.1](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.23.1)
* Uptick to [v4.2.0](https://github.com/GEOS-ESM/ESMA_env/releases/tag/v4.2.0) which uses Baselibs 7.5.0 (needed by MAPL 2.23.0)
* Uptick to [v3.17.0](https://github.com/GEOS-ESM/ESMA_cmake/releases/tag/v3.17.0) change to support GCC 12 (non-zero-diff for GNU builds)

**Full list of changes for GCM fixture**: https://github.com/GEOS-ESM/GEOSgcm/compare/v10.22.3...v10.22.4

## [10.22.3] - 2022-06-08

### Zero-diff to Previous Release: YES
### Restart Changes: NO

Zero-Diff Changes:
* Update CMake in ADAS-only subdirs by @mathomp4 in [#262](https://github.com/GEOS-ESM/GMAO_Shared/pull/262)
* Change restart name `geocachem_internal_rst` to `achem_internal_rst` in `regrid.pl` by @weiyuan-jiang in [#264](https://github.com/GEOS-ESM/GMAO_Shared/pull/264)
* Fix Emissions Handling: Use copy not link by @mathomp4 in [#325](https://github.com/GEOS-ESM/GEOSgcm_App/pull/325)
* Use correct EXPID when cloning an experiment by @sdrabenh in [#329](https://github.com/GEOS-ESM/GEOSgcm_App/pull/329)
* New Files added to support ExtData2G by @bena-nasa in [#590](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/590)
* Upticks to [MAPL v2.21.3](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.21.3) and [CMAKE v3.16.0](https://github.com/GEOS-ESM/ESMA_cmake/releases/tag/v3.16.0)

## [10.22.2] - 2022-05-03

### Zero-diff to Previous Release: YES except for 4DIAU Replays
### Restart Changes: NO

Major Zero-Diff Changes:
* Hotfix to [GOCART](https://github.com/GEOS-ESM/GOCART/releases/tag/v2.0.7) and [GEOSchem_GridComp](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.9.2) to allow proper functioning and regression of 4D-IAU.
* Hotfix to [GOCART](https://github.com/GEOS-ESM/GOCART/releases/tag/v2.0.6) using non-default klid.
* Emissions handling now uses experiment RC directory by @mathomp4 in [#320](https://github.com/GEOS-ESM/GEOSgcm_App/pull/320)
* Set collection's `monthly` attribute by default for most collections by @sdrabenh in [#316](https://github.com/GEOS-ESM/GEOSgcm_App/pull/316)  [#259](https://github.com/GEOS-ESM/GMAO_Shared/pull/259)
* Removed connectivities from MOIST to CHEM that are no longer needed by @mmanyin in [#572](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/572)
* Defined replay predictor duration by @lltakacs in [#581](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/581)
* Initialize arrays in mkiau GC by @mathomp4 in [#574](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/574)
* Add fstats customized for screen-level Q and T with "land only" option  by @saraqzhang in [#246](https://github.com/GEOS-ESM/GMAO_Shared/pull/246)
* Clean up Optics in `AGCM.rc.tmpl` by @mathomp4 in [#319](https://github.com/GEOS-ESM/GEOSgcm_App/pull/319)
* Update tags in `regrid.pl` by @mathomp4 in [#257](https://github.com/GEOS-ESM/GMAO_Shared/pull/257)
* Default to 72x36 for c12 mom6 by @mathomp4 in [#314](https://github.com/GEOS-ESM/GEOSgcm_App/pull/314)
* Updates for Spack Support, Round 2 by @mathomp4 in [#568](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/568)  [#312](https://github.com/GEOS-ESM/GEOSgcm_App/pull/312)
* Update CI to use v1 orb and job by @mathomp4 in [#578](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/578)
* Minor CMake change for mod file by @mathomp4 in [#258](https://github.com/GEOS-ESM/GMAO_Shared/pull/258)
* Upticks in [MAPL](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.20.0)  [GEOS_OceanGridComp](https://github.com/GEOS-ESM/GEOS_OceanGridComp/releases/tag/v1.1.0)  [MOM6](https://github.com/GEOS-ESM/MOM6/releases/tag/geos%2Fv2.0.3)  [CICE](https://github.com/GEOS-ESM/CICE/releases/tag/geos%2Fv0.0.1)

## [10.22.1] - 2022-03-18

### Zero-diff to Previous Release: YES
### Restart Changes: NO

Major Zero-Diff Changes:
* `tskinice` real fix by @rtodling in [#547](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/547)  [#297](https://github.com/GEOS-ESM/GEOSgcm_App/pull/297)
* Update geosit history by @rtodling in [#301](https://github.com/GEOS-ESM/GEOSgcm_App/pull/301)
* Add option to read ocean _data_ using `ExtData` by @sanAkel in [#562](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/562)
* Support for ocean datasets using ExtData by @sanAkel in [#245](https://github.com/GEOS-ESM/GMAO_Shared/pull/245)
* Gather memory and detailed timing information for coupled model by @sanAkel in [#289](https://github.com/GEOS-ESM/GEOSgcm_App/pull/289)
* Reynolds ONLY SST and Ice Concentration with a land-sea mask from @rcullath by @sanAkel in [#239](https://github.com/GEOS-ESM/GMAO_Shared/pull/239)
* Remove Ocean Grid Comp by @mathomp4 in [#551](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/551)  [#379](https://github.com/GEOS-ESM/GEOSgcm/pull/379)
* For sea ice development: add CICE6 and SIS2 sea ice models  by @sanAkel in [#558](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/558)  [#385](https://github.com/GEOS-ESM/GEOSgcm/pull/385)
* Run History in predictor by @bena-nasa in [#546](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/546)
* Updates for using cubed sphere observed precip files by @lltakacs in [#559](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/559)
* Profiling with pflogger by @tclune in [#307](https://github.com/GEOS-ESM/GEOSgcm_App/pull/307)
* `chckhist.new` update to fix plotting for OPS HISTORY.rc, minor 3CH bugfix by @lltakacs in [#252](https://github.com/GEOS-ESM/GMAO_Shared/pull/252)
* Updates to support Spack by @mathomp4 in several repositories.
* Upticks in MAPL, ESMA_cmake, ESMA_env, and GEOSchem_GridComp.

## [10.22.0] - 2022-03-15

### Zero-diff to Previous Release: NO
### Restart Changes: YES

Summary of changes for the refactored GOCART-2G:

* This is the first release of GEOSgcm that includes GOCART-2G, a refactoring of the GOCART component that adopts the ESMF for every child component and refactors the multi-instantiation mechanism. GOCART-2G only includes aerosols; other trace gases are not included by design.
* This release also includes new science, including the inclusion of secondary organic aerosols (SOAs) and Brown Carbon. In this implementation, Brown Carbon is comprise of that portion of Organic Carbon emitted by biomass burning, having absorptive properties.
* This release also introduces the notion of a "Process Library" which replaces what used to be found under Chem_Shared; it also eliminates any dependency on Chem_Base. The @GOCART repository is shared with NOAA and has been implemented in the UFS.
* Several new restarts (achem,cabc,cabr,caoc,du,ni,ss,su) have been added since the gridded components of GOCART-2G have been split out accordingly.
* GOCART-2G required changes in many other sub-repositories. Users are encouraged to look through those individually for a detailed list of changes.

## [10.21.1] - 2022-02-14

### Zero-diff to Previous Release: YES
### Restart Changes: NO

Major Zero-Diff Changes:
1. Add CLDXXSW diagnostics and many cosmetic changes to Solar GC by @dr0cloud in [#510](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/510)
2. Add additional radiation RRTMG tau and water path diagnostics by @dr0cloud in [#519](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/519)
3. Simple fix to prevent negative tauaer in RRTMG LW by @dr0cloud in [#521](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/521)
4. Add RRTMGP as a fork in GEOS by @mathomp4 in [#528](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/528)
5. Update RRTMGP file locations and half gpoints by @mathomp4 in [#294](https://github.com/GEOS-ESM/GEOSgcm_App/pull/294)
6. Cleanup of Catchment model constants by @gmao-rreichle in [#525](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/525)
7. Removed redundant code: DQS calc, QC constraint, RA calc by @gmao-rreichle in [#518](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/518)
8. Fix `mk_GEOSldasRestart` for `catchcnclm45` by @weiyuan-jiang in [#516](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/516)
9. `make_bcs` clarification of options by @biljanaorescanin in [#517](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/517)
10. Bug fix for `RUNSRF` units in Catchment by @gmao-rreichle in [#535](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/535)
11. Cleanup of `gndtmp[_cn]()` by @gmao-jkolassa in [#536](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/536)
12. New peat hydrology (PEATCLSM) by @biljanaorescanin in [#524](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/524)
13. Add `LDAS_INCR` to `AGCM.rc.tmpl` for land-atmos coupled das by @saraqzhang in [#288](https://github.com/GEOS-ESM/GEOSgcm_App/pull/288)
14. Fixes for C12 MOM6 by @mathomp4 in [#](https://github.com/GEOS-ESM/GEOSgcm_App/pull/285)
15. Updates for handling CS ocean by @mathomp4 in [#287](https://github.com/GEOS-ESM/GEOSgcm_App/pull/287)
16. Update for NAS Runs by @mathomp4 in [#291](https://github.com/GEOS-ESM/GEOSgcm_App/pull/291)
17. Compress CircleCI Artifacts by @mathomp4 in [#513](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/513)
18. Use circleci-tools orb for CI by @mathomp4 in [#242](https://github.com/GEOS-ESM/GMAO_Shared/pull/242)


## [10.21.0] - 2021-12-21

### Zero-diff to Previous Release: NO
### Restart Changes: YES (see below)

Major Non-Zero-Diff Changes:
1. Changed the default config to use new orbit parameters by @sdrabenh in [#277](https://github.com/GEOS-ESM/GEOSgcm_App/pull/277)
2. Refactored RRTMG long-wave and short-wave radiation by @dr0cloud in [#492](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/492)
3. Adding SHOC+EDMF updates by @narnold1 in [#479](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/479).
   All restarts and variables within remain 0-diff except for the following:
   1. moist_import
      * added: EDMF_FRC, HL2, HL3, HLQT, QT2, QT3, W2, W3, WHL, WQT
   2. moist_internal
      * added: PDF_A
   3. turb_import
      * added: PHIS, SH, WTHV2
   4. turb_internal
      * added: QT2, QT3
      * removed: BRUNTSHOC, CLD, DQDT_SHC, DQIDT_SHC, DQLDT_SHC, DTDT_SHC, LSHOC, SHEARSHOC, TKEBUOY, TKEDISS, TKESHEAR, TKETRANS, WTHV2
      * changed: TKH "lev" coordinate to "edge" coordinate

## [10.20.0] - 2021-12-17

### Zero-diff to Previous Release: NO
### Restart Changes: YES for TR

Major Non-Zero-Diff Changes:

1. Uptick to [GEOSchem_GridComp v1.7.0](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.7.0)
   * Wet deposition for CO, CO2 and CH4 is disabled, while a bug-fix is developed.
   * GMI and TR have cleaner units handling.
2. make_bcs fixes issues with "old land" choices by @smahanam in [#438](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/438)
   * Old land BCS files have the same science but won't be binary-equivalent due to bug fixes (e.g., "Mali bug")
3. Adds code to Satsim to choose subcolumns based on horizontal resolution by @mathomp4 in [#459](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/459)
   * This is zero-diff for resolutions C720 and coarser but not for higher resolutions
4. Uptick to [ESMA_env v3.8.0](https://github.com/GEOS-ESM/ESMA_env/releases/tag/v3.8.0) to use Intel 2021.3 which helps alleviate issues with LDAS amd NAS.
5. Uptick to [ESMA_cmake v3.8.0](https://github.com/GEOS-ESM/ESMA_cmake/releases/tag/v3.8.0) to change default vectorization flag for Intel Fortran.

Major Zero-Diff Changes:

1. Updated `regrid.pl` for GOCART-2G by @bena-nasa in [#231](https://github.com/GEOS-ESM/GMAO_Shared/pull/231)
2. Plot Updates from L. Takacs by @sdrabenh in [#235](https://github.com/GEOS-ESM/GMAO_Shared/pull/235)
   * Added supports to plot aerosols from GOCART-2G.
   * Three-Corner-Hat (3CH) analysis tools were added.
   * Enhancements and bugfixes to quickplot and quickstat utilities.
3. Lightning module has been re-located and revamped.  [#451](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/451)  [#212](https://github.com/GEOS-ESM/GMAO_Shared/pull/212)  [#141](https://github.com/GEOS-ESM/GEOSchem_GridComp/pull/141)
4. HEMCO config files for GOCART and GMI have been updated for v2.2 [GEOSchem_GridComp v1.7.0](https://github.com/GEOS-ESM/GEOSchem_GridComp/releases/tag/v1.7.0)
5. Uptick to [MAPL v2.14.0](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.14.0)
6. Refactoring of `interp_restart` code necessitated an uptick to [fvdycore geos/v1.3.0](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/releases/tag/geos%2Fv1.3.0)
7. Regridding fix and `read_topo` fix code necessitated an uptick to [FVdycoreCubed_GridComp v1.4.1](https://github.com/GEOS-ESM/FVdycoreCubed_GridComp/releases/tag/v1.4.1)

## [10.19.6] - 2021-12-09

### Zero-diff to previous release: YES
### Restart Changes: NO

Major 0-diff changes:

1. 5deg ocean (MOM6) configuration by @sanAkel in [#488](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/488)
2. Fixed missing verify status of iDUAL_OCEAN in GEOS_OceanGridComp.F90  by @sanAkel in [#491](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/491)
3. Cleaned up CircleCI by @mathomp4 in [#493](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/493)
4. Make big 5-d buffer in Moist optional by @mathomp4 in [#496](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/496)
5. The `idcheck.pl` script was updated for changes in SemperPy by @gmao-jstassi in [#233](https://github.com/GEOS-ESM/GMAO_Shared/pull/233)
6. Update `regrid.pl` for Ocean Model Questions by @mathomp4 in [#222](https://github.com/GEOS-ESM/GMAO_Shared/pull/222)
7. Added `HISTORY_GEOSIT.rc.tmpl` by @rtodling in [#273](https://github.com/GEOS-ESM/GEOSgcm_App/pull/273)
8. Uptick to MAPL v2.13.0  [full list of changes](https://github.com/GEOS-ESM/MAPL/compare/v2.12.1...v2.13.0)

## [10.19.5] - 2021-11-30

### Zero-diff to previous release: YES (except for comparing some HISTORY output)
### Restart Changes: NO

Possible History changes:

1. Bug fix for MAPL wherein non-default duration in HISTORY.rc was not being correctly handled. For example, if a collection has a duration of 24 hours and a frequency of 12 hours, MAPL now correctly writes a file with *two* timesteps in it. Before, MAPL was handling this incorrectly. Note that the *data* is still the same as 10.19.4, but now is contained within one file.

Major 0-diff changes:

1. Fix mom5 mom6 for das by @mathomp4 in [#270](https://github.com/GEOS-ESM/GEOSgcm_App/pull/270)
2. Allow gcm_setup to run anywhere by @mathomp4 in [#261](https://github.com/GEOS-ESM/GEOSgcm_App/pull/261)
3. `WSUB` fix in gmichem_setup by @mmanyin in [#263](https://github.com/GEOS-ESM/GEOSgcm_App/pull/263)
4. Make runtime and setup variable consistent for GCM by @rtodling in [#265](https://github.com/GEOS-ESM/GEOSgcm_App/pull/265)
5. Add code to install source tarfile by @mathomp4 in [#262](https://github.com/GEOS-ESM/GEOSgcm_App/pull/262)
6. Replace `_RETURN(_SUCCESS)` by @weiyuan-jiang in [#484](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/484)
7. Add error checking in mk_restarts executables by @weiyuan-jiang in [#467](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/467)
8. Support update for MOM6 by @sanAkel in [#468](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/468)
9. Add logic to allow guest oceans to be stubbed by @tclune in [#474](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/474)
10. Add ability to get timing from MOM6 modules by @sanAkel in [#477](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/477)
11. Add in support of quarter degree MOM6 to ADAS by @rtodling in [#478](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/478)
12. Updated `pyrob` to work with GEOS-IT files by @mathomp4 in [#224](https://github.com/GEOS-ESM/GMAO_Shared/pull/224)
13. Add Cascade knob to `g5fcst_stats.pl` and `regrid.pl`; revised `dyn_blob`; make sure `echorc.x` exits with success code when applicable; by @rtodling in [#226](https://github.com/GEOS-ESM/GMAO_Shared/pull/226)
14. Add OpenMP support for fvdycore by @mathomp4 in [#44](https://github.com/GEOS-ESM/GFDL_atmos_cubed_sphere/pull/44)
15. ESMA_env: Update to Baselibs 6.2.8 needed for MAPL and move to use MPT 2.25 at NAS. [full list of changes](https://github.com/GEOS-ESM/ESMA_env/compare/v3.4.0...v3.6.0)
16. ESMA_cmake: Add ability to create source tarball after install, various cleanup and fixes. [full list of changes](https://github.com/GEOS-ESM/ESMA_cmake/compare/v3.6.2...v3.7.2)
17. MAPL: Requires gFTL 1.5.1 (Baselibs 6.2.8), added option to flip vertical orientation of checkpoints, various 0-diff bug fixes for compilers, refactored code. [full list of changes](https://github.com/GEOS-ESM/MAPL/compare/v2.8.6...v2.12.1)

## [10.19.4] - 2021-10-07

### Zero-diff to previous release: YES for default AGCM, YES for OGCM for single moment MP
### Restart Changes: NO

Major 0-diff Changes:
1. Restructuring under GEOSocean_GridComp by @yvikhlya in [#448](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/448)
2. Updates to support two versions of Catchment-CN: Catchment-CN.4.0 and Catchment-CN.4.5 by @gmao-jkolassa in [#368](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/368)
3. Compile time choice of CN model by @weiyuan-jiang in [#370](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/370)
4. Runtime choice for clm4.0 and clm4.5 by @weiyuan-jiang in [#373](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/373)
5. mk_GEOSldasRestart can now take restart hour and restart name by @weiyuan-jiang in [#449](https://github.com/GEOS-ESM/GEOSgcm_GridComp/pull/449)
6. Fixes to enable mepo variant styles by @tclune in [#334](https://github.com/GEOS-ESM/GEOSgcm/pull/334)
7. Updates needed for Cascade Lake at NCCS by @mathomp4 in [#335](https://github.com/GEOS-ESM/GEOSgcm/pull/335)
8. Updates and corrections for the trajectory file created for JEDI. Variables for proper diurnal layer, TS, and CO2 have been added by @rtodling in [#257](https://github.com/GEOS-ESM/GEOSgcm_App/pull/257)
9. Null out WSUB_NATURE for 1MOM and GFDL physics by @mathomp4 in [#251](https://github.com/GEOS-ESM/GEOSgcm_App/pull/251)
10. Cleanup gcm_run and sync forecast scripts by @sdrabenh in [#256](https://github.com/GEOS-ESM/GEOSgcm_App/pull/256)
11. Fixes for SCM Setup on macOS by @mathomp4 in [#253](https://github.com/GEOS-ESM/GEOSgcm_App/pull/253)
12. Updated suite of PRs for GEOSadas by @mathomp4 in [v1.4.10](https://github.com/GEOS-ESM/GMAO_Shared/releases/tag/v1.4.10)
13. Bug fix for CICE4 segfault by @mathomp4 in [#215](https://github.com/GEOS-ESM/GMAO_Shared/pull/215)
14. Add pyrob_CF script by @mathomp4 in [#208](https://github.com/GEOS-ESM/GMAO_Shared/pull/208)

## [10.19.3] - 2021-07-21

### Zero-diff to previous release: MOSTLY
### Restart Changes: NO

Potential Non-0-diff Change:

1. Upgrade to MAPL v2.8.0. For the MERRA2 GOCART Emissions, all testing shows it is zero-diff. But for the Ops GOCART Emissions, it there are very small roundoff differences. The results are non-zero-diff due to a bug fix (to a race condition) in this version of MAPL on how grids are handled.

Major 0-diff Changes:
1. Detect MERRA2OX date violation during setup.
2. Make species consistent with emissions choice.
3. Only allow Rome nodes at NAS if built on Rome.
5. Updates for MVAPICH2, enable multigroup by default.
6. Bugfix for correct day when running EMIPs.
7. Update ldas increment alarm setting in CatchGC.
8. Updates to plots package.
9. Update to fvdycore v1.1.7.

## [10.19.2] - 2021-06-11

### Zero-diff to previous release: YES
### Restart Changes: NO

Changes include:

1. Upgrade to Baselibs 6.2.4 and cmake v3.5.0.
2. Update parallel_build to use GMAO_Shared main if develop.
3. Created a new grid comp `GEOS_SeaiceGridComp` as a top level container component serving sea ice sub-components to `OGCM`. This new structure mirrors the existing `GuestOcean/MOMPlug` relationship for the ocean model hierarchy.
4. Bug fix that makes sure that diagnostics `CNV_MFC` still works when the UW shallow convection code is disabled.
5. Add changes consistent with what is in GEOSadas 5.28.
6. Addition of variables for analysis in two RC files and correction in `IAU` `reftime` consistent with GEOSadas.
7. Fixes for `IOSERVER` on Rome.

## [10.19.1] - 2021-05-25

### Zero-diff to previous release: YES
### Restart Changes: NO
### History Changes: YES

Major changes include:

1. Upgrade to MAPL v2.7.0 which changes how programs set up command line options.
2. Update to FVdycoreCubed_GridComp v1.2.15 and GEOSgcm_App v1.5.1 for compatibility with MAPL v2.7.0.
3. Enable GEOSgcm to output the configuration values in `GEOS_SurfaceGridComp.rc`.
4. Fixes a bug in the export of `SSKINW` (an internal state of Openwater) that was being filled incorrectly leading to `MAPL_UNDEF`. Now there are actual values.
5. Merged changes present in GEOSadas-5_27_1_p3 that never made it into the GIT repo: revised stochastic perturbation tendency exports.
6. A bug fix to prevent a seg-fault during the calculation of the GEOS-Chem lightning flash rate due to an array size mismatch.
7. Add ability to write out energy components to file.
8. Update gitignore for mepo updates.
9. Follow MAPL's change to add a new `MAPL_CapOptions` constructor.

## [10.19.0] - 2021-05-14

### Zero-diff to previous release: NO
### Restart Changes: NO
### History Changes: YES

Major Non-0-diff changes include:
1. Updates the DEFAULT Land BCs of GEOSgcm to be Icarus-NLv3. Also applies a fix to GEOS_SurfaceGridComp.rc to correctly implement it.

Major 0-diff changes include:
1. Updates `GMAO_psas` to work with MAPL2.
2. Rename `LANL_cice` to `CICE4` that is located at `LANL_Shared/`
3. Remove `BULK_SST` alias for `TS_FOUND` in HISTORies used in model (only) simulations.
4. Updates to use Python2 and Python3 at same time.
5. Fixed the `-wemin` and `-wemout` options in `regrid.pl` so that they will accept integer values.
6. Bugfix to detect if saltwater splitting is needed in more files.
7. Add `IOSERVER` code into `gcm_forecast.tmpl`.
8. Updates needed for `GEOSadas` to work with MAPL2.
9. Add GEOS-Chem and HEMCO as separate external repositories.
10. GMI is now set to import RI and RL only when running Cloud-J. This is a work-around for a CTM issue.
11. Uptick of MAPL and FMS repositories.

## [10.18.0] - 2021-04-15

### Zero-diff to previous release: NO
### Restart Changes: YES
### History Changes: YES

Major Non-0-diff changes include:
1. Modified PCHEM interpolation that fixes the problem of negative PCHEM tracers.
2. A bug fix to atmOcnIntlayer consistent with what was applied to GEOS-FP GEOS-5.27.1 (02/2021) which mitigates anomalous spikes in `TSKINWTR` and related fields when the sea ice fraction departs 100%.
3. Changed scaling and cleaned up Henry's law code in ConvPar_GF_GEOS5 (bug fix, non-zero diff for GOCART).
4. Update to use the 2020 NRL Solar file.

Major 0-diff changes include:
1. Fix DUAL_OCEAN options in coupled model to only work with MOM5 (It does not and can not work with MOM6).
2. Added diagnostic output for NH3, NH4A convective scavenging to GEOS_MoistGridComp used for GOCART evaluation.
3. Revive OceanBioGeoChem.
4. Fixed CMake bugs for DAS build only libraries.
5. Upticks of FVdycoreCubed_GridComp, fvdycore, and cmake repos.

## [10.17.6] - 2021-04-06

### Zero-diff to previous release: YES
### Zero-diff to regridding: YES
### Restart Changes: NO
### History Changes: NO

Major changes include:

1. Upgrade to ESMA_env v3.2.0 whose main change is updating to ESMF 8.1.0, which is needed for MAPL development. All testing has shown it zero-diff to GEOSgcm with ESMF 8.0.1. Tests were run from C12 to C720 as well as Replay and MOM6. However, ESMF notes that there are [changes in some regridding situations which *could* produce non-zero-diff results](https://github.com/esmf-org/esmf/releases/tag/ESMF_8_1_0).

## [10.17.5] - 2021-04-06

### Zero-diff to previous release: YES for hydrostatic, NO for nonhydrostatic
### Zero-diff to regridding: YES
### Restart Changes: NO
### History Changes: NO

Major changes include:

1. parallel_build.csh now accepts a `-hydrostatic` or `-nonhydrostatic` argument during building. If no argument is provided the model will build hydrostatically as before. Therefore, setup scripts were modified depending on what -DHYDROSTATIC option was supplied to CMake. If -DHYDROSTATIC=ON then it will assume the user wants to use hydrostatic dynamics options and vice versa.
2. Fixed decomposition regression for nonhydrostatic model.
3. Updates from ADAS 5.27 folded into git GMAO_Shared v1.3.9. This brings the GEOSadas code closer to the current GEOSgcm.
4. Upticks in MOM6, MAPL, env and other repositiories.

## [10.17.4] - 2021-03-17

### Zero-diff to previous release: YES
### Zero-diff to regridding: NO for agcm_import_rst
### Restart Changes: NO
### History Changes: NO

Major changes include:

1. Moved GOCART legacy to be sourced from separate GOCART repository.
2. Update to MOM6 `geos/v2.0.0` and update to FMS `geos/2019.01.02+noaff.6`
3. Bug fix for regrid.pl which can cause non-0-diff regridding for agcm_import_rst.
4. Fixed MOM6 diagnostics to use correct netcdf reference year.
5. Fix bug in gustiness calculations.
6. Fixed a bug in rotation angle for surface ocean stress.
7. DSO's for mom5 and mom6.
8. `GAAS` Replay fix.
9. Add `MOM.res.nc` to the list of restarts that are checked in regression testing.
10. Remove `OCEAN_PRELOAD` since it is not needed with the DSO.
11. Change path names to support "automatic" MERRA-2 Regular Replay at NAS.
12. Remove `CMIP_1977_1982` directory in `GEOS_Util/pre/NSIDC-OSTIA_SST-ICE_blend`.
13. Update `binarytile.x` for river routing.
14. Bug fix for edge level arrays out-of-bounds in `Lighting_mod`.
15. Plot updates for stats.

## [10.17.3] - 2021-02-12

### Zero-diff to previous release: YES

### Restart Changes: NO

### History Changes: NO

Major changes include:

1. Performance modification for surface rc file in run methods.
2. Relocation of mk_restarts and Raster.
3. Bugfix for running Catchment-CN with constant CO2.
4. Fixed land BCs in coupled mode
5. Added optional PCHEM species file with prod/loss of strat water vapor
6. Added support for the new Rome nodes at NAS named like `r201c2t1n4`
7. Plots and stats updates.
8. Eliminated references to MAPL_COMM - these are no longer used and will be deleted in future releases of MAPL.
9. Upgrade to MAPL v2.6.0

## [10.17.2] - 2021-01-29

### Zero-diff to previous release: YES

### Restart Changes: NO

### History Changes: NO

Major changes include:
1. Upgrade to MAPL 2.5.0
2. Updates to plots and stats package.
3. Updated PBS Batch handling at NAS.
4. Addded `CODE_OF_CONDUCT.md`

## [10.17.1] - 2021-01-12

### Zero-diff to previous release: YES

### Restart Changes: NO

### History Changes: YES - Roundoff differences in `TSOIL1` and `TSOIL2`

Major changes include:

1. Soil temperatures export variables (TP's) are now in units of Kelvin throughout the Catch and CatchCN. Note: this has introduced roundoff differences in `TSOIL1` and `TSOIL2` output.
2. New MOM6 configuration (OM4), and a bug fix in MOM6_Plug.
3. Update default coupled model surf collection with a few addition fields.
4. Fix `saltwater_internal` splitting to work with in AMIP and EMIP mode.
5. Add ASSERTs to RRTMG to test input sanity.
6. Adds a `-partition` option to `mk_restarts` so that there can be a `-partition` option in `regrid.pl`.
7. Fix `gcm_convert.j` which was broken.
8. Added flag to `regrid_forcing_esmf.x` to force a 0 to 1 range when regridding files that should use fractions.
9. Update flags for `zonal.f` to match CVS and fixed a bug in `res/zonal.gs` for `zonal.x` location.
10. Updates to ignores CI if non-essential files are updated (only).
11. Use CONFIGURE_DEPENDS flag to check if any globbed files changed when re-running cmake.
12. Allow use of aggressive flags with GEOS.


## [10.17.0] - 2020-11-25

### Zero-diff to previous release: YES

### Restart Changes: NO

Major changes include:
1. The way the model is build has changed. Manage externals is no longer supported. Mepo is now the default and replacement manager for multiple repositories.
2. Add dependency to turn on `BUILD_SHARED_LIBS` for NCEP_Shared.
3. Splits the RRTMG k_g tables into separate files.
4. Bugfix to change Intel Debug flags for MOM6 and FMS.
5. gcm_run.j bugfix for tile_hist running MOM6.
6. Update plots and stats to be consistent with recent CVS tags.
7. Bugfix for C99 compliance on MacOS.
8. Updates to CI and other subrepos.

## [10.16.3] - 2020-11-02

### Zero-diff to previous release: YES

### Restart Changes: NO

Changes include:

1. Added fixture section to `components.yaml`

## [10.16.2] - 2020-10-28

### Zero-diff to previous release: YES for default catchment, NO for CatchmentCN

### Restart Changes: NO

The latest release is a 0-diff change when running the default catchment. However, it is a non-0-diff change when running CatchmentCN.
1. Updates to land:
	1. SurfParams: Introduced separate parameter collections for different land model choices that are being cross-checked against the land model choice.
	2. Updates to reproduce Fanwei Zeng’s LDASsa Catchment-CN simulations (science-validated, published) using the 'CN_CLM4' option.
2. Restructure/Refactor `DO_OBIO` (see [Issue #362](https://github.com/GEOS-ESM/GEOSgcm_GridComp/issues/362))
3. Add Docker authentication for pulls.
4. Add logger for NaN detection (at a WARNING level) for QSAT and DQSAT codes.
5. Make plots/configure portable when using someone else's build.
6. Allow longer job names for PBS/SLURM.
7. Update to MAPL.

## [10.16.1] - 2020-10-14

### Zero-diff to previous release: YES for AGCM, NO for coupled model

### Restart Changes: YES (`OLRB06RG` and `TBRB06RG` variables added to `irrad_internal` restart)

Major updates include:
1. Add TOA RRTMG Band6 (window region) IR diagnostics.
2. Include new diagnostics for the constraints and new plots for them.
3. Clean up clumsy logic in GEOS_OpenWaterGridComp.F90 [Issue #356](https://github.com/GEOS-ESM/GEOSgcm_GridComp/issues/356)
   1. removes the `AOIL_COMP_SWITCH`
   2. AOIL now properly works with the coupled model (**non 0-diff**)
   3. maintains 0-diff for uncoupled mode
   4. computations to update the state variables (TW, SW, HW and other internals) are now performed via a call to `AOIL_v0`.
   5. `AOIL_v0` also provides following two options that are turned OFF by default:
      * provide a more gradual decay of diurnal warming as observed in nature: `WARM_LAYER_GRAD_DECAY`
      * update turbulent heat fluxes after the state variables have been updated: `UPDATE_FLUXES_AOIL_SECOND_STEP`
4. Upgrade to MAPL 2.3 with a number of changes listed [here](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.3.0).
5. Fixed regrid_forcing.x and regrid_forcing_esmf.x so they will work with MAPL2.2 and beyond.
6. Logging config improvements and bugfixes.
7. Fixed a bug in ExtData when extrapolating on a Leap Day.
8. Added a deflate and bit shaving option to `Regrid_Util.x`.
9. Fix bug with using coarse grids in History and ExtData.
10. Lowers the amount of jobs used during `make -jN install` in `build.csh` to mitigate possible segfaults.
11. Updated the NCPUs detection in various post scripts to be SLURM-aware.

## [10.16.0] - 2020-09-28

### Zero-diff to previous release: NO

### Restart Changes: NO

The only change in this release is moving back to using `int()` not `nint()` in GEOS_Shared/GEOS_Utilities.F90 which may cause crashes if the Debugging flags are on. Nevertheless, this is a non zero-diff change to the gcm.

## [10.15.0] - 2020-09-25

### Zero-diff to previous release: NO

### Restart Changes: YES for values; NO for entries/structure

Major non-0-diff changes include:
1. Update to ESMA_env v3.0.0 (NOTE: ***SLES 11 Support at NCCS is Removed***)
  * ESMA Baselibs 6.0.16
  * Use a new Python Stack: GEOSpyD/Min4.8.3_py2.7
  * Update compilers and MPI stacks
    * NCCS
      * Intel Fortran 19.1.2
      * Intel MPI 19.1.2
    * NAS
      * Intel Fortran 2020.2.254 (aka 19.1.2)
      * MPT 2.17 (same as before)
    * GMAO Desktop
      * Intel Fortran 19.1.2
      * Open MPI 4.0.4
2. The GEOSadas-5_27_0 version of GEOS_Shared/GEOS_Utilities.F90 has slightly different code, `nint()` instead of `int()`. This brings git up to date.
3. Bugfix for computations in uwshcu.F90 that involved `MAPL_UNDEF`
4. Bug fix for GCC 10 with `DRHOS0`
5. Upgrade to GEOSchem_GridComp v1.4.1

## [10.14.2] - 2020-09-25

### Zero-diff to previous release: YES

### Restart Changes: NO

Changes include:

1. Update to FVdycoreCubed_Gridcomp v1.2.5
2. Update RRTMGP to master aug2020
3. Add logging capability
4. Fixes for setup scripts
5. Remove Latlon atmosphere in setup
6. Updates for coupled model setup
7. Add section for AWS SLURM
8. Allow SCM to run with 91, 137 and 181 levels
9. Restore use of SHARE CHMDIR at NCCS for all levels
10. NCL scripts added to generate MERRA2 forcing for SCM
11. Remove clock rewind only in replay logic for GuestOcean
12. Add melt_potential and fix Orphan Points for MOM6 plug/Guest ocean
13. Subroutines called from within OPENWATERCORE of GEOS_OpenWaterGridComp.F90 have been moved GMAO_Shared to be shared across applications/components
14. Clean up/simplify AOIL
15. Clean up of Saltwater's children
16. Genericize NCAR GWD Beres file location
17. PRECIPFRAC functionality for Catch and CatchCN
18. Updates to allow GEOS to build without MKL
19. Run binarytile.x without MPI dur to Intel issues
20. Upticks of other subrepo/component versions

## [10.14.1] - 2020-07-23

### Zero-diff to previous release: YES

### Restart Changes: NO

Major changes include:

1. Allows EMIPs to work with New Land restart files. These files do not necessarily occur on the same day of the month. The modified code will search for files within a given year-month and start an EMIP member from that date.
2. Fixed gcm_regress.j such that it allows to run regression test on coupled model with MOM5 and MOM6 ocean.
3. Removed S2S history template with confusing name.
4. Adds an fv3_setup and fv3.j script for the FV3 Standalone.
5. Allows the JCAP functionality to work again in mkiau gridcomp as that needs the r4 version of ncesp_sp in gmao_transf.
6. Modify mpirun flags for Open MPI 4.0.4.
7. Updates to plots.

## [10.14.0] - 2020-07-17

### Zero-diff to previous release: YES - for default 72L-1MOM configuration

### Restart Changes: YES - gwd_import_checkpoint has been added

Major changes include:
1. Added MOM6 plug
2. Added NCAR GWD
3. Updated GFDL microphysics
4. Updated MOM5
5. Run time switch between MOM5 or MOM6
6. Updates for JEDI Integration
7. Updated FMS
8. Sparsed out FVdycore_GridComp and ARIESg3_GridComp dynamical cores. Sparsed out GMAO_pilgrim from GEOSgcm_GridComp.
9. Update Aerosol Chemistry BCs to match new vertical levels.
10. Additional question in setup scripts for:
	1. Chosing microphysics option
	2. Chosing hydrostatic/non-hydrostatic mode

## [10.13.0] - 2020-06-26

### Zero-diff to previous release: ONLY 72L 1-MOMENT DEFAULT CONFIG

### Restart Changes: NO

Only 0-diff for 72-level 1-MOMENT default configuration. Non-0-diff for ALL others. Major changes include:
1. Support for increased vertical resolution and updates in FV3 and GFDL. New 71, 91, and 181-level options which have eta distributions similar to the ECMWF 137-level option. New 127-level option is similar to NCEP. Retuned surface mixing results in non-0-diff changes to the 132-level option.
2. Updated MPI Settings for running at NCCS.
3. New updates from S2S3 tag in CVS.
4. Updates to coupled plotting package (coupled_diagnostics)
5. Fixed MOM_GEOS5Plug MAPL Timers for RUN2.
6. River routing updates.
7. SLES12 bugfix reading LAI, GRN, NIRDF, VISDF and NDVI in (LDAS) ensemble mode.
8. CatchCN now gets daylength from MAPL sun code abstractly so it works with the new procession including type of orbit.
9. Updated to Chemistry v1.3.5.
10. Added lines to AGCM.rc.tmpl to run RRTMGP (disabled by default).

## [10.12.5] - 2020-06-05

### Zero-diff to previous release: YES

### Restart Changes: NO

Changes include:
1. Uptick the versions of many sub-repos (MAPL,cmake,env,GEOSchem_GridComp,GEOSgcm_GridComp,GEOSgcm_App,GMAO_Shared).
2. Bugfix for array bounds in RRTMG LW.
3. Rolls back the constraint on gcmpost.script to only operate on pressure-level collections.
4. Added ignore_nan option for time_ave.F (off by default).
5. Enables correct post proccessing of MAPL monthly collections.
6. CICE updates for reading binary grid files.
7. MIN_FREEZE_SALINITY added to AGCM.rc in coupled mode.

## [10.12.4] - 2020-05-15

### Zero-diff to previous release: YES

### Restart Changes: NO

Major changes are:
1. Brings RRTMGP code up to date with recent Pincus Master changes as of 3 May 2020
2. Add ability to run setup scripts in another's install directory
3. Support for new surface parameter resource file for land
4. Fixes issues with the scm_setup
5. Update CircleCI to use Baselibs 6.0.12
6. Use different ALLREDUCE algorithm for Intel MPI
7. Change Intel MPI GATHERV algorithm so GEOSgcm does not lock up on skylakes at checkpoint
8. Add a commented out setenv for the FOR_IGNORE_EXCEPTIONS in MPT
9. Add option to symlink GEOSgcm.x in experiment directory
10. FSEGMENT bug fix in gcm_forecast.setup

## [10.12.3] - 2020-04-21

### Zero-diff to previous release: YES

### Restart Changes: NO

Major changes are:
* Update to MAPL 2.1 which includes both fixes from [MAPL v2.1.0](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.1.0) and [MAPL v2.1.1](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.1.1)
  * With this is included updating to latest releases of [ESMA_env](https://github.com/GEOS-ESM/ESMA_env/releases) and [ESMA_cmake](https://github.com/GEOS-ESM/ESMA_cmake/blob/master/CHANGELOG.md) needed by MAPL 2.1
  * Add monthly mean features
  * Add optional equation of time correction to solar position used to calculate solar zenith angle.

## [10.12.2] - 2020-04-16

### Zero-diff to previous release: YES

### Restart Changes: NO except moist_import has an additional field: FRACI

Major changes are:

1. Added connectivity from MOIST to CHEM for 2 fields (RI and RL).
2. Updates to the obio component which was in the CVS Icarus-2.0 tag.
3. Bugfix for coupled mode renaming TSKINI to TSKINICE.
4. Bugfix for DTDT_moist which was initially set to temperature but never updated to provide tendency.
5. Compute the lightning flash rate (LFR) online following the approach used by GEOSCHEMchem_GridComp. The LFR is calculated in MOIST and then made available to other components as a new export field (LFR_GCC).
6. Modified the mk_Restarts script to run on SLES-12.
7. Update RRTMGP to Pincus 2020-Feb-12.
8. New Surface parameter resource file (GEOSsurface_GridComp/Shared/GEOS_SurfaceGridComp.rc) to avoid having to add new parameters into AGCM.rc.tmpl and prepare for further science development.
9. Correcting the following issues with the single column model: (1) GF imports from DYN were not filled; (2) scm_setup incompletely adjusted for L132; (3) SST file for cfmip_s11 case was incorrect.
10. Allows regrid.pl to run on SLES-12
11. Enabled compilation of convert_aerosols.x as R8

## [10.12.1] - 2020-03-27

### Zero-diff to previous release: YES

### Restart Changes: NO except moist_internal has an additional 3 fields: NGRAUPEL, NRAIN, NSNOW

Major changes are:

1. Broader support for various computing environments including SLES12. Adds a new question to gcm_setup (and other setup scripts) that asks a user what type of processor to run on. It then uses the "default" number of cores per those processors to better figure out how to handle the IOserver nodes.
2. Changes that enable MAPL2 GEOS to work with MPT at NCCS.
3. Changed REPLAY_Shutoff alarm from NON-STICKY to STICKY, and used it in GAAS to stop updates in forecasts during REPLAY mode.
4. Updates to moist and GOCART using 2MOMENT microphysics and MG3. These are 0-diff when running the default 1MOMENT microphysics.
5. Modified gcmpost.script to only operate on pressure-level collections.
6. Fixes issues where systems do not have either ImageMagick or F2Py. If F2Py is not found, then F2Py targets are not built.
7. Changes to GMAO_hermes:
   * Split off the independent sections of module m_topo_remap used by FV core into shared_topo_remap
   * write_eta.F90 added to prepare for a config file which eventually will replace m_set_eta module
   * Add option to build HERMES_LIGHT

## [10.12.0] - 2020-03-09

### Zero-diff to previous release: NO

### Restart Changes: NO

Major changes are:

1. Fixed "zero-diff" issue related to GF evaporation vs total rain, fixed GF cloud-mass-flux scaling issue.

2. Move ShallowCu contribution to mass flux and add scale-dependent stochastics to convection.

## [10.11.0] - 2020-03-04

### Zero-diff to previous release: NO

### Restart Changes: NO

Major changes are:

1. RRTMG_SW:
   Updates RRTMG_SW in GEOS to be equivalent to RRTMG_SW v4.10. This fix increases the heating rates near the stratospause region and is a non zero-diff change.

2. RAS_NO_NEG:
   Provides an optional flag that ensures RAS results are non-negative. This is an important fix for chemical species that was extremely useful in the Icarus but did not make it into Jason. The fix is "off" by default and therefore zero-diff.

3. Plots:
 * Enable additional upper levels for forecast stats plots.
 * Add QITOT & QLTOT to horizontal plots.
 * Add aerosols to time series plots.

Other updates:
   * Remove #PBS pragmas at NCCS to use #SBATCH.
   * Brought the chem setup scripts in line with gcm_setup.
   * Bug fixes for gcm_run and gcm_forecast scripts.

## [10.10.0] - 2020-02-20

### Zero-diff to previous release: NO

### Restart Changes: NO

This release is equivalent to the [NOAA 2019.01.01 Release](https://github.com/NOAA-GFDL/FMS/releases/tag/2019.01.01) but with the addition of GEOS constants controlled by `-DMAPL_MODE`. Additional changes allow building with CMake.

## [10.9.0] - 2020-02-13

### Zero-diff to previous release: NO

### Restart Changes: NO

This release is equivalent in physics to v10.8.0 but now uses [MAPL
2.0](https://github.com/GEOS-ESM/MAPL/releases/tag/v2.0.0). The release
is non-zero-diff due to the use of ESMF regridding for History and
ExtData.

Also, this version of GEOSgcm now uses the new PFIO IO server to handle
History and ExtData file access and writing. By default, these IO
servers run on the same resources (i.e., nodes) as the application.
However, `gcm_setup` and `gcm_run.j` have been altered so that, by
default, at high-resolution (C180+) the IO servers are on separate nodes
for performance and memory reasons.

## [10.8.0] - 2020-02-06

### Zero-diff to previous release: NO

### Restart Changes: NO (only if AOIL_COMP_SWITCH=ON)

Recoded atmosphere-ocean interface layer (AOIL). Provides an option to exercise old/new versions of the AOIL.

1. Old version (AOIL_COMP_SWITCH = ON):
Default. Using the old interface is still non-zero diff to x0039, however, shown to be statistically insignificant in terms of forecast skill scores. Restarts with old interface can be used as is.

2. New version (AOIL_COMP_SWITCH = OFF):
If the new interface is turned on, then the user must provide additional fields in the internal state. Contact Santha Akella for a utility to do that.

## [10.7.0] - 2020-02-04

### Zero-diff to previous release: NO

### Zero-diff to CVS tag Jason-3_5_aoil

### Restart Changes: NO

1. Correction to RRTMG Shortwave 'layreffr' variable to reduce stratospheric cold bias.
2. Stats plots updates to produce stratospheric forecast statistics up to 1mb.
3. Correction to gcm_run.j & gcm_forecast.tmpl related to REPLAY with GAAS aod files.

## [10.6.0] - 2020-01-31

### Zero-diff to previous release: NO

### Restart Changes: NO

1. Atmospheric constituents (aersols, co, co2, etc) are now transported through moist/GF. This is equivalent to the way transport is handled in f525land_fpp/f525_fp.
2. Added exports for nitrate tendency and other fluxes related to GF convection.
3. Added nitrate tendency to history templates.
4. Upgraded to GEOSchem_GridComp to v1.1.0.
5. Set the default k_split = 2.
6. Fixed gcm_convert.j to work consistent with how gcm_setup and gcm_run.j interact.

## [10.5.0] - 2020-01-24

### Zero-diff to previous release: YES (but user must setup experiment differently)

### Restart Changes: NO

1. Hotfixed a bug to enable regridding of catchement restarts from MERRA2
2. REPLAY updates:

   The REPLAY algorithm within the GEOSagcm has been modified to enable a 4DIAU methodology consistent with that used in DAS mode. Prior to this release, REPLAY could only incorporate one analysis increment within the CORRECTOR_DURATION window (nominally 6-hours). The 4DIAU update allows for multiple analysis increments to be used within the CORRECTOR window. The number of increments that wiil be used is determined by the settings of the REPLAY_FILE_FREQUENCY (in nnnnnn seconds format) and the REPLAY_FILE_REFERENCE_TIME (in HHMMSS format). Based on these two settings, the code will determine how many analysis increments will properly fit within the CORRECTOR window. Note: the previous setting of PREDICTOR_DURATION is no longer needed since the code computes the required length automatically.

   The updated algorthm allows for 2 types of REPLAY:

     1. Exact     (Uses Archived Increment Files)

        Exact REPLAYs identically reproduce (bit-for-bit) a previous GEOS DAS experiment by simply using the archived IAU forcing from the DAS experiment. For these cases, only the CORRECTOR step is employed and is, therefore, as efficient as a stand-alone model run.

     2. Regular  (Uses Archived Analysis/Assimilation Files)

        Regular REPLAYs are used to mimic the original IAU methodology, i.e., both the PREDICTOR and the CORRECTOR steps are employed. The key difference being that the Analysis is based on archived datasets. These Analyses may be from the GEOS DAS system, or from any other source that is written using the appropriate GEOS DAS ana.eta data format.

   For more detailed information, please see the comments within the AGCM.rc.tmpl file.

## [10.4.0] - 2020-01-13

### Zero-diff to previous release: YES (with defaults and without regridding)

### Restart Changes: YES (land regridding)

* Non-zero-diff updates for:
	1. Regridding land restarts
	2. Running Chou-Suarez longwave radiation.

1. Update FV3 to latest version v1.0.9 which fixed UH25 diagnostic to build in both R4 and R8.
2. Land Updates:
	1. Clarified LONG_NAME of "snow depth" variable.
	2. Added wemin wemout options.
	3. Add PEATMAP data processing (disabled by default).
	4. GEOSsurface_GridComp changed values of pi to MAPL_PI.
	5. Added 8 more climatological (fPAR, VISDF, NIRDF stats for CATCHCN) data files and new clsm/country_and _state_code.data file.
	6. Extra column on soil_param.* files.
3. Non-zero-diif bug fix in Chou-Suarez for erroneous cloud contamination in OLR-OLRNA (aerosol forcing).
4. Fixed MAPL bug with vector regridding of winds in CTM.
5. Workaround fix building FMS on macOS.

## [10.3.6] - 2020-01-02

### Zero-diff to previous release: YES

### Restart Changes: NO

1. Compute decomposition in MKIAU GridComp
2. Use esma_set_this in GCs
3. Allows GEOS-Chem (v12.4.0) chemistry to be setup and run "out of the box".
4. INTERNAL and IMPORT restarts for GEOS-Chem are now in AGCM.rc.tmpl.
5. GEOS-Chem timestep is set to be 2 x HEARTBEAT by default.
6. Enforces GOCART_DT==HEARTBEAT_DT so all species work correctly.
7. Bug fix for comments using GNU compilers with Ninja.

## [10.3.5] - 2019-11-07

### Zero-diff to previous release: YES

### Restart Changes: NO

1. Enable reading netCDF increments during EXACT replay.
2. Fixed issues affecting the MOIST aerosol diagnostics:
   1. incorrect mapping of tracer names to diagnostics
   2. sign of the diagnostics by not allowing negative values.
3. New approach for increment diagnostics discussed in GEOSchem_GridComp v1.0.3.
4. OXIT and OXIM replaced with MTRI%PCHEM::OXIM and TRI%PCHEM::OXIT in most HISTORY files. OX increments due to moist and turblence are now computed using BundleIncrementMod.F90 and their names have been changed.
5. Implemented increments to land surface variables in the ADAS.
6. Fixed GUST for AMIP vs no-inc REPLAY difference in HISTORY.
7. Removed shallow.F90 which is no longer used.
8. Updated `gcm_regress.j` to be able to test both agcm and coupled models.
9. Remove references to `gcm_stats.j` in setup.

## [10.3.4] - 2019-10-01

### Zero-diff to previous release: YES

### Restart Changes: NO

1. Fields out of the MTR bundle came in the "wrong" order and affected
the Henry's law constants. Hotfix to fetch field by name instead of by
index.
2. Fixed triangular pdf option in SHUW.
3. Update chemistry to v1.0.2 to run GMI and Stratchem. Updated the
StratChem and GMIchem setup scripts to better match gcm_setup.
4. Hotfix in `fv_tracer2d.F90` to compare to ksplt instead of nsplt.
5. `FVdycoreCubed_GridComp` moved to separate repository.
6. FMS moved to separate repository and renamed `GFDL_fms` to fms
7. `getco2.F90` moved to `@GMAO_Shared`.
8. Adapted `GuestOcean_GridComp` to select DATASEA, MOM5 or MOM6 at runtime.
9. Changes to enable LDAS to start using the develop branch:
   1. ensemble ID width for LDAS
   2. added co2 file for CatchCN support
   3. bug fix that only affects New Land when snow impurity model is active
10. Updates from S2S-3 CVS tag:
    1. Includes dual ocean code
    2. Update to precip correction and additional coupled diagnostics
11. MERRA2_EMISSIONS_DIRECTORY path bugfix for `gcm_run.j` and `gcm_regress.j`
12. Updates from CVS `GEOSadas-5_25_2` tag.
13. Updated plots.
14. Enhancements to `scm_setup` script.

## [10.3.3] - 2019-10-02

### Zero-diff to previous release: NO

### Restart Changes: NO

1. Move to GMAO_Shared 1.0.4 to merge more updates from CVS for plots
2. Updates for Travis CI

## [10.3.2 / Jason-3_2] - 2019-08-02

### Zero-diff to previous release: NO

### Restart Changes: NO

1. Changes in FV3 related to Horizontal Advection choices. (from Bill: JU_20190722_WMP)
2. Changes in FV3 dddmp (from 0.1 to 0.2, to improve stability)
3. Changes in MOIST related to ICE-FALL. (from Bill: JU_20190722_WMP)
4. Updates to `GEOS_OpenWaterGridComp.F90` and `GEOS_DataSeaGridComp.F90`
to modify the original Coupled/Merged System to
include Santha's reformulated ice/melt. (from Santha:
sakella-GEOSadas-5_25_0_DV_in_MIZ_SSTunderIceFix)
5. Many updates related to CMAKE for upcoming GIT repository.
6. The addition of ERA5 to QUICKPLOT.
7. Modified STATS for NPO, SPO, and XPO regions.  Modified Montage plots.

Restart Changes: None.

## [10.3.1 / Jason-3_1] - 2019-06-13

### Zero-diff to previous release: NO

### Restart Changes: NO

### Model Changes

1. Updates to `GuestOcean_GridComp.F90` to re-sync OCEAN clock with
ATMOS clock when running Regular REPLAY together with DataOcean.
(non-zero diff)
2. Introduced code in MAPL_CFIO for HISTORY which corresponds to the
"fix_undef" utility used in MERRA-2 post-processing.  This creates
consistency between horizontally transformed and vertically interpolated
quantities and the target output level (i.e., values below surface are
UNDEF).
3. MKIAU has been modified to allow for REPLAYing to different vertical
resolution.  Results are zero-diff to previous versions if vertical
resolution is the same.
4. Updates to mk_restarts for Land/Catch.  Zero-diff when regrid.pl
points to standard (old-land) Icarus/Jason boundary area.

## [10.3.0 / Jason-3_0] - 2019-05-03

### Zero-diff to previous release: NO

### Restart Changes: NO (with caveats)

Due to changes in import states and
diagnostics, these restarts have changed but are passive to the
prognostic restarts:

* irrad_internal_rst
* surf_import_rst
* tr_internal_rst
* turb_import_rst

### Model Changes

1. Zero-Diff update to FV3 dynamics to allow FV3+ADV option
2. Updates from Mike Manyin to his tag:  Jason-2_2_MEM_2
3. This tag primarily is a Merge between Jason-2_2 and Andrea Molod's
coupled tag.  This produces a non-zero diff to Jason-2_2 due to a
modified surface layer interface.

## [Jason-2_2] - 2019-04-25

### Zero-diff to previous release: YES (in default mode)

### Restart Changes: NO (with caveats)

There was a long_name change in TR restart

### Model Changes

1. StratChem updated to tag: Jason-2_0_MEM_2, as well as updates to
GEOS-Chem and HEMCO from Mike Manyin
2. CARMA updated to tag: prc+asd-AeroChem-Icarus-3_3_p2+a1-v7 from Pete
Colarco (with minor mods in `DustEmissionMod.F90` because of an interface
differences)
3. GIT related updates.

## [Jason-2_1] - 2019-04-17

### Zero-diff to previous release: YES (in default mode)

### Restart Changes: YES

* `turb_import_rst`: Simply Bootstrap.
* `surf_import_rst`: Simply Bootstrap.
* `irrad_internal_rst` (passive, for clear-sky diagnostics only): Simply Bootstrap

### Model Changes

1. Retuning when using NewLand.
2. Addition of Optional RRTMPG (off by Default).
3. Modifications for New RRTMG diagnostics.
4. Updates for regrid.pl and related code.
5. StratChem updated to tag: Jason-2_0_MEM_1
6. GIT related updates.

## [Jason-2_0] - 2019-03-04

### Zero-diff to previous release: NO

### Restart Changes: YES

* `solar_internal_rst` (for RRTMG).  Simply Bootstrap.

### Model Changes

1. This is a MAJOR update to include updated moist processes based on the tag: merge_JDB7p1_retuned
  * It uses RRTMG for BOTH Shortwave and Longwave radiation.
  * It uses the GF Convection Scheme, as well as the UW Shallow Cumulus scheme.
  * It uses dynamics tunings based on the DYAMOND experiments.
2. Option included for running Stochastic Physics.
3. 2nd-Moment Cloud MicroPhysics updated to tag: b_Jason_2_0_donifan

## [Jason-1_1] - 2019-01-23

### Zero-diff to previous release: NO

### Restart Changes: YES

* GOCART IMPORT was modified by adding LWI and FRACI to be non-skip
* TR IMPORT was modified by removing ALL but CLDTT (from RAD), since TR is run after SURF RUN(1,2)
* Note:  When TR adopts a 2-phase approach, additional IMPORT variables from SURF will need to be included.

### Model Changes

1. An error was found related to GOCART and TR regarding the TR
and GOCART IMPORT restarts.  This error was introduced going from
Icarus-1_0_p1 to Icarus-2_0 with the splitting of GOCART into RUN1 and
RUN2 methods.  Essentially, the ordering in PHYSICS is:  SURF,CHEM,TURB
RUN1, followd by SURF,TURB,CHEM RUN2.  Emissions are computed in CHEM
RUN1 based on LWI locations.  However, LWI is not computed until SURF
RUN2.  Therefore, LWI is required on the GOCART IMPORT.  But this
variable was labeled as RESTART_SKIP.  The TR IMPORT did contain LWI,
thus when TR was Enabled, GOCART saw the proper LWI.  But when TR was
Disabled, LWI was no longer available for GOCART, and resulted in
non-zero differences.  The quick solution was to label LWI as non-skip
on the GOCART IMPORT restart.
2. An error was found related to the TH_for_CHEM within the SYNC-TQ
sequence.  The error was fixed, but experiments showed negligible impact
due to its second-order influence.
3. Modifications to the STATS plotting package to include Mean-Square-Error decompostion.

## [Jason-1_0_BETA] -- 2018-09-17

### Zero-diff to previous release: NO

### Restart Changes: YES

* `saltwater_internal` ==> `openwater_internal` & `seaicethermo_internal`

### Model Changes

1. Saltwater split => openwater and seaicethermo.  This means
`saltwater_internal` is now two files: `openwater_internal` and
`seaicethermo_internal`. `saltwater_import` remains. Regridding utility
(`regrid.pl`) will always produce the split ocean with this tag.  You can,
however, provide the single `saltwater_internal` as input.
2. Sponge Layer fix in FV3 to include damping between top model layer and bottom of sponge.
3. Regridding in MAPL now done in a new abstract/OO paradigm. This leads
to the new grid definitions in AGCM.rc
4. New HISTORY.rc grid_label definitions.  This HISTORY is designated as
VERSION: 1.  Older HISTORY files (using resolution attribute) will still
work provided VERSION = 0.
5. QUICKPLOT updates to produce automated "closeness" plots.

## Previous Versions

For previous changes please see [ChangeLog-PreJason.txt](ChangeLog-PreJason.txt)
