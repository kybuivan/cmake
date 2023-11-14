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

if(TARGET external::icon_font_cpp_headers)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::icon_font_cpp_headers'")

include(FetchContent)

FetchContent_Declare(
        icon_font_cpp_headers
        GIT_REPOSITORY https://github.com/juliettef/IconFontCppHeaders.git
        GIT_TAG 41b304750e83c0a89375cc1834f65c1204308b4a
)

FetchContent_GetProperties(icon_font_cpp_headers)
if (NOT icon_font_cpp_headers_POPULATED)
    FetchContent_Populate(icon_font_cpp_headers)
    add_library(icon_font_cpp_headers INTERFACE
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsLucide.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsKenney.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsCodicons.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontaudio.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsForkAwesome.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome6.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome4.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome5.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsMaterialDesign.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome5Pro.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome5Brands.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome6Brands.h"
        "${icon_font_cpp_headers_SOURCE_DIR}/IconsFontAwesome5ProBrands.h"
    )

    target_include_directories(
        icon_font_cpp_headers
        INTERFACE $<BUILD_INTERFACE:${icon_font_cpp_headers_SOURCE_DIR}>
                    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
    target_compile_features(icon_font_cpp_headers INTERFACE cxx_std_20)
endif()

add_library(external::icon_font_cpp_headers ALIAS icon_font_cpp_headers)
