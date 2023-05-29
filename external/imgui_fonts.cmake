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

if(TARGET imgui::fonts)
    return()
endif()

message(STATUS "Third-party (external): creating target 'imgui::fonts'")

include(FetchContent)
FetchContent_Declare(
    imgui_fonts
    GIT_REPOSITORY https://github.com/HasKha/imgui-fonts.git
    GIT_TAG 4b785f4871b651d1d35be6286726d74c5804f04e
)
FetchContent_MakeAvailable(imgui_fonts)

set_target_properties(fonts PROPERTIES FOLDER third_party)
