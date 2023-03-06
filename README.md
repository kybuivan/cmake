# My CMake Repository
This is a collection of CMake modules and scripts that I use in my C++ projects.

## Usage
You can use this CMake repository in your project by adding it as a submodule in your repository. To do this, run the following command in your repository:

```batch
git submodule add -b main --force --name cmake https://github.com/kybuivan/cmake.git cmake
```

This will create a new directory called `cmake` in your repository, which contains all of the CMake modules and scripts from this repository.

You can then include the CMake modules in your `CMakeLists.txt` file using the `include()` command:

```cmake
include(cmake/external/glfw.cmake)

add_executable(myapp main.cpp)
target_link_libraries(myapp PRIVATE glfw)
```

Note that you will need to modify the paths in the `include()` command to match the relative path to the CMake module from your `CMakeLists.txt` file.

## License
This repository is licensed under the MIT license. See [LICENSE](https://github.com/kybuivan/cmake/blob/cff2f9b379ff608a86e0673e7fe81b312b3ec161/LICENSE) for more details.