set( SDL_SHARED OFF CACHE BOOL "SDL2 option" FORCE )
set( SDL_STATIC ON CACHE BOOL "SDL2 option" FORCE )

FetchContent_Declare(
    sdl2
    GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
    GIT_TAG release-2.0.22
)

FetchContent_MakeAvailable(sdl2)