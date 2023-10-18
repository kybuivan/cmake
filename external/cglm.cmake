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

if(TARGET external::cglm)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::cglm'")

include(FetchContent)

FetchContent_Declare(
    cglm
    GIT_REPOSITORY https://github.com/recp/cglm.git
    GIT_TAG v0.9.1
)

set(CGLM_SHARED OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(cglm)

add_library(external::cglm ALIAS cglm)
