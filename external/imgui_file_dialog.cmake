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

if(TARGET external::imgui_file_dialog)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::imgui_file_dialog'")

include(FetchContent)

FetchContent_Declare(
  imgui_file_dialog
  GIT_REPOSITORY https://github.com/aiekick/ImGuiFileDialog.git
  GIT_TAG        cbc86cc28be136351090593a5d757ae11c90807c
)

FetchContent_MakeAvailable(imgui_file_dialog)

target_link_libraries(ImGuiFileDialog PUBLIC external::imgui)
target_compile_definitions(ImGuiFileDialog PUBLIC IMGUI_DEFINE_MATH_OPERATORS)

add_library(external::imgui_file_dialog ALIAS ImGuiFileDialog)