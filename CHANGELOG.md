# Changelog

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
