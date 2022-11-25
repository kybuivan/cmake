set( GLAD_PROFILE "core" CACHE STRING "OpenGL profile" )
set( GLAD_GENERATOR "c" CACHE STRING "Language to generate the binding for")

FetchContent_Declare(
  glad
  GIT_REPOSITORY "https://github.com/Dav1dde/glad.git"
  GIT_TAG        v0.1.36
)

FetchContent_MakeAvailable(glad)