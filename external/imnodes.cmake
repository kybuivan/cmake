# Get and configure imnodes
FetchContent_Declare(
        imnodes
        GIT_REPOSITORY https://github.com/Nelarius/imnodes.git
        GIT_TAG v0.5
)
FetchContent_GetProperties(imnodes)
if (NOT imnodes_POPULATED)
    FetchContent_Populate(imnodes)
    add_library(imnodes STATIC
            "${imnodes_SOURCE_DIR}/imnodes.h"
            "${imnodes_SOURCE_DIR}/imnodes_internal.h"
            "${imnodes_SOURCE_DIR}/imnodes.cpp")
    target_include_directories(imnodes PUBLIC ${imnodes_SOURCE_DIR})
    target_link_libraries(imnodes PUBLIC imgui::imgui)
endif()