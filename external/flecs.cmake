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

if(TARGET external::flecs)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::flecs'")

include(FetchContent)

FetchContent_Declare(
    flecs       
    GIT_REPOSITORY https://github.com/SanderMertens/flecs.git
    GIT_TAG v3.1.5
)

set(FLECS_SHARED OFF CACHE INTERNAL "Build shared flecs lib" FORCE)

FetchContent_MakeAvailable(flecs)

add_library(external::flecs ALIAS flecs)
