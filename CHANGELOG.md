# Changelog

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
