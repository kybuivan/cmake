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