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

if(TARGET external::rttr)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::rttr'")

include(FetchContent)

FetchContent_Declare(
    rttr
    GIT_REPOSITORY https://github.com/rttrorg/rttr.git
    GIT_TAG  v0.9.6
)

set(BUILD_RTTR_DYNAMIC OFF CACHE INTERNAL "Build the dynamic/shared version of RTTR library" FORCE)
set(BUILD_UNIT_TESTS OFF CACHE INTERNAL "Build the unit tests of RTTR" FORCE)
set(BUILD_EXAMPLES OFF CACHE INTERNAL "Enable this to build the examples" FORCE)
set(BUILD_DOCUMENTATION OFF CACHE INTERNAL "Enable this to build the documentation" FORCE)
set(BUILD_INSTALLER OFF CACHE INTERNAL "Enable this to build the installer" FORCE)
set(BUILD_PACKAGE OFF CACHE INTERNAL "Enable this to build the installer" FORCE)
set(USE_PCH OFF CACHE INTERNAL "Use precompiled header files for compilation" FORCE)
set(CUSTOM_DOXYGEN_STYLE OFF CACHE INTERNAL "Enable this option to use a custom doxygen style for HTML documentation; Otherwise the default will be used" FORCE)
set(BUILD_STATIC ON CACHE INTERNAL "Enable this option to create the special docu for the website" FORCE)

FetchContent_MakeAvailable(rttr)

add_library(external::rttr ALIAS rttr_core_lib)
