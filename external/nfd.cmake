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

FetchContent_Declare(
    nfd
    GIT_REPOSITORY https://github.com/mlabbe/nativefiledialog.git
    GIT_TAG        release_116
)

FetchContent_GetProperties(nfd)
if(NOT nfd_POPULATED)
    FetchContent_Populate(nfd)
    add_library(nfd STATIC EXCLUDE_FROM_ALL)
    target_sources(nfd PRIVATE
        "${nfd_SOURCE_DIR}/src/nfd_common.c"
        "$<$<PLATFORM_ID:Linux>:${nfd_SOURCE_DIR}/src/nfd_zenity.c>"
        "$<$<PLATFORM_ID:Darwin>:${nfd_SOURCE_DIR}/src/nfd_cocoa.m>"
        "$<$<PLATFORM_ID:Windows>:${nfd_SOURCE_DIR}/src/nfd_win.cpp>"
    )
    target_include_directories(nfd PUBLIC "${nfd_SOURCE_DIR}/src/include")
    target_compile_definitions(nfd PRIVATE _CRT_SECURE_NO_WARNINGS=1)
    target_compile_options(nfd PRIVATE $<$<C_COMPILER_ID:GNU>:-Wno-format-truncation>)
endif()