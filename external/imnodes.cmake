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

if(TARGET external::imnodes)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::imnodes'")

include(FetchContent)

FetchContent_Declare(
        imnodes
        GIT_REPOSITORY https://github.com/Nelarius/imnodes.git
        GIT_TAG d88f99125bb72cdb71b4c27ff6eb7f318d89a4c5
)

FetchContent_GetProperties(imnodes)
if (NOT imnodes_POPULATED)
    FetchContent_Populate(imnodes)
    add_library(imnodes STATIC
            "${imnodes_SOURCE_DIR}/imnodes.h"
            "${imnodes_SOURCE_DIR}/imnodes_internal.h"
            "${imnodes_SOURCE_DIR}/imnodes.cpp")
    target_include_directories(imnodes PUBLIC ${imnodes_SOURCE_DIR})
    target_link_libraries(imnodes PUBLIC external::imgui)
    target_compile_definitions(imnodes PUBLIC IMGUI_DEFINE_MATH_OPERATORS)
endif()

add_library(external::imnodes ALIAS imnodes)
