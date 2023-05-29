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

if(TARGET OpenAL::OpenAL)
    return()
endif()

message(STATUS "Third-party (external): creating target 'OpenAL::OpenAL'")

include(FetchContent)
 

FetchContent_Declare(
    OpenAL
    GIT_REPOSITORY https://github.com/kcat/openal-soft.git
    GIT_TAG 1.23.1
)

#add OpenAL library
set(ALSOFT_EXAMPLES OFF CACHE BOOL "Build example programs" FORCE)
set(ALSOFT_INSTALL_EXAMPLES OFF CACHE BOOL "Install example programs (alplay, alstream, ...)" FORCE)
set(ALSOFT_UTILS OFF CACHE BOOL "Build utility programs" FORCE)
set(ALSOFT_INSTALL_UTILS OFF CACHE BOOL "Install utility programs (openal-info, alsoft-config, ...)" FORCE)
set(ALSOFT_REQUIRE_OPENSL OFF CACHE BOOL "Require OpenSL backend" FORCE)
set(ALSOFT_REQUIRE_OBOE OFF CACHE BOOL "Require Oboe backend" FORCE)
set(ALSOFT_REQUIRE_SDL2 OFF CACHE BOOL "Require SDL2 backend" FORCE)
set(ALSOFT_UPDATE_BUILD_VERSION OFF CACHE BOOL "Update git build version info" FORCE)
set(LIBTYPE "STATIC")

FetchContent_MakeAvailable(OpenAL)