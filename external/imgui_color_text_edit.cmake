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

if(TARGET external::imgui_color_text_edit)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::imgui_color_text_edit'")

include(FetchContent)

FetchContent_Declare(
        imgui_color_text_edit
        GIT_REPOSITORY https://github.com/BalazsJako/ImGuiColorTextEdit.git
        GIT_TAG 0a88824f7de8d0bd11d8419066caa7d3469395c4
)

FetchContent_GetProperties(imgui_color_text_edit)
if (NOT imgui_color_text_edit_POPULATED)
    FetchContent_Populate(imgui_color_text_edit)
    add_library(imgui_color_text_edit STATIC
            "${imgui_color_text_edit_SOURCE_DIR}/TextEditor.h"
            "${imgui_color_text_edit_SOURCE_DIR}/TextEditor.cpp")
    target_include_directories(imgui_color_text_edit PUBLIC ${imgui_color_text_edit_SOURCE_DIR})
    target_link_libraries(imgui_color_text_edit PUBLIC external::imgui)
    target_compile_definitions(imgui_color_text_edit PUBLIC IMGUI_DEFINE_MATH_OPERATORS)
endif()

add_library(external::imgui_color_text_edit ALIAS imgui_color_text_edit)
