cmake_minimum_required (VERSION 3.13)
cmake_policy (SET CMP0053 NEW)
cmake_policy (SET CMP0054 NEW)

project (
  GEOSgcm
  VERSION 10.19.3
  LANGUAGES Fortran CXX C)  # Note - CXX is required for ESMF

if ("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
   message(SEND_ERROR "In-source builds are disabled. Please
           issue cmake command in separate build directory.")
endif ("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")

# Set the default build type to release
if (NOT CMAKE_BUILD_TYPE)
  message (STATUS "Setting build type to 'Release' as none was specified.")
  set (CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property (CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Release" "Aggressive")
endif ()

set (DOING_GEOS5 YES)

# Should find a better place for this - used in Chem component
set (ACG_FLAGS -v)
set (FV_PRECISION "R4R8" CACHE STRING "Precision of FV3 core (R4, R4R8, R8)")

# mepo can now clone subrepos in three styles
foreach (dir cmake @cmake cmake@)
  if (EXISTS ${CMAKE_CURRENT_LIST_DIR}/${dir})
    list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/${dir}")
  endif ()
endforeach ()
include (esma)

ecbuild_declare_project()

# Generic DFLAGS
# These should be relocated and/or eliminated.
add_definitions(-Dsys${CMAKE_SYSTEM_NAME} -DESMA64)
add_definitions(${MPI_Fortran_COMPILE_FLAGS})
include_directories(${MPI_Fortran_INCLUDE_PATH})

# Recursively build source tree
add_subdirectory (@env)
add_subdirectory (src)

# https://www.scivision.dev/cmake-auto-gitignore-build-dir/
# --- auto-ignore build directory
if(NOT EXISTS ${PROJECT_BINARY_DIR}/.gitignore)
  file(WRITE ${PROJECT_BINARY_DIR}/.gitignore "*")
endif()

# Piggyback that file into install
install(
   FILES ${PROJECT_BINARY_DIR}/.gitignore
   DESTINATION ${CMAKE_INSTALL_PREFIX}
   )

# Adds abiilty to tar source
include (esma_cpack)
