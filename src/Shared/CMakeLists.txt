# GSW (ecbuild project) includes ecbuild_system; disable it!
if( EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/@GSW )
   set (gsw_ECBUILD_SYSTEM_INCLUDED TRUE)
endif()

esma_add_subdirectories (
  @MAPL
  @GMAO_Shared
  @NCEP_Shared
  @GSW
  )

# Special case - FMS is built twice with two
# different precisions.
add_subdirectory (@FMS fms_r4)
add_subdirectory (@FMS fms_r8)
