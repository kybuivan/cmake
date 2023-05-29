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

set( GLAD_PROFILE "core" CACHE STRING "OpenGL profile" )
set( GLAD_GENERATOR "c" CACHE STRING "Language to generate the binding for")

FetchContent_Declare(
  glad
  GIT_REPOSITORY "https://github.com/Dav1dde/glad.git"
  GIT_TAG        "glad2"
)

FetchContent_GetProperties(glad)

if(NOT glad_POPULATED)
  FetchContent_Populate(glad)

  add_subdirectory(${glad_SOURCE_DIR}/cmake ${glad_BINARY_DIR})
  glad_add_library(glad STATIC API gl:core=3.3)
endif()