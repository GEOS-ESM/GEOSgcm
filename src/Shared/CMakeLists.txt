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
