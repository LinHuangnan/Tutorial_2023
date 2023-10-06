## 基础考核第一周完成情况提交

- **作者**：胡铎潇
- **日期**：2023-9-29
- **版本**：1.0.0
- **摘要**：1.Reverse Linked List 2.linux shell 3.Ros

------

#### 1. cmake编译链表（全部完成）

##### 1.1 代码编写

[代码点击此处](./代码/cmake.txt)

##### 1.2 cmake编译代码
* 1.创建一个文件夹名为daima。
* 2.touch 一个cpp文件hello.cpp，把代码复制进去。
* 3.编写CMakeLists.txt编译该源文件。
* 4.在daima文件夹下创建build文件夹并进入里面。
* 5.cmake ..生成Makefile文件
* 6.make -j编译项目，./hello执行文件
<div align=center><img width="600"  src="./image/1-1.png"/></div>

#### 2.linux shell（全部完成）
##### 2.1 系统安装
* 1.由于我的电脑系统为Windows11，所以我选择适用于 Linux 的 Windows 子系统 (WSL)，打开Power Shell，键入wsl --list --online，查看可安装的Ubuntu版本，我选择安装Ubuntu20.04，键入wsl --install Ubuntu-20.04，安装完成后在开始功能菜单可以看到Ubuntu的图标，通过开始菜单，进入Ubuntu的终端界面

##### 2.2 脚本编写

###### 2.2.1题一代码
* 1.创建目录使用mkdir代码，如果创建多级目录，则键入mkdir -v
* 2.cd键入该目录
* 3.复制使用cp代码，格式为cp A(文件A) 名称
* 4.chown改变属主
* 5.chomd改变权限
<div align=center><img width="600"  src="./image/2-1.png"/></div>


###### 2.2.2执行结果
<div align=center><img width="600"  src="./image/4.png"/></div>


##### 2.2.3 题二代码
* 1.创建目录使用mkdir代码。
* 2.cd键入该目录。
* 3.创建文件使用touch。
* 4.ls -d列出满足条件的文件，格式为ls -d [字符]*。
<div align=center><img width="600"  src="./image/2-2.png"/></div>


##### 2.2.4 执行结果
<div align=center><img width="600"  src="./image/2-3.png"/></div>

##### 2.2.5题三代码
* 1.创建help函数，输入错误时弹出（略微参考了一下别人的( ´◔︎ ‸◔︎`)）。
* 2.case判断第一个输入，内置判断满足不同的要求。
<div align=center><img width="600"  src="./image/代码1.png"/></div>
<div align=center><img width="600"  src="./image/代码2.png"/></div>

##### 2.2.5 执行结果
<div align=center><img width="600"  src="./image/2-4.png"/></div>
  

------

#### 3. ros通信（完成安装，未完成编写）
##### 3.1安装过程
* 1.鱼香肉丝，一行代码解决人生烦恼QAQ  。
 wget http://fishros.com/install -O fishros && . fishros
* 2.选择下载noetic版本。
* 3.更换系统源删除旧源。
##### 3.2效果图
<div align=center><img width="600"  src="./image/3-1.png"/></div>

#### 4. Markdown文档编写（已完成）

