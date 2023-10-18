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

if(TARGET external::nfd)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::nfd'")

include(FetchContent)

FetchContent_Declare(
    nfd
    GIT_REPOSITORY https://github.com/btzy/nativefiledialog-extended.git
    GIT_TAG        v1.0.3
)

FetchContent_MakeAvailable(nfd)

add_library(external::nfd ALIAS nfd)