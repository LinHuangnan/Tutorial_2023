# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ser_cli: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ser_cli_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" NAME_WE)
add_custom_target(_ser_cli_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ser_cli" "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(ser_cli
  "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ser_cli
)

### Generating Module File
_generate_module_cpp(ser_cli
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ser_cli
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ser_cli_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ser_cli_generate_messages ser_cli_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" NAME_WE)
add_dependencies(ser_cli_generate_messages_cpp _ser_cli_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ser_cli_gencpp)
add_dependencies(ser_cli_gencpp ser_cli_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ser_cli_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(ser_cli
  "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ser_cli
)

### Generating Module File
_generate_module_eus(ser_cli
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ser_cli
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ser_cli_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ser_cli_generate_messages ser_cli_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" NAME_WE)
add_dependencies(ser_cli_generate_messages_eus _ser_cli_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ser_cli_geneus)
add_dependencies(ser_cli_geneus ser_cli_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ser_cli_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(ser_cli
  "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ser_cli
)

### Generating Module File
_generate_module_lisp(ser_cli
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ser_cli
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ser_cli_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ser_cli_generate_messages ser_cli_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" NAME_WE)
add_dependencies(ser_cli_generate_messages_lisp _ser_cli_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ser_cli_genlisp)
add_dependencies(ser_cli_genlisp ser_cli_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ser_cli_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(ser_cli
  "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ser_cli
)

### Generating Module File
_generate_module_nodejs(ser_cli
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ser_cli
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ser_cli_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ser_cli_generate_messages ser_cli_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" NAME_WE)
add_dependencies(ser_cli_generate_messages_nodejs _ser_cli_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ser_cli_gennodejs)
add_dependencies(ser_cli_gennodejs ser_cli_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ser_cli_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(ser_cli
  "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ser_cli
)

### Generating Module File
_generate_module_py(ser_cli
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ser_cli
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ser_cli_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ser_cli_generate_messages ser_cli_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tongfakun/tutorial_2023/Tutorial_2023/workspace/week1/ros/ws/src/ser_cli/srv/Number.srv" NAME_WE)
add_dependencies(ser_cli_generate_messages_py _ser_cli_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ser_cli_genpy)
add_dependencies(ser_cli_genpy ser_cli_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ser_cli_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ser_cli)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ser_cli
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ser_cli_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ser_cli)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ser_cli
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ser_cli_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ser_cli)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ser_cli
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ser_cli_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ser_cli)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ser_cli
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ser_cli_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ser_cli)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ser_cli\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ser_cli
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ser_cli_generate_messages_py std_msgs_generate_messages_py)
endif()
