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

set(BUILD_PROGRAMS    OFF CACHE BOOL "" FORCE)
set(BUILD_EXAMPLES   OFF CACHE BOOL "" FORCE)
set(ENABLE_CPACK     OFF CACHE BOOL "" FORCE)
set(ENABLE_BOW_DOCS     OFF CACHE BOOL "" FORCE)
set(ENABLE_PACKAGE_CONFIG     OFF CACHE BOOL "" FORCE)
set(INSTALL_PKGCONFIG_MODULE     OFF CACHE BOOL "" FORCE)
set(BUILD_TESTING     OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    libsndfile
    GIT_REPOSITORY https://github.com/libsndfile/libsndfile.git
    GIT_TAG 1.1.0
)
FetchContent_MakeAvailable(libsndfile)