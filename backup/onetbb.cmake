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

if(TARGET TBB::tbb)
    return()
endif()

message(STATUS "Third-party (external): creating targets 'TBB::tbb'")

# Emscripten sets CMAKE_SYSTEM_PROCESSOR to "x86". Change it to "WASM" to prevent TBB from
# adding machine-specific "-mrtm" and "-mwaitpkg" compile options.
if(EMSCRIPTEN)
    set(CMAKE_SYSTEM_PROCESSOR "WASM")
endif()

include(FetchContent)
FetchContent_Declare(
    tbb
    GIT_REPOSITORY https://github.com/oneapi-src/oneTBB.git
    GIT_TAG v2021.6.0-rc1
    GIT_SHALLOW TRUE
)

option(TBB_TEST "Enable testing" OFF)
option(TBB_EXAMPLES "Enable examples" OFF)
option(TBB_STRICT "Treat compiler warnings as errors" ON)
option(TBB_PREFER_STATIC "Use the static version of TBB for the alias target" ON)
unset(TBB_DIR CACHE)

set(OLD_BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS})
if(TBB_PREFER_STATIC)
    set(BUILD_SHARED_LIBS OFF CACHE STRING "Build shared library" FORCE)
else()
    set(BUILD_SHARED_LIBS ON CACHE STRING "Build shared library" FORCE)
endif()

set(CMAKE_INSTALL_DEFAULT_COMPONENT_NAME tbb)
FetchContent_MakeAvailable(tbb)

set(BUILD_SHARED_LIBS ${OLD_BUILD_SHARED_LIBS} CACHE STRING "Build shared library" FORCE)

if(NOT TARGET TBB::tbb)
    message(FATAL_ERROR "TBB::tbb is still not defined!")
endif()

foreach(name IN ITEMS tbb tbbmalloc tbbmalloc_proxy)
    if(TARGET ${name})
        # Folder name for IDE
        set_target_properties(${name} PROPERTIES FOLDER "third_party//tbb")

        # Force debug postfix for library name. Our pre-compiled MKL library expects "tbb12.dll" (without postfix).
        set_target_properties(${name} PROPERTIES DEBUG_POSTFIX "")

        # Without this macro, TBB will explicitly link against "tbb12_debug.lib" in Debug configs.
        # This is undesirable, since our pre-compiled version of MKL is linked against "tbb12.dll".
        target_compile_definitions(${name} PUBLIC -D__TBB_NO_IMPLICIT_LINKAGE=1)

        # Disable some features and avoid processor-specific code paths when compiling with
        # Emscripten for WebAssembly.
        if(EMSCRIPTEN)
            target_compile_definitions(${name} PRIVATE
                ITT_ARCH=-1
                __TBB_RESUMABLE_TASKS_USE_THREADS=1
                __TBB_DYNAMIC_LOAD_ENABLED=0
                __TBB_WEAK_SYMBOLS_PRESENT=0
            )
        endif()
    endif()
endforeach()
