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

if(TARGET external::imguizmo)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::imguizmo'")

include(FetchContent)
FetchContent_Declare(
    imguizmo
    GIT_REPOSITORY https://github.com/CedricGuillemet/ImGuizmo.git
    GIT_TAG master
)
FetchContent_MakeAvailable(imguizmo)

add_library(imguizmo
    "${imguizmo_SOURCE_DIR}/ImGuizmo.h"
    "${imguizmo_SOURCE_DIR}/ImGuizmo.cpp"
)

target_include_directories(imguizmo PUBLIC "${imguizmo_SOURCE_DIR}")
target_link_libraries(imguizmo PUBLIC imgui::imgui)
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
