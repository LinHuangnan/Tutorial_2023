# Install script for directory: /home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/src/first_Pkg

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/first_Pkg/msg" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/src/first_Pkg/msg/Message.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/first_Pkg/cmake" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/build/first_Pkg/catkin_generated/installspace/first_Pkg-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/devel/include/first_Pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/devel/share/roseus/ros/first_Pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/devel/share/common-lisp/ros/first_Pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/devel/share/gennodejs/ros/first_Pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/devel/lib/python2.7/dist-packages/first_Pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/devel/lib/python2.7/dist-packages/first_Pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/build/first_Pkg/catkin_generated/installspace/first_Pkg.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/first_Pkg/cmake" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/build/first_Pkg/catkin_generated/installspace/first_Pkg-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/first_Pkg/cmake" TYPE FILE FILES
    "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/build/first_Pkg/catkin_generated/installspace/first_PkgConfig.cmake"
    "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/build/first_Pkg/catkin_generated/installspace/first_PkgConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/first_Pkg" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/catkin_ws/src/first_Pkg/package.xml")
endif()

