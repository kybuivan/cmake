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

find_package(dspatch QUIET)

set(BUILD_STATIC ON CACHE BOOL "" FORCE)
if (NOT dspatch_FOUND)
    FetchContent_Declare(
        dspatch       
        GIT_REPOSITORY https://github.com/kybuivan/dspatch.git
        GIT_TAG fix_static_build
    )  

    FetchContent_MakeAvailable(dspatch)
endif()