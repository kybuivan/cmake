set( GLAD_PROFILE "core" CACHE STRING "OpenGL profile" )
set( GLAD_GENERATOR "c" CACHE STRING "Language to generate the binding for")

FetchContent_Declare(
  glad
  GIT_REPOSITORY "https://github.com/Dav1dde/glad.git"
  GIT_TAG        "glad2"
)

FetchContent_GetProperties(glad)

if(NOT glad_POPULATED)
  FetchContent_Populate(glad)

  add_subdirectory(${glad_SOURCE_DIR}/cmake ${glad_BINARY_DIR})
  glad_add_library(glad STATIC API gl:core=3.3)
endif()