esma_add_subdirectories (
  GMAO_Shared
  NCEP_Shared
  )

if (NOT MAPL_FOUND)
  message (STATUS "External MAPL library not found. Building MAPL from source.")
  esma_add_subdirectory (MAPL)
else ()
  message (STATUS "MAPL library found. Using MAPL from ${MAPL_BASE_DIR}")
endif ()

if (NOT FMS_FOUND)
  message (STATUS "FMS library not found. Building FMS from source.")
  # Special case - FMS is built twice with two
  # different precisions.
  esma_add_subdirectory (FMS RENAME fms_r4)
  esma_add_subdirectory (FMS RENAME fms_r8)
else ()
  message (STATUS "FMS library found. Using FMS from ${FMS_DIR}")
endif ()
