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

if(TARGET spdlog::spdlog)
    return()
endif()

message(STATUS "Third-party (external): creating target 'spdlog::spdlog'")

include(FetchContent)

FetchContent_Declare(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    GIT_TAG v1.11.0
)

# Lots of compilation errors without this setting
set(SPDLOG_FMT_EXTERNAL ON CACHE BOOL "Use external fmt library instead of bundled" FORCE)
set(SPDLOG_INSTALL OFF CACHE BOOL "Generate the install target" FORCE)
set(SPDLOG_BUILD_EXAMPLE OFF CACHE BOOL "Build example" FORCE)
set(SPDLOG_BUILD_SHARED OFF CACHE BOOL "Build shared library" FORCE)
set(SPDLOG_BUILD_TESTS OFF CACHE BOOL "Build tests" FORCE)

FetchContent_MakeAvailable(spdlog)