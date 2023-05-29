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

set(BUILD_RTTR_DYNAMIC OFF CACHE INTERNAL "" FORCE)
set(BUILD_UNIT_TESTS OFF CACHE INTERNAL "" FORCE)
set(BUILD_EXAMPLES OFF CACHE INTERNAL "" FORCE)
set(BUILD_DOCUMENTATION OFF CACHE INTERNAL "" FORCE)
set(BUILD_INSTALLER OFF CACHE INTERNAL "" FORCE)
set(BUILD_PACKAGE OFF CACHE INTERNAL "" FORCE)
set(USE_PCH OFF CACHE INTERNAL "" FORCE)
set(CUSTOM_DOXYGEN_STYLE OFF CACHE INTERNAL "" FORCE)
set(BUILD_STATIC ON CACHE INTERNAL "" FORCE)
FetchContent_Declare(
    rttr
    GIT_REPOSITORY https://github.com/rttrorg/rttr.git
    GIT_TAG master
)
FetchContent_MakeAvailable(rttr)