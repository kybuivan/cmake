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

if(TARGET external::eigen)
    return()
endif()

# option(EIGEN_WITH_MKL "Use Eigen with MKL" OFF)

if(EIGEN_ROOT)
    message(STATUS "Third-party (external): creating target 'external::eigen' for external path: ${EIGEN_ROOT}")
    set(EIGEN_INCLUDE_DIRS ${EIGEN_ROOT})
else()
    message(STATUS "Third-party (external): creating target 'external::eigen'")

    include(FetchContent)
    FetchContent_Declare(
        eigen
        URL https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip
        URL_HASH MD5=888aab45512cc0c734b3e8f60280daba
    )
    FetchContent_GetProperties(eigen)
    if(NOT eigen_POPULATED)
        FetchContent_Populate(eigen)
    endif()
    set(EIGEN_INCLUDE_DIRS ${eigen_SOURCE_DIR})

    install(DIRECTORY ${EIGEN_INCLUDE_DIRS}/Eigen
        DESTINATION include
    )
endif()

add_library(Eigen3_Eigen INTERFACE)
add_library(external::eigen ALIAS Eigen3_Eigen)

include(GNUInstallDirs)
target_include_directories(Eigen3_Eigen SYSTEM INTERFACE
    $<BUILD_INTERFACE:${EIGEN_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
# target_compile_definitions(Eigen3_Eigen INTERFACE EIGEN_MPL2_ONLY)

# if(EIGEN_WITH_MKL)
#     # TODO: Checks that, on 64bits systems, `mkl::mkl` is using the LP64 interface
#     # (by looking at the compile definition of the target)
#     include(mkl)
#     target_link_libraries(Eigen3_Eigen INTERFACE mkl::mkl)
#     target_compile_definitions(Eigen3_Eigen INTERFACE
#         EIGEN_USE_MKL_ALL
#         EIGEN_USE_LAPACKE_STRICT
#     )
# endif()

# On Windows, enable natvis files to improve debugging experience
if(WIN32 AND eigen_SOURCE_DIR)
    target_sources(Eigen3_Eigen INTERFACE $<BUILD_INTERFACE:${eigen_SOURCE_DIR}/debug/msvc/eigen.natvis>)
endif()

# Install rules
set(CMAKE_INSTALL_DEFAULT_COMPONENT_NAME eigen)
set_target_properties(Eigen3_Eigen PROPERTIES EXPORT_NAME Eigen)
install(DIRECTORY ${EIGEN_INCLUDE_DIRS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(TARGETS Eigen3_Eigen EXPORT Eigen_Targets)
install(EXPORT Eigen_Targets DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/eigen NAMESPACE Eigen3::)