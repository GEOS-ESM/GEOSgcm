# not yet ported to MAPL3 - restore when GEOS_Shared (and dependents) are ported
# GMAO_Shared is included but restricted to HERMES_LIGHT (GMAO_mpeu + minimal GMAO_hermes)
# NCEP_Shared is NOT needed without the full GMAO_Shared/GMAO_transf cascade
esma_add_subdirectories (
  GMAO_Shared
  )

if (NOT MAPL_FOUND)
  message (STATUS "External MAPL library not found. Building MAPL from source.")
  esma_add_subdirectory (MAPL)
else ()
  message (STATUS "MAPL library found. Using MAPL from ${MAPL_BASE_DIR}")
endif ()
