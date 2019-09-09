esma_add_subdirectories (
  @MAPL
  @GMAO_Shared
  @NCEP_Shared
  )

# Special case - GFDL_fms is built twice with two
# different precisions.
add_subdirectory (@GFDL_fms GFDL_fms_r4)
add_subdirectory (@GFDL_fms GFDL_fms_r8)
