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

set(CVPLOT_USE_CONAN OFF CACHE INTERNAL "")
set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
#set(CVPLOT_HEADER_ONLY OFF CACHE INTERNAL "")
set(CVPLOT_WITH_TESTS OFF CACHE INTERNAL "")
set(CVPLOT_WITH_EXAMPLES OFF CACHE INTERNAL "")
FetchContent_Declare(
    cvplot
    GIT_REPOSITORY https://github.com/Profactor/cv-plot.git
    GIT_TAG master
    GIT_SHALLOW TRUE
)

# Find the custom-built version of OpenCV
set(OpenCV_DIR ${CMAKE_BINARY_DIR})
FetchContent_MakeAvailable(cvplot)