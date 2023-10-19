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

if(TARGET external::ldtk_loader)
    return()
endif()

message(STATUS "Third-party (external): creating target 'external::ldtk_loader'")

include(FetchContent)

FetchContent_Declare(
    ldtk_loader
    GIT_REPOSITORY https://github.com/Madour/LDtkLoader.git
    GIT_TAG        1.2.2
)

FetchContent_MakeAvailable(ldtk_loader)

add_library(external::ldtk_loader ALIAS LDtkLoader)
