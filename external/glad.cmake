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

if(TARGET external::glad)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::glad'")

include(FetchContent)

FetchContent_Declare(
  glad
  GIT_REPOSITORY "https://github.com/Dav1dde/glad.git"
  GIT_TAG        "v2.0.4"
)

set(GLAD_PROFILE "core" CACHE STRING "OpenGL profile" )
set(GLAD_GENERATOR "c" CACHE STRING "Language to generate the binding for")

FetchContent_GetProperties(glad)

if(NOT glad_POPULATED)
  FetchContent_Populate(glad)

  add_subdirectory(${glad_SOURCE_DIR}/cmake ${glad_BINARY_DIR})
  glad_add_library(glad STATIC API gl:core=4.6)
  add_library(external::glad ALIAS glad)
endif()