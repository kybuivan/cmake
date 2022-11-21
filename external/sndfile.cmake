set(BUILD_PROGRAMS    OFF CACHE BOOL "" FORCE)
set(BUILD_EXAMPLES   OFF CACHE BOOL "" FORCE)
set(ENABLE_CPACK     OFF CACHE BOOL "" FORCE)
set(ENABLE_BOW_DOCS     OFF CACHE BOOL "" FORCE)
set(ENABLE_PACKAGE_CONFIG     OFF CACHE BOOL "" FORCE)
set(INSTALL_PKGCONFIG_MODULE     OFF CACHE BOOL "" FORCE)
set(BUILD_TESTING     OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    libsndfile
    GIT_REPOSITORY https://github.com/libsndfile/libsndfile.git
    GIT_TAG 1.1.0
)
FetchContent_MakeAvailable(libsndfile)