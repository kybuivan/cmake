cmake_minimum_required(VERSION 3.10)

#if (POLICY CMP0058)
#	cmake_policy(SET CMP0058 NEW)
#endif()

set(CMAKE_CXX_STANDARD 11)

project("project"
    VERSION 0.1.0
)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${PROJECT_SOURCE_DIR}/cmake/external)

include(FetchContent)
include(opencv)
#include(googletest)
#include(boost)
include(nfd)
include(imgui)

include_directories(SYSTEM ${opencv_INCLUDE_DIRS})

add_executable(myProj main.cpp App.cpp)
target_link_libraries(myProj PRIVATE imgui::imgui ${opencv_LIBS} nfd)

#add_subdirectory(src)