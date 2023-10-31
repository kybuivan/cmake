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

if(TARGET external::raylib_nuklear)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::raylib_nuklear'")

include(FetchContent)

FetchContent_Declare(
    raylib_nuklear
    GIT_REPOSITORY https://github.com/RobLoach/raylib-nuklear.git
    GIT_TAG v4.2.2
    GIT_SHALLOW 1
)

FetchContent_MakeAvailable(raylib_nuklear)
add_library(external::raylib_nuklear ALIAS raylib_nuklear)
  