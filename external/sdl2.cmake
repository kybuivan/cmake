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

if(TARGET external::sdl2)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::sdl2'")

include(FetchContent)

FetchContent_Declare(
    sdl2
    GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
    GIT_TAG  release-2.26.5
)

set( SDL_SHARED OFF CACHE BOOL "SDL2 option" FORCE )
set( SDL_STATIC ON CACHE BOOL "SDL2 option" FORCE )

FetchContent_MakeAvailable(SDL2)

add_library(external::sdl2 ALIAS SDL2-static)
add_library(external::sdl2main ALIAS SDL2main)