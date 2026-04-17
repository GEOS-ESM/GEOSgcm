esma_set_this (OVERRIDE crtm)

# got below list by copying the srcs list from
# the JSCDA_crtm src/CMakeLists.txt
# and then *adding* src/ to the beginning of each line
# (and also converting tabs to spaces)
#
list( APPEND CRTM_SRCS
  src/Ancillary/CRTM_AncillaryInput_Define.f90
  src/AntennaCorrection/CRTM_AntennaCorrection.f90
  src/AtmAbsorption/CRTM_AtmAbsorption.f90
  src/AtmAbsorption/CRTM_Predictor_Define.f90
  src/AtmAbsorption/CRTM_Predictor.f90
  src/AtmAbsorption/ODAS/ODAS_AtmAbsorption.f90
  src/AtmAbsorption/ODAS/ODAS_Predictor_Define.f90
  src/AtmAbsorption/ODAS/ODAS_Predictor.f90
  src/AtmAbsorption/ODPS/ODPS_AtmAbsorption.f90
  src/AtmAbsorption/ODPS/ODPS_CoordinateMapping.f90
  src/AtmAbsorption/ODPS/ODPS_Predictor_Define.f90
  src/AtmAbsorption/ODPS/ODPS_Predictor.f90
  src/AtmAbsorption/ODPS/PAFV_Define.f90
  src/AtmAbsorption/ODSSU/ODSSU_AtmAbsorption.f90
  src/AtmAbsorption/ODZeeman/ODZeeman_AtmAbsorption.f90
  src/AtmAbsorption/ODZeeman/ODZeeman_Predictor.f90
  src/AtmOptics/AOvar_Define.f90
  src/AtmOptics/CRTM_AtmOptics_Define.f90
  src/AtmOptics/CRTM_AtmOptics.f90
  src/Atmosphere/Aerosol/CRTM_Aerosol_Define.f90
  src/Atmosphere/Cloud/CRTM_CloudCover_Define.f90
  src/Atmosphere/Cloud/CRTM_Cloud_Define.f90
  src/Atmosphere/CRTM_Atmosphere_Define.f90
  src/Atmosphere/CRTM_Hypsometric.f90
  src/Atmosphere/CRTM_Atmosphere.f90
  src/Atmosphere/CRTM_Model_Profiles.f90
  src/Atmosphere/iAtm_Define.f90
  src/AtmScatter/AerosolScatter/ASvar_Define.f90
  src/AtmScatter/CloudScatter/CSvar_Define.f90
  src/AtmScatter/CRTM_AerosolScatter.f90
  src/AtmScatter/CRTM_AOD_Module.f90
  src/AtmScatter/CRTM_CloudScatter.f90
  src/AtmScatter/CRTM_MoleculeScatter.f90
  src/ChannelInfo/CRTM_ChannelInfo_Define.f90
  src/Coefficients/ACCoeff/ACCoeff_Binary_IO.f90
  src/Coefficients/ACCoeff/ACCoeff_netCDF_IO.f90
  src/Coefficients/ACCoeff/ACCoeff_Define.f90
  src/Coefficients/AerosolCoeff/AerosolCoeff_Binary_IO.f90
  src/Coefficients/AerosolCoeff/AerosolCoeff_Define.f90
  src/Coefficients/AerosolCoeff/AerosolCoeff_netCDF_IO.f90
  src/Coefficients/AerosolCoeff/AerosolCoeff_IO.f90
  src/Coefficients/CloudCoeff/CloudCoeff_Binary_IO.f90
  src/Coefficients/CloudCoeff/CloudCoeff_Define.f90
  src/Coefficients/CloudCoeff/CloudCoeff_netCDF_IO.f90
  src/Coefficients/CloudCoeff/CloudCoeff_IO.f90
  src/Coefficients/CRTM_AerosolCoeff.f90
  src/Coefficients/CRTM_CloudCoeff.f90
  src/Coefficients/CRTM_IRiceCoeff.f90
  src/Coefficients/CRTM_IRlandCoeff.f90
  src/Coefficients/CRTM_IRsnowCoeff.f90
  src/Coefficients/CRTM_IRwaterCoeff.f90
  src/Coefficients/CRTM_MWwaterCoeff.f90
  src/Coefficients/CRTM_SpcCoeff.f90
  src/Coefficients/CRTM_TauCoeff.f90
  src/Coefficients/CRTM_VISiceCoeff.f90
  src/Coefficients/CRTM_VISlandCoeff.f90
  src/Coefficients/CRTM_VISsnowCoeff.f90
  src/Coefficients/CRTM_VISwaterCoeff.f90
  src/Coefficients/EmisCoeff/IR_Land/LSEatlas/LSEatlas_Define.f90
  src/Coefficients/EmisCoeff/IR_Water/IRwaterCoeff_Define.f90
  src/Coefficients/EmisCoeff/IR_Water/IRwaterCoeff_IO.f90
  src/Coefficients/EmisCoeff/IR_Water/IRwaterCoeff_netCDF_IO.f90
  src/Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_Define.f90
  src/Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_IO.f90
  src/Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_Binary_IO.f90
  src/Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_netCDF_IO.f90
  src/Coefficients/EmisCoeff/MW_Water/MWwaterCoeff_Define.f90
  src/Coefficients/EmisCoeff/MW_Water/MWwaterLUT/MWwaterLUT_Define.f90
  src/Coefficients/EmisCoeff/SEcategory/SEcategory_Define.f90
  src/Coefficients/EmisCoeff/SEcategory/SEcategory_IO.f90
  src/Coefficients/EmisCoeff/SEcategory/SEcategory_netCDF_IO.f90
  src/Coefficients/FitCoeff/FitCoeff_Define.f90
  src/Coefficients/FitCoeff/FitCoeff_Destroy.inc
  src/Coefficients/FitCoeff/FitCoeff_Equal.inc
  src/Coefficients/FitCoeff/FitCoeff_Info.inc
  src/Coefficients/FitCoeff/FitCoeff_ReadFile.inc
  src/Coefficients/FitCoeff/FitCoeff_SetValue.inc
  src/Coefficients/FitCoeff/FitCoeff_WriteFile.inc
  src/Coefficients/NLTECoeff/NLTECoeff_Binary_IO.f90
  src/Coefficients/NLTECoeff/NLTECoeff_netCDF_IO.f90
  src/Coefficients/NLTECoeff/NLTECoeff_Define.f90
  src/Coefficients/SpcCoeff/SpcCoeff_Binary_IO.f90
  src/Coefficients/SpcCoeff/SpcCoeff_Define.f90
  src/Coefficients/SpcCoeff/SpcCoeff_IO.f90
  src/Coefficients/SpcCoeff/SpcCoeff_netCDF_IO.f90
  src/Coefficients/TauCoeff/ODAS/ODAS_Binary_IO.f90
  src/Coefficients/TauCoeff/ODAS/ODAS_netCDF_IO.f90
  src/Coefficients/TauCoeff/ODAS/ODAS_Define.f90
  src/Coefficients/TauCoeff/ODAS/ODAS_TauCoeff.f90
  src/Coefficients/TauCoeff/ODPS/ODPS_Binary_IO.f90
  src/Coefficients/TauCoeff/ODPS/ODPS_netCDF_IO.f90
  src/Coefficients/TauCoeff/ODPS/ODPS_Define.f90
  src/Coefficients/TauCoeff/ODPS/ODPS_TauCoeff.f90
  src/Coefficients/TauCoeff/ODSSU/ODSSU_Binary_IO.f90
  src/Coefficients/TauCoeff/ODSSU/ODSSU_Define.f90
  src/Coefficients/TauCoeff/ODSSU/ODSSU_TauCoeff.f90
  src/Coefficients/TauCoeff/ODZeeman/ODZeeman_TauCoeff.f90
  src/Coefficients/TauCoeff/TauCoeff_Define.f90
  src/CRTM_Adjoint_Module.f90
  src/CRTM_Forward_Module.f90
  src/CRTM_K_Matrix_Module.f90
  src/CRTM_LifeCycle.f90
  src/CRTM_Module.F90
  src/CRTM_Parameters.f90
  src/CRTM_Tangent_Linear_Module.f90
  src/CRTM_Utility/CRTM_Utility.f90
  src/CRTM_Version.inc
  src/GeometryInfo/CRTM_Geometry_Define.f90
  src/GeometryInfo/CRTM_GeometryInfo_Define.f90
  src/GeometryInfo/CRTM_GeometryInfo.f90
  src/InstrumentInfo/Instruments/Subset_Define.f90
  src/InstrumentInfo/SensorInfo/SensorInfo_Parameters.f90
  src/Interpolation/CRTM_Interpolation.f90
  src/NLTE/NLTE_Correction/CRTM_NLTECorrection.f90
  src/NLTE/NLTE_Parameters.f90
  src/NLTE/NLTE_Predictor/NLTE_Predictor_Define.f90
  src/NLTE/NLTE_Predictor/NLTE_Predictor_IO.f90
  src/Options/CRTM_Options_Define.f90
  src/Options/SSU_Input/SSU_Input_Define.f90
  src/Options/Zeeman_Input/Zeeman_Input_Define.f90
  src/RTSolution/ADA/ADA_Module.f90
  src/RTSolution/Common_RTSolution.f90
  src/RTSolution/CRTM_RTSolution_Define.f90
  src/RTSolution/CRTM_RTSolution.f90
  src/RTSolution/CRTM_Active_Sensor.f90
  src/RTSolution/Emission/Emission_Module.f90
  src/RTSolution/RTV_Define.f90
  src/RTSolution/SOI/SOI_Module.f90
  src/SensorInfo/CRTM_SensorInfo.f90
  src/SfcOptics/CRTM_IR_Ice_SfcOptics.f90
  src/SfcOptics/CRTM_IR_Land_SfcOptics.f90
  src/SfcOptics/CRTM_IR_Snow_SfcOptics.f90
  src/SfcOptics/CRTM_IR_Water_SfcOptics.f90
  src/SfcOptics/CRTM_MW_Ice_SfcOptics.f90
  src/SfcOptics/CRTM_MW_Land_SfcOptics.f90
  src/SfcOptics/CRTM_MW_Snow_SfcOptics.f90
  src/SfcOptics/CRTM_MW_Water_SfcOptics.f90
  src/SfcOptics/CRTM_SfcOptics_Define.f90
  src/SfcOptics/CRTM_SfcOptics.f90
  src/SfcOptics/CRTM_VIS_Ice_SfcOptics.f90
  src/SfcOptics/CRTM_VIS_Land_SfcOptics.f90
  src/SfcOptics/CRTM_VIS_Snow_SfcOptics.f90
  src/SfcOptics/CRTM_VIS_Water_SfcOptics.f90
  src/SfcOptics/IR_Water/IRSSEM/CRTM_IRSSEM.f90
  src/SfcOptics/IR_Snow/CRTM_IRSnowEM.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Azimuth_Emissivity_F6_Module.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Azimuth_Emissivity_Module.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/CRTM_Fastem1.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/CRTM_FastemX.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Foam_Utility_Module.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Large_Scale_Correction_Module.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Reflection_Correction_Module.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Slope_Variance.f90
  src/SfcOptics/MW_Water/FASTEM_MWSSEM/Small_Scale_Correction_Module.f90
  src/SfcOptics/MW_Water/Fresnel/Fresnel.f90
  src/SfcOptics/MW_Water/LowFrequency_MWSSEM/CRTM_LowFrequency_MWSSEM.f90
  src/SfcOptics/MW_Water/Ocean_Permittivity/Ellison.f90
  src/SfcOptics/MW_Water/Ocean_Permittivity/Guillou.f90
  src/SfcOptics/MW_Water/Ocean_Permittivity/Liu.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_AMSRE_SICEEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_AMSRE_SNOWEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_AMSU_SICEEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_AMSU_SnowEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_ATMS_SeaICE_LIB.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_ATMS_SeaICE_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_ATMS_SnowEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_LandEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_MHS_SICEEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_MHS_SnowEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SEAICE_PHYEM_MODULE.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SnowEM_ATMS_Parameters.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SnowEM_Parameters.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SSMI_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SSMI_SIceEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SSMI_SnowEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SSMIS_SeaIceEM_Module.f90
  src/SfcOptics/NESDIS_Emissivity/NESDIS_SSMIS_SnowEM_Module.f90
  src/SfcOptics/SEcategory/CRTM_SEcategory.f90
  src/Source_Functions/CRTM_Planck_Functions.f90
  src/Surface/CRTM_Surface_Define.f90
  src/Surface/SensorData/CRTM_SensorData_Define.f90
  src/Test_Utility/UnitTest/UnitTest_Define.f90
  src/Utility/Binary_File_Utility.f90
  src/Utility/Compare_Float_Numbers.f90
  src/Utility/DateTime_Utility/DateTime_Utility.f90
  src/Utility/DateTime_Utility/Date_Utility.f90
  src/Utility/Endian_Utility/Endian_Utility.f90
  src/Utility/File_Utility.f90
  src/Utility/Fundamental_Constants.f90
  src/Utility/Hyperbolic_Step/Hyperbolic_Step.f90
  src/Utility/Message_Handler.f90
  src/Utility/netCDF/netCDF_Attribute_Utility.f90
  src/Utility/netCDF/netCDF_Dimension_Utility.f90
  src/Utility/netCDF/netCDF_Utility.f90
  src/Utility/netCDF/netCDF_Variable_Utility.f90
  src/Utility/Profile_Utility/Profile_Utility_Parameters.f90
  src/Utility/Search_Utility/Search_Utility.f90
  src/Utility/Sort_Utility/Sort_Utility.f90
  src/Utility/Spectral_Utility/Spectral_Units_Conversion.f90
  src/Utility/String_Utility.f90
  src/Utility/Timing_Utility.f90
  src/Utility/Type_Kinds.f90
  src/Zeeman/Zeeman_Utility.f90
  )

