function(add_module)
    # Retrieve module name
    get_filename_component(module_path "${CMAKE_CURRENT_SOURCE_DIR}" REALPATH)
    get_filename_component(module_name "${module_path}" NAME)

    # Retrieve options
    set(options INTERFACE)
    set(oneValueArgs "")
    set(multiValueArgs "")
    cmake_parse_arguments(OPTIONS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    # Define module
    if(OPTIONS_INTERFACE)
        add_library(${module_name} INTERFACE)
        set(module_scope INTERFACE)
    else()
        add_library(${module_name})
        set(module_scope PUBLIC)
    endif()
    add_library(${module_name}::${module_name} ALIAS ${module_name})

    include(GNUInstallDirs)
    target_include_directories(${module_name} ${module_scope}
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDE_DIR}>
    )

    # Target sources
    file(GLOB_RECURSE INC_FILES "include/*.h")
    file(GLOB_RECURSE SRC_FILES "src/*.cpp")
    source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}/include/" PREFIX "Header Files" FILES ${INC_FILES})
    source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}/src/" PREFIX "Source Files" FILES ${SRC_FILES})
    target_sources(${module_name} PRIVATE ${INC_FILES} ${SRC_FILES})
endfunction()