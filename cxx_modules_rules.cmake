set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API "2182bf5c-ef0d-489a-91da-49dbc3090d2a")

set(CMake_TEST_CXXModules_UUID "a246741c-d067-4019-a8fb-3d16b0c9d1d3")

set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  include(msvc_modules)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  include(clang_modules)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  include(gcc_modules)
endif()