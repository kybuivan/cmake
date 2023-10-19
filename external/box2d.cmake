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

if(TARGET external::box2d)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::box2d'")

include(FetchContent)

FetchContent_Declare(
    box2d
    GIT_REPOSITORY https://github.com/erincatto/box2d.git
    GIT_TAG        v2.4.1
)

set(BOX2D_BUILD_UNIT_TESTS OFF CACHE BOOL  "Build the Box2D unit tests" FORCE)
set(BOX2D_BUILD_TESTBED OFF CACHE BOOL  "Build the Box2D testbed" FORCE)
set(BOX2D_BUILD_DOCS OFF CACHE BOOL  "Build the Box2D documentation" FORCE)
set(BOX2D_USER_SETTINGS OFF CACHE BOOL  "Override Box2D settings with b2UserSettings.h" FORCE)

FetchContent_MakeAvailable(box2d)

add_library(external::box2d ALIAS box2d)