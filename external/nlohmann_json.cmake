if (NOT json_FOUND)

    FetchContent_Declare(
        nlohmann_json
        GIT_REPOSITORY https://github.com/nlohmann/json.git
        GIT_TAG v3.11.2
    )

    set(JSON_BuildTests OFF CACHE INTERNAL "Don't build the json tests")
    FetchContent_MakeAvailable(nlohmann_json)

    # nlohmann_json::nlohmann_json
endif()