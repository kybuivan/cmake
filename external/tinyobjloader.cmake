# 
# Copyright (c) 2023 Ky Bui Van
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 

if(TARGET tinyobjloader::tinyobjloader)
    return()
endif()

message(STATUS "Third-party (external): creating target 'tinyobjloader::tinyobjloader'")

# Tinyobjloader is a big repo for a single header, so we just download the header...
include(FetchContent)
set(TINYOBJLOADER_VERSION "8322e00ae685ea623ab6ac5a6cebcfa2d22fbf93")
set(TINYOBJLOADER_URL "https://raw.githubusercontent.com/tinyobjloader/tinyobjloader/${TINYOBJLOADER_VERSION}/tiny_obj_loader.h")
set(TINYOBJLOADER_SOURCE_DIR "${FETCHCONTENT_BASE_DIR}/tinyobjloader-src/${TINYOBJLOADER_VERSION}")
set(TINYOBJLOADER_BINARY_DIR "${FETCHCONTENT_BASE_DIR}/tinyobjloader-build")
set(TINYOBJLOADER_FILE "${TINYOBJLOADER_SOURCE_DIR}/tiny_obj_loader.h")

if(NOT EXISTS ${TINYOBJLOADER_FILE})
    # Note: Once we move to CMake 3.18, we can use FetchContent with the DOWNLOAD_NO_EXTRACT option
    message(STATUS "Downloading ${TINYOBJLOADER_URL} to ${TINYOBJLOADER_FILE}")
    file(MAKE_DIRECTORY ${TINYOBJLOADER_SOURCE_DIR})
    file(
        DOWNLOAD ${TINYOBJLOADER_URL} ${TINYOBJLOADER_FILE}
        TIMEOUT 60
        TLS_VERIFY ON
        EXPECTED_MD5 fca8189f03970f1dbb9544579b5bda08
    )
endif()

# Generate implementation file
file(WRITE "${TINYOBJLOADER_BINARY_DIR}/tiny_obj_loader.cpp.in" [[
    #define TINYOBJLOADER_IMPLEMENTATION
    #include <tiny_obj_loader.h>
]])

configure_file(${TINYOBJLOADER_BINARY_DIR}/tiny_obj_loader.cpp.in ${TINYOBJLOADER_BINARY_DIR}/tiny_obj_loader.cpp COPYONLY)

# Define tinyobjloader library
add_library(tinyobjloader ${TINYOBJLOADER_BINARY_DIR}/tiny_obj_loader.cpp)
add_library(tinyobjloader::tinyobjloader ALIAS tinyobjloader)

include(GNUInstallDirs)
target_include_directories(tinyobjloader PUBLIC
    $<BUILD_INTERFACE:${TINYOBJLOADER_SOURCE_DIR}>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

target_compile_definitions(tinyobjloader PUBLIC TINYOBJLOADER_USE_DOUBLE)

set_target_properties(tinyobjloader PROPERTIES FOLDER third_party)

# Install rules
set(CMAKE_INSTALL_DEFAULT_COMPONENT_NAME tinyobjloader)
install(DIRECTORY ${TINYOBJLOADER_SOURCE_DIR} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(TARGETS tinyobjloader EXPORT Tinyobjloader_Targets)
install(EXPORT Tinyobjloader_Targets DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/tinyobjloader NAMESPACE tinyobjloader::)
