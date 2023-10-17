cmake_minimum_required(VERSION 3.10)
project(opencv_project)
list(APPEND CMAKE_PREFIX_PATH ../../lib)
FIND_PACKAGE(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS} )
add_executable(${PROJECT_NAME} src/main.cpp src/Recovery.cpp)
target_link_libraries(opencv_project ${OpenCV_LIBS})


