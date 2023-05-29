#
# Copyright (c) 2023 Ky Bui Van
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#

include(FetchContent)
FetchContent_Declare(
    assimp
    GIT_REPOSITORY https://github.com/assimp/assimp.git
    GIT_TAG v5.2.4
)

option(BUILD_SHARED_LIBS "Build package with shared libraries." OFF)
option(BUILD_TESTING "" OFF)
option(ASSIMP_BUILD_FRAMEWORK "Build package as Mac OS X Framework bundle." OFF)
option(ASSIMP_DOUBLE_PRECISION "Set to ON to enable double precision processing" OFF)
option(ASSIMP_NO_EXPORT "Disable Assimp's export functionality." OFF)
option(ASSIMP_BUILD_ZLIB "Build your own zlib" ON)
option(ASSIMP_BUILD_DOCS "Build documentation using Doxygen." OFF)
option(ASSIMP_BUILD_ASSIMP_TOOLS "If the supplementary tools for Assimp are built in addition to the library." OFF)
option(ASSIMP_BUILD_SAMPLES "If the official samples are built as well (needs Glut)." OFF)
option(ASSIMP_BUILD_TESTS "If the test suite for Assimp is built in addition to the library." OFF)
option(ASSIMP_INSTALL "Disable this if you want to use assimp as a submodule." OFF)
option(ASSIMP_INSTALL_PBD "" OFF)
option(ASSIMP_INJECT_DEBUG_POSTFIX "Inject debug postfix in .a/.so/.dll lib names" OFF)
option(ASSIMP_BUILD_PBRT_EXPORTER "Build Assimp with PBRT importer" OFF)

# Use a CACHE variable to prevent Assimp from building with its embedded clipper
set(Clipper_SRCS "" CACHE STRING "" FORCE)

# Disable IFC importer, since it requires clipper
option(ASSIMP_BUILD_IFC_IMPORTER "Build Assimp with IFC importer" OFF)

# Disable 3MF exporter, since it requires kuba--/zip (which wraps a modified version of miniz)
option(ASSIMP_BUILD_3MF_EXPORTER "Build Assimp with 3MF exporter" OFF)

FetchContent_MakeAvailable(assimp)