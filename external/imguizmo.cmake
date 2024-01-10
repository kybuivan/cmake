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

if(TARGET external::imguizmo)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::imguizmo'")

include(FetchContent)
FetchContent_Declare(
    imguizmo
    GIT_REPOSITORY https://github.com/CedricGuillemet/ImGuizmo.git
    GIT_TAG 090184e4b315bd508929a362c4d4fa9b36b1249f
)
FetchContent_MakeAvailable(imguizmo)

add_library(imguizmo
    "${imguizmo_SOURCE_DIR}/GraphEditor.h"
    "${imguizmo_SOURCE_DIR}/GraphEditor.cpp"
    "${imguizmo_SOURCE_DIR}/ImCurveEdit.h"
    "${imguizmo_SOURCE_DIR}/ImCurveEdit.cpp"
    "${imguizmo_SOURCE_DIR}/ImGradient.h"
    "${imguizmo_SOURCE_DIR}/ImGradient.cpp"
    "${imguizmo_SOURCE_DIR}/ImGuizmo.h"
    "${imguizmo_SOURCE_DIR}/ImGuizmo.cpp"
    "${imguizmo_SOURCE_DIR}/ImSequencer.h"
    "${imguizmo_SOURCE_DIR}/ImSequencer.cpp"
    "${imguizmo_SOURCE_DIR}/ImZoomSlider.h"
)

target_include_directories(imguizmo PUBLIC "${imguizmo_SOURCE_DIR}")
target_link_libraries(imguizmo PUBLIC external::imgui)
target_compile_definitions(imguizmo PUBLIC IMGUI_DEFINE_MATH_OPERATORS)

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
    target_compile_options(imguizmo PRIVATE
        "-Wno-unused-const-variable" "-Wno-unused-function"
    )
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    target_compile_options(imguizmo PRIVATE
        "-Wno-unused-const-variable" "-Wno-unused-function"
    )
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    target_compile_options(imguizmo PRIVATE
        "-Wno-unused-const-variable" "-Wno-unused-function" "-Wno-deprecated-copy"
    )
endif()

add_library(external::imguizmo ALIAS imguizmo)