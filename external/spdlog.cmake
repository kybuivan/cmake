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

if(TARGET external::spdlog)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::spdlog'")

include(FetchContent)

FetchContent_Declare(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    GIT_TAG v1.12.0
)

# Lots of compilation errors without this setting
set(SPDLOG_FMT_EXTERNAL OFF CACHE BOOL "Use external fmt library instead of bundled" FORCE)
set(SPDLOG_INSTALL OFF CACHE BOOL "Generate the install target" FORCE)
set(SPDLOG_BUILD_EXAMPLE OFF CACHE BOOL "Build example" FORCE)
set(SPDLOG_BUILD_SHARED OFF CACHE BOOL "Build shared library" FORCE)
set(SPDLOG_BUILD_TESTS OFF CACHE BOOL "Build tests" FORCE)

FetchContent_MakeAvailable(spdlog)
add_library(external::spdlog ALIAS spdlog)
