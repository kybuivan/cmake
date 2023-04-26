set(ADD_PYTHON_EXAMPLES OFF CACHE INTERNAL "")
FetchContent_Declare(
    cvui
    GIT_REPOSITORY https://github.com/Dovyski/cvui.git
    GIT_TAG master
    GIT_SHALLOW TRUE
)

FetchContent_GetProperties(cvui)
if(NOT cvui_POPULATED)
    FetchContent_Populate(cvui)

    # Generate implementation file
    #file(WRITE "${cvui_BINARY_DIR}/cvui.cpp.in" [[
    #    // One (and only one) of your C++ files must define CVUI_IMPLEMENTATION
    #    // before the inclusion of cvui.h to ensure its implementaiton is compiled.
    #    #define CVUI_IMPLEMENTATION
    #    #include <cvui.h>
    #]])
    #
    #configure_file(${cvui_BINARY_DIR}/cvui.cpp.in ${cvui_BINARY_DIR}/cvui.cpp COPYONLY)

    # Define cvui library
    #add_library(cvui PRIVATE ${cvui_BINARY_DIR}/cvui.cpp)
    add_library(cvui INTERFACE)
    target_sources(cvui INTERFACE ${cvui_SOURCE_DIR}/cvui.h)
    #target_link_libraries(cvui PRIVATE ${OpenCV_LIBS})
    #target_include_directories(cvui PUBLIC ${OpenCV_INCLUDE_DIRS} "${cvui_SOURCE_DIR}")


    add_library(cvui::cvui ALIAS cvui)
endif()

set(cvui_INCLUDE_DIRS ${cvui_SOURCE_DIR})