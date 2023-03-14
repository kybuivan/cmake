FetchContent_Declare(
    nfd
    GIT_REPOSITORY https://github.com/mlabbe/nativefiledialog.git
    GIT_TAG        release_116
)

FetchContent_GetProperties(nfd)
if(NOT nfd_POPULATED)
    FetchContent_Populate(nfd)
    add_library(nfd STATIC EXCLUDE_FROM_ALL)
    target_sources(nfd PRIVATE
        "${nfd_SOURCE_DIR}/src/nfd_common.c"
        "$<$<PLATFORM_ID:Linux>:${nfd_SOURCE_DIR}/src/nfd_zenity.c>"
        "$<$<PLATFORM_ID:Darwin>:${nfd_SOURCE_DIR}/src/nfd_cocoa.m>"
        "$<$<PLATFORM_ID:Windows>:${nfd_SOURCE_DIR}/src/nfd_win.cpp>"
    )
    target_include_directories(nfd PUBLIC "${nfd_SOURCE_DIR}/src/include")
    target_compile_definitions(nfd PRIVATE _CRT_SECURE_NO_WARNINGS=1)
    target_compile_options(nfd PRIVATE $<$<C_COMPILER_ID:GNU>:-Wno-format-truncation>)
endif()