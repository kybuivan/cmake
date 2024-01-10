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

set(ADD_PYTHON_EXAMPLES OFF CACHE INTERNAL "")
FetchContent_Declare(
    cvui
    GIT_REPOSITORY https://github.com/Dovyski/cvui.git
    GIT_TAG master
    GIT_SHALLOW TRUE
)

FetchContent_GetProperties(cvui)
if(NOT cvui_POPULATED)
    FetchContent_Populate(cvui)

    # Generate implementation file
    #file(WRITE "${cvui_BINARY_DIR}/cvui.cpp.in" [[
    #    // One (and only one) of your C++ files must define CVUI_IMPLEMENTATION
    #    // before the inclusion of cvui.h to ensure its implementaiton is compiled.
    #    #define CVUI_IMPLEMENTATION
    #    #include <cvui.h>
    #]])
    #
    #configure_file(${cvui_BINARY_DIR}/cvui.cpp.in ${cvui_BINARY_DIR}/cvui.cpp COPYONLY)

    # Define cvui library
    #add_library(cvui PRIVATE ${cvui_BINARY_DIR}/cvui.cpp)
    add_library(cvui INTERFACE)
    target_sources(cvui INTERFACE ${cvui_SOURCE_DIR}/cvui.h)
    #target_link_libraries(cvui PRIVATE ${OpenCV_LIBS})
    #target_include_directories(cvui PUBLIC ${OpenCV_INCLUDE_DIRS} "${cvui_SOURCE_DIR}")


    add_library(cvui::cvui ALIAS cvui)
endif()

set(cvui_INCLUDE_DIRS ${cvui_SOURCE_DIR})