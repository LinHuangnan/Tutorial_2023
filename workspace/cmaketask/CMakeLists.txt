cmake_minimum_required( VERSION 2.8 )
project (demo)
#aux_source_directory(. SRC_LIST)
#add_executable(hello ${SRC_LIST})
add_subdirectory(src)
#向当前工程添加存放源文件的子目录
#cmake时会进入到src 找寻src目录下的CMakeListtxt
