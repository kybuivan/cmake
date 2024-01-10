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

if(TARGET external::tinyxml2)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::tinyxml2'")

include(FetchContent)

FetchContent_Declare(
    tinyxml2
    GIT_REPOSITORY https://github.com/leethomason/tinyxml2.git
    GIT_TAG 9.0.0
    GIT_PROGRESS TRUE
    FETCHCONTENT_UPDATES_DISCONNECTED
)

set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(tinyxml2_BUILD_TESTING OFF CACHE BOOL "Build tests for tinyxml2" FORCE)

FetchContent_MakeAvailable(tinyxml2)

add_library(external::tinyxml2 ALIAS tinyxml2)
