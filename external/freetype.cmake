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

if(TARGET external::freetype)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::freetype'")

include(FetchContent)

FetchContent_Declare(
    freetype 
    GIT_REPOSITORY https://github.com/freetype/freetype.git
    GIT_TAG VER-2-13-2
)

cmake_policy(SET CMP0077 NEW)

set(FT_DISABLE_BZIP2 ON)
set(FT_DISABLE_HARFBUZZ ON)
set(FT_DISABLE_PNG ON)
set(FT_DISABLE_BROTLI ON)
set(FT_DISABLE_ZLIB ON)
set(SKIP_INSTALL_ALL ON)

FetchContent_MakeAvailable(freetype)

if(NOT TARGET external::freetype)
	add_library(external::freetype ALIAS freetype)
endif()