cmake_minimum_required(VERSION 3.10)
project(opencv_project)
include_directories(D:/Tutorial_2023/workspace/src_code/week_4/opencv_project/src)
include_directories(D:/opencv/install/include)
include_directories(D:/opencv/install/include/opencv2)
add_executable(${PROJECT_NAME} src/main.cpp src/Recovery.cpp)
add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)

target_link_libraries(opencv_project ${OpenCV_LIBS})

