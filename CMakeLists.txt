cmake_minimum_required (VERSION 3.24)
cmake_policy (SET CMP0053 NEW)
cmake_policy (SET CMP0054 NEW)

project (
  GEOSgcm
  VERSION 11.7.1
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

# This flag at R4R8 means that FV3 is compiled at R4 but *linked* to
# FMS built at R8. This is needed as MOM6 is currently compiled as R8
# and so the linker can only link to one FMS library.
set (FV_PRECISION "R4R8" CACHE STRING "Precision of FV3 core (R4, R4R8, R8)")

# mepo can now clone subrepos in three styles
foreach (dir cmake @cmake cmake@)
  if (EXISTS ${CMAKE_CURRENT_LIST_DIR}/${dir})
    list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/${dir}")
    set (ESMA_CMAKE_PATH "${CMAKE_CURRENT_LIST_DIR}/${dir}" CACHE PATH "Path to ESMA_cmake code")
  endif ()
endforeach ()

# We need to find MPI before we go into esma
# for the MPI stack detection to work
set(MPI_DETERMINE_LIBRARY_VERSION TRUE)
find_package(MPI)

include (esma)

# Add CMake for when not using Baselibs
if (NOT Baselibs_FOUND)

  find_package(NetCDF REQUIRED C Fortran)
  add_definitions(-DHAS_NETCDF4)
  add_definitions(-DHAS_NETCDF3)
  add_definitions(-DNETCDF_NEED_NF_MPIIO)
  add_definitions(-DHAS_NETCDF3)

  find_package(HDF5 REQUIRED)
  if(HDF5_IS_PARALLEL)
     add_definitions(-DH5_HAVE_PARALLEL)
  endif()

  if (NOT TARGET ESMF::ESMF)
    find_package(ESMF 8.6.1 MODULE REQUIRED)
    target_link_libraries(ESMF::ESMF INTERFACE MPI::MPI_Fortran)

    # GEOS uses lowercase target due to historical reasons but
    # the latest FindESMF.cmake file from ESMF produces an ESMF::ESMF target.
    if (NOT TARGET esmf)
      add_library(esmf ALIAS ESMF::ESMF)
    endif ()
    if (NOT TARGET ESMF)
      add_library(ESMF ALIAS ESMF::ESMF)
    endif ()
  endif ()

  find_package(GFTL_SHARED REQUIRED)

  find_package(ZLIB REQUIRED)
  # Another issue with historical reasons, old/wrong zlib target used in GEOS
  add_library(ZLIB::zlib ALIAS ZLIB::ZLIB)

  find_package(MAPL 2.54 QUIET)
  if (MAPL_FOUND)
    message(STATUS "Found MAPL: ${MAPL_BASE_DIR} (found version \"${MAPL_VERSION})\"")
  endif ()

endif ()

ecbuild_declare_project()

# Generic DFLAGS
# These should be relocated and/or eliminated.
add_definitions(-Dsys${CMAKE_SYSTEM_NAME} -DESMA64)
add_definitions(${MPI_Fortran_COMPILE_FLAGS})
include_directories(${MPI_Fortran_INCLUDE_PATH})

esma_mepo_style(env env_dir)
esma_add_subdirectory (${env_dir})
# Recursively build source tree
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

# Adds ability to tar source
include (esma_cpack)

# This installs a tarball of the source code
# in the installation directory.
# MUST BE THE LAST CODE IN THIS FILE
option(INSTALL_SOURCE_TARFILE "Create and install source tarfile" OFF)
if(INSTALL_SOURCE_TARFILE)
  install(CODE "set(CMAKE_PROJECT_NAME \"${CMAKE_PROJECT_NAME}\")")
  install(SCRIPT "${ESMA_CMAKE_PATH}/esma_postinstall.cmake")
endif()
