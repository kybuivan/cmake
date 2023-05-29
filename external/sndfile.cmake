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

if(TARGET sndfile::sndfile)
    return()
endif()

message(STATUS "Third-party (external): creating target 'sndfile::sndfile'")

include(FetchContent)

FetchContent_Declare(
    sndfile
    GIT_REPOSITORY https://github.com/libsndfile/libsndfile.git
    GIT_TAG 1.2.0
)

set(BUILD_PROGRAMS OFF CACHE BOOL "Build programs" FORCE)
set(BUILD_EXAMPLES OFF CACHE BOOL "Build examples" FORCE)
set(ENABLE_CPACK OFF CACHE BOOL "Enable CPack support" FORCE)
set(ENABLE_BOW_DOCS OFF CACHE BOOL "Enable black-on-white html docs" FORCE)
set(ENABLE_PACKAGE_CONFIG OFF CACHE BOOL "Generate and install package config file" FORCE)
set(INSTALL_PKGCONFIG_MODULE OFF CACHE BOOL "Generate and install pkg-config module" FORCE)
set(BUILD_TESTING OFF CACHE BOOL "Build tests" FORCE)

FetchContent_MakeAvailable(sndfile)
add_library(sndfile::sndfile ALIAS sndfile)