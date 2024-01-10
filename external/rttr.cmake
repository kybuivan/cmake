# 
# Copyright (c) 2023-2024 Ky Bui Van
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
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if(TARGET external::rttr)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::rttr'")

include(FetchContent)

FetchContent_Declare(
    rttr
    GIT_REPOSITORY https://github.com/rttrorg/rttr.git
    GIT_TAG  7edbd580cfad509a3253c733e70144e36f02ecd4
)

if(BUILD_SHARED_LIBS)
	set(BUILD_RTTR_DYNAMIC ON)
	set(BUILD_STATIC OFF)
else()
	set(BUILD_RTTR_DYNAMIC OFF)
	set(BUILD_STATIC ON)
endif()

set(BUILD_UNIT_TESTS OFF CACHE INTERNAL "Build the unit tests of RTTR" FORCE)
set(BUILD_WITH_STATIC_RUNTIME_LIBS OFF CACHE BOOL "Link against the static runtime libraries" FORCE)
set(BUILD_WITH_RTTI ON CACHE BOOL "Enable build with C++ runtime type information for compilation" FORCE)
set(BUILD_BENCHMARKS OFF CACHE BOOL "Enable this to build the benchmarks" FORCE)
set(BUILD_EXAMPLES OFF CACHE INTERNAL "Enable this to build the examples" FORCE)
set(BUILD_DOCUMENTATION OFF CACHE INTERNAL "Enable this to build the documentation" FORCE)
set(BUILD_INSTALLER OFF CACHE INTERNAL "Enable this to build the installer" FORCE)
set(BUILD_PACKAGE OFF CACHE INTERNAL "Enable this to build the installer" FORCE)
set(USE_PCH OFF CACHE INTERNAL "Use precompiled header files for compilation" FORCE)
set(CUSTOM_DOXYGEN_STYLE OFF CACHE INTERNAL "Enable this option to use a custom doxygen style for HTML documentation; Otherwise the default will be used" FORCE)
set(BUILD_WEBSITE_DOCU OFF CACHE BOOL "Enable this option to create the special docu for the website" FORCE)
set(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_CXX14_STANDARD_COMPILE_OPTION})

FetchContent_MakeAvailable(rttr)

add_library(external::rttr ALIAS rttr_core_lib)