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

if(TARGET external::imgui_markdown)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::imgui_markdown'")

include(FetchContent)

FetchContent_Declare(
        imgui_markdown
        GIT_REPOSITORY https://github.com/juliettef/imgui_markdown.git
        GIT_TAG 61a181bdb83f450f852f7cf5d1282d8cda1c0f57
)

FetchContent_GetProperties(imgui_markdown)
if (NOT imgui_markdown_POPULATED)
    FetchContent_Populate(imgui_markdown)
    add_library(imgui_markdown INTERFACE)
    target_include_directories(
        imgui_markdown
        INTERFACE $<BUILD_INTERFACE:${imgui_markdown_SOURCE_DIR}>
                    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
    target_compile_features(imgui_markdown INTERFACE cxx_std_20)
    #target_include_directories(imgui_markdown PUBLIC ${imgui_markdown_SOURCE_DIR})
    #target_link_libraries(imgui_markdown PUBLIC external::imgui)
    #target_compile_definitions(imgui_markdown PUBLIC IMGUI_DEFINE_MATH_OPERATORS)
endif()

add_library(external::imgui_markdown ALIAS imgui_markdown)
