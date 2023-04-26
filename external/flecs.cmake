find_package(flecs QUIET)

set(FLECS_SHARED OFF CACHE INTERNAL "")
if (NOT flecs_FOUND)
    FetchContent_Declare(
        flecs       
        GIT_REPOSITORY https://github.com/SanderMertens/flecs.git
        GIT_TAG v3.1.5
    )  

    FetchContent_MakeAvailable(flecs)
endif()