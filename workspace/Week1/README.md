#Week 1 tasks 
##本周任务
1.安装linux系统并且使用vim编写一个链表反转的cpp文件
2.编写shell脚本，分别实现三个任务
3.安装ros系统并且学会编写package
4.学会markdown文件编写
##1.安装linux系统并且使用vim编写一个链表反转的cpp文件
通过VMware安装ubuntu具体过程在这里不多赘述，中间有阻碍但是搜索网上的资料来解决遇到的问题
使用vim reverse_linked_list.cpp 文件提交代码
特别提醒：vim完之后按esc后记得输入：再输入wq
###cmake和make阶段
主要目的就是生成一个可执行文件(./reverse...)

vim cmakelists.txt
内容：cmake_minimun_require(VERSION 3.10)
      project(...)   这个文件名不知道干啥的
      add_executable(reverse...   reverse...cpp)   前面的是最终生成的可执行文件的名字 后面的是源代码文件名

生成makefile文件 
       mkdir build 
       cd build
       cmake..      (..代表上一级目录)
       make

##2.编写shell脚本，分别实现三个任务
script1:
         #!/bin/bash 必须加这个在开头，确定解释器
         mkdir 用于创建路径
         cd    用于进入目录
         cp -r ...   ./...  第一个是目录路径 第二个是目标路径 —r用于复制所有的
         sudo chown -R ... ...     chown是change owner，-R是更改所有，后面跟着的是新所有者名字和工作目录
         chmod -R o-rwx test       chmod 更改权限，o-r表示删除读取权限，o-w表示删除写入权限，o-x表示删除执行权限。
保存后 在terminal 输入chmod +x ...  加上可执行文件的名字

script2：
         date 显示日期
         touch 创建文件
         ls [ax6]* *表示任何一个都可以
         ls [...][...]*第一位第二位限定

script3:
        cat ... 显示所有信息
        后面的实在没有时间写，

##3.安装ros系统并且学会编写package
Ros安装真的很不容易
https://blog.csdn.net/sea_grey_whale/article/details/132023522?spm=1001.2101.3001.6650.4&utm_medium=distribute.pc_relevant.none-task-blog-2~default~YuanLiJiHua~Position-4-132023522-blog-109591426.235%5Ev38%5Epc_relevant_anti_vip_base&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~YuanLiJiHua~Position-4-132023522-blog-109591426.235%5Ev38%5Epc_relevant_anti_vip_base&utm_relevant_index=7
在rosdep init的时候用这个（失败三）
https://blog.csdn.net/Iamsonice/article/details/116018915?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_title~default-0.no_search_link&spm=1001.2101.3001.4242.1
在rosdep update的时候time out用这个
https://blog.csdn.net/qq_49959714/article/details/129150457?spm=1001.2014.3001.5502
最后成功运行小乌龟 但是package这些还没弄明白 
失败原因好像是no such file 过程我忘记记录了 反正是一直文件找不到