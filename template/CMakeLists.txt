cmake_minimum_required(VERSION 3.10)

#if (POLICY CMP0058)
#	cmake_policy(SET CMP0058 NEW)
#endif()

project("project"
    VERSION 0.1.0
)

set (CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

if (NOT CMAKE_VERSION VERSION_LESS "3.1.0")
	set (CMAKE_CXX_STANDARD "98")
	set (CMAKE_CXX_EXTENSIONS OFF)
endif()

add_subdirectory(src)