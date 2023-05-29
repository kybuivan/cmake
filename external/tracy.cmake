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

if(TARGET tracy::client)
    return()
endif()

message(STATUS "Third-party (external): creating target 'tracy::client'")

include(FetchContent)
FetchContent_Declare(
    tracy
    GIT_REPOSITORY https://github.com/wolfpld/tracy.git
    GIT_TAG  v0.7.7
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(tracy)

################################################################################
# Client
################################################################################

# Do not forget to add global compilation flags '-fno-omit-frame-pointer' and '-g'!
add_library(tracy_client ${tracy_SOURCE_DIR}/TracyClient.cpp)
add_library(tracy::client ALIAS tracy_client)

include(GNUInstallDirs)
target_include_directories(tracy_client SYSTEM INTERFACE
    $<BUILD_INTERFACE:${tracy_SOURCE_DIR}>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

target_compile_definitions(tracy_client PUBLIC TRACY_ENABLE)

target_compile_features(tracy_client PUBLIC cxx_std_11)
set_target_properties(tracy_client PROPERTIES ENABLE_EXPORTS ON)

# Install rules
set(CMAKE_INSTALL_DEFAULT_COMPONENT_NAME tracy)
install(TARGETS tracy_client EXPORT Tracy_Targets)
install(EXPORT Tracy_Targets DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/tracy NAMESPACE tracy::)