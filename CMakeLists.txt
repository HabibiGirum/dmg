cmake_minimum_required(VERSION 3.17.5)
project("Vistar")

set(OSQUERY_DATA_PATH "" CACHE PATH "osquery package data")
set(CPACK_PACKAGE_VERSION "")
if(OSQUERY_DATA_PATH STREQUAL "")
    message(FATAL_ERROR "Missing data folder")
endif()
if(NOT CPACK_GENERATOR)
    message(FATAL_ERROR "The CPACK_GENERATOR variable was not set")
endif()

if(OSQUERY_PACKAGE_VERSION STREQUAL "")
    message (FATAL_ERROR "The OSQUERY_PACKAGE_VERSION variable was not set")
endif()
set(CPACK_PACKAGE_VERSION "${OSQUERY_PACKAGE_VERSION}")

set(CPACK_PACKAGE_DESCRIPTION "osquery is an operating system instrumentation toolchain.")
set(CPACK_COMPONENT_OSQUERY_DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION}")
set(CPACK_PACKAGE_NAME "Vistar")


set(platform_name "macos")
include("platform/common.cmake")
include("platform/macos/common.cmake")
include("platform/macos/productbuild.cmake")

include(CPack)
cpack_add_component("vistar"
    DISPLAY_NAME "Main binaries and tools"
    REQUIRED
)
