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