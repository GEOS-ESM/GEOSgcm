esma_add_subdirectories (
  @MAPL
  @GMAO_Shared
  @NCEP_Shared
  )

# Special case - FMS is built twice with two
# different precisions.
add_subdirectory (@FMS fms_r4)
add_subdirectory (@FMS fms_r8)
