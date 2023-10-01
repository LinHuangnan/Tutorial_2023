# Install script for directory: /home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/pub_sub

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pub_sub/msg" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/pub_sub/msg/number.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pub_sub/cmake" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/pub_sub-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/devel/include/pub_sub")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/devel/share/roseus/ros/pub_sub")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/devel/share/common-lisp/ros/pub_sub")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/devel/share/gennodejs/ros/pub_sub")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/devel/lib/python2.7/dist-packages/pub_sub")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/devel/lib/python2.7/dist-packages/pub_sub")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/pub_sub.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pub_sub/cmake" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/pub_sub-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pub_sub/cmake" TYPE FILE FILES
    "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/pub_subConfig.cmake"
    "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/pub_subConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pub_sub" TYPE FILE FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/pub_sub/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pub_sub" TYPE PROGRAM FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/publisher.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pub_sub" TYPE PROGRAM FILES "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/build/pub_sub/catkin_generated/installspace/subscriber.py")
endif()

