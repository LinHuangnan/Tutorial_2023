# Week1 考核报告
Author : 童发坤
Date ： 2023-09-30
##  虚拟机的安装
在Windows下，有自带的Hyper-v虚拟机,通过[某些方法](https://zhuanlan.zhihu.com/p/51939654)来在家庭版下使用它，
之后便可以前往[ubuntu的官网](https://ubuntu.com/)去下载对应的版本的文件
最后再根据[这个步骤](https://blog.csdn.net/ZChen1996/article/details/106042635)来按图索骥即可

**注意**
- hyper-v与VMware存在冲突，不要同时使用
- hyper-v存在网络问题，其中的虚拟机会网速会只有几k

## Reverse
### cpp部分
代码如下
```cpp

       //定义链表
       struct ListNode {
          int val;
          ListNode *next;
          ListNode() : val(0), next(nullptr) {}
          ListNode(int x) : val(x), next(nullptr) {}
          ListNode(int x, ListNode *next) : val(x), next(next) {}
      };
      //三指针遍历实现反转
      class Solution {
      public:
         ListNode* reverseList(ListNode* head) {
            ListNode* now = head, *last = nullptr;
            while(now != nullptr){
                ListNode* i = now->next;
                now->next = last;
                last = now;
                now =  i;
            }
            return last;
         }
      };
```
实现上就是三指针循环遍历链表
### make部分
这一部分呢，我只是参照makefile的规则
```
target ... : prerequistes ...
    recipe
    ...
    ...
```
来把.cpp文件转换成.o文件
在包含makefile的目录下的终端中输入
```
$make
```
即可启动编译
具体效果如下

![Alt text](<image/2023-09-30 16-06-29 的屏幕截图.png>)

可以看到我们生成了一个reverse.o文件
### cmake部分
这一部分我也只是将文件转换成第三方库，考虑到这是一个类，我认为是可取的
同样在包含CMakeLists.txt的目录下输入
```
$cmake
```
即可

效果如下：
![Alt text](<image/2023-09-30 16-11-07 的屏幕截图.png>)

## shell脚本
由于2-1.sh的chown和chmod需要权限，为了方便验证，我在root下进行操作
```
$sudo su #进入root
```
剩下的就顺便在root下验证了
以下脚本已经被赋予执行权限，如果无法执行，可以用
```
$sh 脚本名.sh
```
执行
或者赋予执行权限
```
$chmod +x 脚本名.sh
```
### 2-1.sh
按照题目要求模拟就行
其中值得注意的是redhat用户需要添加，可以用以下方法
```
useradd username #实现添加用户
userdel username #实现删除用户
```

效果如下：
![Alt text](<image/2023-09-30 16-19-24 的屏幕截图.png>)
其中cp显示*无法创建普通文件*是因为我的pam.d目录下没有文件
### 2-2.sh
同样直接模拟即可
主要命令是*find*,用法是*find [path] [expression]*
可以参考[菜鸟教程的find命令教程](https://www.runoob.com/linux/linux-comm-find.html)
其中还用到了通配符
#### 这有一些通配符介绍
- 星号（*）：星号通配符可以匹配任意数量的字符，包括零个字符。例如，*.txt 可以匹配所有以 .txt 结尾的文件名。
- 问号（?）：问号通配符可以匹配任意单个字符。例如，file?.txt 可以匹配 file1.txt、file2.txt 等文件名。
- 方括号（[]）：方括号通配符可以匹配一组字符中的任意一个字符。例如，- file[123].txt 可以匹配 file1.txt、file2.txt、file3.txt 等文件名。
- 花括号（{}）：花括号通配符可以匹配多个字符串中的任意一个字符串。例如，{file1,file2,file3}.txt 可以匹配 file1.txt、file2.txt、file3.txt 等文件名。
- 反斜杠（\）：反斜杠可以用于转义特殊字符，使其不被解释为通配符。例如，\* 可以匹配星号字符本身，而不是匹配任意数量的字符。

2-2.sh的效果如下：
![Alt text](<image/2023-09-30 16-20-57 的屏幕截图.png>)
### stu.sh
也是按照题目进行模拟的思路
其中比较重要的命令是
[grep](https://www.runoob.com/linux/linux-comm-grep.html)
[sed](https://www.runoob.com/linux/linux-comm-sed.html)
还有shell脚本的判断写法
```
if condition1
then
    command1
elif condition2 
then 
    command2
else
    commandN
fi
```
效果如下：
![Alt text](<image/2023-09-30 16-22-54 的屏幕截图.png>)

## ros部分
### ros的安装
我采用的方法是执行
```
wget http://fishros.com/install -O fishros && sudo ./fishros
```
很方便
原理上来说
就是ubuntu的下载源中没有ros，需要添加ros的源再下载，下载完后写地址进环境变量方便使用
### ros package
主要步骤是从[这个教程](https://www.bilibili.com/video/BV1Ci4y1L7ZZ?p=47&vd_source=d606876bba80b20ad6a93f36ea962c32)学来的，下面我的操作
<!-- 1. 建立工作空间
```
#创建空间目录
$mkdir -p 空间名称/src
$cd 空间名称     
#初始化空间 
$catkin_make
``` 
2. 创建功能包
```
#需要在src下创建
cd src
#创建功能包
catkin_create_pkg 包名 std_msgs rospy message_generation
```
3. -->
总的来说，分为以下几步
1. 创建工作空间
2. 创建功能包
3. 自定义消息类型
*这里需要修改CMake文件，在包里加入自定义消息的信息*
4. 编写发布方框架
思路上来说是
 初始化节点，后创建对象，给对象赋上自定义的值，之后循环发布
 是对着上面的教程照猫画虎的，不懂
 **注意：需要说明编码为UTF-8，不然报错**
5. 订阅方框架
思路上来说是
 初始化节点，后创建对象，让对象去找到发布方发布的话题，之后循环订阅
同样是对着上面的教程照猫画虎的，不懂
**注意：需要说明编码为UTF-8，不然报错**
6. 打开终端验证
**需要启动roscore这个核心**
**每个终端都要刷新环境**
*$source ./devel.setup.bash #刷新环境*
完成后效果如下：
![Alt text](<image/2023-09-30 15-57-40 的屏幕截图.png>)
