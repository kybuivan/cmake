function(add_executable_folder subfolders)
    foreach(_dir IN ITEMS ${subfolders})
        file(GLOB _files "${_dir}/*.c")
        message(STATUS "Pattern `${_dir}':")

        foreach(_file IN ITEMS ${_files})
            get_filename_component(_file_name ${_file} NAME )

            # Get the file name without extension
            get_filename_component(_project_name ${_file_name} NAME_WE)
            message(STATUS "  ${_dir}/${_file_name} is going to be built")

            add_executable(${_project_name} "${_dir}/${_file_name}")
            target_compile_features(${_project_name} PRIVATE c_std_99)
            target_link_libraries(${_project_name} PUBLIC
                external::flecs
            )
        endforeach()
    endforeach()
endfunction(add_executable_folder)