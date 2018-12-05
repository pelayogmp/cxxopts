# - Try to find the LIBIGL library
# Once done this will define
#
#  CXXOPTS_FOUND - system has CXXOPTS
#  CXXOPTS_INCLUDE_DIR - **the** CXXOPTS include directory
if(CXXOPTS_FOUND)
    return()
endif()

find_path(CXXOPTS_INCLUDE_DIR cxxopts.hpp
    HINTS
        ENV CXXOPTS
        ENV CXXOPTSROOT
        ENV CXXOPTS_ROOT
        ENV CXXOPTS_DIR
    PATHS
        ${CMAKE_SOURCE_DIR}/../..
        ${CMAKE_SOURCE_DIR}/..
        ${CMAKE_SOURCE_DIR}
        ${CMAKE_SOURCE_DIR}/cxxopts
        ${CMAKE_SOURCE_DIR}/../cxxopts
        ${CMAKE_SOURCE_DIR}/../../cxxopts
        /usr
        /usr/local
        /usr/local/igl/libigl
    PATH_SUFFIXES include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIBIGL
    "\ncxxopts not found --- You can download it using:\n\tgit clone  https://github.com/jarro2783/cxxopts.git ${CMAKE_SOURCE_DIR}/../cxxopts"
    CXXOPTS_INCLUDE_DIR)
mark_as_advanced(CXXOPTS_INCLUDE_DIR)

# list(APPEND CMAKE_MODULE_PATH "${CXXOPTS_INCLUDE_DIR}/../cmake")
include(libigl)
