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

if(TARGET external::lua)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::lua'")

include(FetchContent)

FetchContent_Declare(
    lua
    GIT_REPOSITORY https://github.com/lua/lua.git
    GIT_TAG v5.4.6
)

FetchContent_GetProperties(lua)
if (NOT lua_POPULATED)
    FetchContent_Populate(lua)
    file(GLOB_RECURSE lua_sources "${lua_SOURCE_DIR}/*.c")
    file(GLOB_RECURSE lua_headers" ${lua_SOURCE_DIR}/*.h")
    add_library(lua STATIC ${lua_sources} ${lua_headers})
    target_include_directories(lua PUBLIC ${lua_SOURCE_DIR})
endif()

add_library(external::lua ALIAS lua)