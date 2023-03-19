set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
set(BUILD_DOCS OFF CACHE INTERNAL "")
set(BUILD_EXAMPLES OFF CACHE INTERNAL "")
set(BUILD_TESTS OFF CACHE INTERNAL "")
set(BUILD_opencv_calib3d ON CACHE INTERNAL "")
set(BUILD_opencv_highgui ON CACHE INTERNAL "")
set(BUILD_opencv_imgcodecs ON CACHE INTERNAL "")
set(BUILD_opencv_java OFF CACHE INTERNAL "")
set(BUILD_opencv_gapi OFF CACHE INTERNAL "")
set(BUILD_opencv_objc OFF CACHE INTERNAL "")
set(BUILD_opencv_js OFF CACHE INTERNAL "")
set(BUILD_opencv_ts OFF CACHE INTERNAL "")
set(BUILD_opencv_features2d OFF CACHE INTERNAL "")
set(BUILD_opencv_photo OFF CACHE INTERNAL "")
set(BUILD_opencv_video OFF CACHE INTERNAL "")
set(BUILD_opencv_python2 OFF CACHE INTERNAL "")
set(BUILD_opencv_python3 OFF CACHE INTERNAL "")
set(BUILD_opencv_dnn OFF CACHE INTERNAL "")
set(BUILD_opencv_videoio OFF CACHE INTERNAL "")
set(BUILD_opencv_calib3d OFF CACHE INTERNAL "")
set(BUILD_opencv_flann OFF CACHE INTERNAL "")
set(BUILD_opencv_objdetect OFF CACHE INTERNAL "")
set(BUILD_opencv_stitching OFF CACHE INTERNAL "")
set(BUILD_opencv_ml OFF CACHE INTERNAL "")
set(BUILD_opencv_world OFF CACHE INTERNAL "")

FetchContent_Declare(
        opencv
        GIT_REPOSITORY https://github.com/opencv/opencv.git
        GIT_TAG        4.7.0
        GIT_SHALLOW    TRUE
        OVERRIDE_FIND_PACKAGE
)

FetchContent_MakeAvailable(opencv)
set(opencv_INCLUDE_DIRS "")
list(APPEND opencv_INCLUDE_DIRS ${OPENCV_CONFIG_FILE_INCLUDE_DIR})
list(APPEND opencv_INCLUDE_DIRS 
        ${OPENCV_MODULE_opencv_core_LOCATION}/include
        ${OPENCV_MODULE_opencv_imgproc_LOCATION}/include
        ${OPENCV_MODULE_opencv_imgcodecs_LOCATION}/include
        ${OPENCV_MODULE_opencv_highgui_LOCATION}/include)
set(opencv_LIBS "")
list(APPEND opencv_LIBS opencv_core opencv_imgproc opencv_highgui opencv_imgcodecs)