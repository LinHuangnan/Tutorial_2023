cmake_minimum_required(VERSION 3.10)
project(opencv_project)
include_directories(${PROJECT_NAME})
include_directories(D:/opencv/install/include)
add_executable(${PROJECT_NAME} src/main.cpp src/Recovery.cpp)


