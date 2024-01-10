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

if(TARGET external::cvplot)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::cvplot'")

include(FetchContent)

FetchContent_Declare(
    cvplot
    GIT_REPOSITORY https://github.com/Profactor/cv-plot.git
    GIT_TAG  v1.2.2
)

set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "Build shared libs")
set(CVPLOT_USE_CONAN OFF CACHE INTERNAL "Use opencv from conan package manager")
set(CVPLOT_HEADER_ONLY OFF CACHE INTERNAL "Use as header only library")
set(CVPLOT_WITH_TESTS OFF CACHE INTERNAL "Build with tests")
set(CVPLOT_WITH_EXAMPLES OFF CACHE INTERNAL "Build with examples")

FetchContent_MakeAvailable(cvplot)

add_library(external::cvplot ALIAS CvPlot)