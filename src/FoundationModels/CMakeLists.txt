#esma_add_subdirectory(GenCast_GEOS-FP)

# At the moment, GenCast_GEOS-FP is not compatible with the CMake build system
# as we don't really build anything in it. Instead, we will just "install" the
# directory to the install tree. So we'd get $CMAKE_INSTALL_PREFIX/GenCast_GEOS-FP
# after installation.

# One complication, though, is that mepo can call it GenCast_GEOS-FP or
# @GenCast_GEOS-FP or GenCast_GEOS-FP@ depending on the user's mepo settings.
# We have a function for this, esma_mepo_style(), that we can use to get the
# correct name.

esma_mepo_style(GenCast_GEOS-FP mepo_GenCast_GEOS_FP)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${mepo_GenCast_GEOS_FP}/
  DESTINATION GenCast_GEOS-FP
  USE_SOURCE_PERMISSIONS
  )