esma_mepo_style(crtm CRTM_rel_path REL_PATH ..)
set (CRTM_path ${CMAKE_CURRENT_SOURCE_DIR}/${CRTM_rel_path})

set (SRCS)
foreach (file ${CRTM_SRCS})
  list (APPEND SRCS ${CRTM_path}/${file})
endforeach ()

esma_add_library (${this}
  SRCS ${SRCS}
  DEPENDENCIES OpenMP::OpenMP_Fortran NetCDF::NetCDF_Fortran
)

if (CMAKE_Fortran_COMPILER_ID MATCHES Intel)
  # These are the Release compiler flags used by the old crtm in NCEP_Shared
  set (CMAKE_Fortran_FLAGS_RELEASE "-free ${FOPT2} ${LITTLE_ENDIAN} ${BYTERECLEN}")
  # These are the Debug compiler flags used by the mother JCSDA CMake
  set (CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g -check bounds -traceback -warn -no-heap-arrays -fpe-all=0 -fpe:0 -ftz -check all ${LITTLE_ENDIAN} ${BYTERECLEN}")
endif ()

# For some reason, the mother CMake sets -D_REAL8_ for GNU Fortran
# only. So we do the same
if (CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
  target_compile_definitions(${this} PUBLIC _REAL8_)
endif ()

# They also set -DNDEBUG if not in debug mode
if (NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
  target_compile_definitions(${this} PUBLIC NDEBUG)
endif ()
