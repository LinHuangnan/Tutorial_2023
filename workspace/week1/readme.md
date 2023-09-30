# 1.反转链表
## 1.1实现思路
为了实现反转，想到可以有三个变量
1. `pCurr`来表示链表当前节点
2. `pPrev`来表示链表上一个节点
3. `nextNode`来表示链表下一个节点

主要功能是一个反转操作，把当前节点`next`指针指向上一个节点
1. 但是得在反转操作之前把当前节点连接到`nextnode`，以便下一次遍历链表
2. 在反转操作后，要更新`pPrev`的值，把反转之前的当前节点变成下一次的上个节点
3. 在反转操作后，也要更新`pCurr`的值，把反转之前的下个节点变成下一次的当前节点

这样把上述功能包装成一个循环，便有了如下的类
```cpp
class Solution {
    public:
        ListNode* reverseList(ListNode* head) {
            ListNode* pPrev = nullptr;
            //pPrev指针用来保存当前节点的上一个节点

            ListNode* pCurr = head;
            //pCurr指针用来保存当前节点

            while (pCurr != nullptr){
                //使用一个循环来遍历链表

                ListNode* nextNode = pCurr->next;
                //首先通过pCurr把当前节点的下一个节点保存到nextNode中
                //以便在反转后继续遍历链表

                pCurr->next = pPrev;
                //然后，将pcurr的next指针指向pPrev
                //实现将当前节点指向前一个节点的反转操作

                pPrev = pCurr;
                pCurr = nextNode;
                //接着，更新pPrev为当前节点pCurr
                //再将pCurr更新为下一个节点nextNode，以便继续循环遍历链表
            }

            return pPrev;
            //当循环结束时，即遍历完整个链表后，返回反转后的链表的头节点pPrev
        }
};
```

## 1.2编译过程和结果
先粗糙的利用`cmake .`生成`makefile`，再利用`make`编译得到可执行文件`rrl`
![compile.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/rrl_compile.png)
`rrl`是`reserved-linked-list`的缩写
之后发现好像`reversed`才对，但是已经编译了哈哈哈

运行结果如下


# 2.练习使用linux shell
## 2.1脚本思路

### 1.创建目录
创建目录 `/tmp/scripts`
- 目标目录名已知，需要使用`mkdir`命令创建目录

### 2.切换目录
切换工作目录至此目录中
- 需要使用`cd`命令切换工作目录

### 3.复制目录
复制 `/etc/pam.d` 目录至当前目录，并重命名为 `test`
- 利用`cp`命令的特性，一边复制文件夹一边改名

### 4.更改所属用户
将当前目录的 `test` 及其里面的文件和子目录的属主改为 `redhat`
- 该步骤为难点，下面分步解释
1. 首先需要获取`root`权限
>>一般刚刚装好`Ubuntu`系统时，`root`账号密码没有初始化，需要使用`sudo passwd root`设置，进而切换到`root`

2. 需给当前用户设置`sudo command`免密码输入
>>比如可以通过先输入`visudo`，即用`nanno`编辑器打开`/etc/sudoers`，再在里面添加一行
```shell
yuanyue ALL=(ALL)       NOPASSWD: ALL
```
>>在`visudo`内配置如上内容，可以让`yuanyue`用户，无需密码直接使用`sudo`

3. 之后可以用`root`权限执行`sudo useradd redhat`指令来添加`redhat`用户

4. 并同样使用`sudo chown -r`指令来改变文件所属，其中`-r`表示全选文件夹内的子目录和子文件

### 5.更改其他用户权限
将 `test` 及其子目录中的文件的其它用户的权限改为没有任何权限
- 需要使用`root`权限进行操作，所以使用`sudo chmod -r`指令，`-R`的作用同上，而`o`则代表`others`，即其他用户，`-r-w-x`则是`减去`其他用户`read\write\execution`的权限
### 6.脚本优化与结果
最后为了标记脚本运行状态
在每一步后面加上`echo`指令进行提示

![script2.1.png.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/script2.1.png)
![script2.1result.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/script2.1.result.png)

### 7.总结
完成了基本的任务要求
但还缺少将最后的输出通过管道过滤，使输出结果更易于理解
## 2.2脚本思路
### 1.显示日期
显示当前系统日期和时间，而后创建目录 `/tmp/lstest`
- 需要使用`date`指令，并携带`"+%Y-%m-%d %H-%M"`参数，其中，`%Y`等占位符可以看见C语言的影子

### 2.切换目录并创建相关文件
**切换工作目录至 `/tmp/lstest`**
- 使用`cd`指令

**创建目录 `a1d`，`b56e`，`6test`**
- 使用`mkdir`指令加三个参数

**创建空文件 `xy`，`x2y`，`732`**
- 使用`touch`指令加三个参数

### 3.利用正则表达式来匹配
**列出当前目录下以 `a`，`x` 或者 `6` 开头的文件或目录**
- 关键是使用正则表达式，例如以`a`开头可以表示为`^a.`
- 并且使用`grep -E `选项来匹配，或者使用`egrep`
- 最后利用管道符`|`将`ls`获取的文件内容输入到`grep`里


**列出当前目录下以字母开头，后跟一个任意数字，而后跟任意长度字符的文件或目录**
- 关键是使用正则表达式来描述需求，此处应是`[a-zA-Z][0-9].`
- 剩余步骤同上
### 4.脚本优化与结果
最后为了标记脚本运行状态
在每一步后面加上`echo`指令进行提示

并考虑到该脚本输出内容过多
于是使用`-----`来进行分割

![script2.2.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/script2.2.png)

## 2.3stu.sh思路

### 1.从简单情况入手
当只输入 `stu.sh` 时，要列出所有记录内容
那么一定需要一条`cat`指令

### 2.处理选项的传入
通过分析命令格式，可以知道选项
1. 一定是第一个实参，那么使用`$1`来代指
2. 都是字符串`-x`的形式
3. 只有`4`种可能的分支情况，分别是`-a|-d|-s|`和无（`""`）

那么经过分析，使用`case`判断语句最为适合
原因如下：
1. 可以通过传入参数的**不同值**来进行条件判断，比`if`直接
2. 刚好传入的选项值可能情况有限，实际可行

于是便有了主体框架
```bash
case $1 in
    -a)
        # code
    ;;
    
    -d)
         # code
    ;;
    
    -s)
         # code
    ;;

    "")
        cat ./stu.txt
        # 用来对应只输入stu.sh的简单情况
    ;;

    *)
         # code
    ;;
esac
```
### 3.进一步看题目要求
观察带选项的三个要求
当第二个参数被传入时，我们都需要通过这个参数
1. 判断是否有对应的学生信息
2. 并且根据`是`或者`否`的分支情况进一步处理

所以我们可以编写一个可复用的基本函数，来实现上述逻辑功能
这样，通过后续各自修改基本函数，就可以实现对应功能

于是便有了
```bash
function judge(){
    result=$(grep -E "^$1" ./stu.txt)
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果
    
    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1
    
    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        # code
    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        # code
    fi  
}
```


### 4.分情况调整
#### 对于`-a`选项
1. 脚本的第二个参数就是函数的第一个参数，应该用`$1`代指
2. 脚本的第二个参数应该是完整学生信息，则可以确定对应正则表达式`^"$1$"`
3. 写入文件可以通过`echo "$result"`加`>>`来进行添加

于是便有
```bash
function judgeA(){
    result=$(grep -E "^$1$" ./stu.txt)
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果
    
    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1
    
    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        echo "This guy doesn't exist"
        echo "$1" >> stu.txt
        echo "I have helped u append this guy"
        
    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        echo "This guy has been registered"
        echo "See..."
        echo "$result"
    fi  
}
```


#### 对于`-s`选项
对于脚本的第二个参数
1. 是一串数字，在第一位作为序号
2. 并以`:`与其他部分隔
3. 唯一对应学生信息
——可以确定正则表达式`"^$1:"`

对于其匹配的分支情况
只需使用`echo`进行提示即可

于是便有
```bash
function judgeS(){
    result=$(grep -E "^$1:" ./stu.txt)
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果

    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1

    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        echo "Wrong！"
        echo "This guy missed in the forest"
        echo "(The id u enter is wrong)" # 补充提示，确定告诉用户查无此人

    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        echo "This guy has been registered"
        echo "See..."
        echo "$result"
    fi  
}
```
#### 对于`-d`选项
对于第二个参数，其处理方法与`-s`方法相同

关键在于如何在文件中删除对应的学生信息
2. 使用`sed`删除特定的文件内容一般需要知道行数，不便于处理
3. 于是使用`grep`命令的选项`-v`取反，存储一份无学生信息的副本
4. 并把该副本覆盖给原件，实现任意内容的删除


——调试后发现
1. 观察文件结果，发现每一个学生信息之间有空行
2. 为了避免覆盖时丢失换行符，在`echo`时应该给变量带上`""`
3. 以免删除操作后使文本成为不换行的一串文字，使下一次操作混乱

于是便有
```bash
function judgeD(){
    result=$(grep -E "^$1:" ./stu.txt)
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果

    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1

    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        echo "Wrong!"
        echo "U can't delete a guy who doesn't exist"

    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        stu_sub=$(grep -E -v "^$1:" ./stu.txt)
        # 保存一份无该学生信息的副本

        echo "I will help u remove this guy,are u sure???"
        echo "$result"
        # 显示该学生信息作为提示，并提出确认

        read -p "please enter y/yes or n/no to confirm  :" decision
        # 使用read命令读取终端输入

        if [ $decision == "y" ] || [ $decision == "yes" ]
        then
            echo "$stu_sub" > stu.txt
            echo "Well,this world is finally quiet "
            echo "(This guy's message has been wiped)"
            # 利用覆盖实现删除

  

        elif [ $decision == "n" ] || [ $decision == "no" ]
        then
            echo "Well,this guy is alive"
            echo "(This guy's message hasn't been wiped)"
        fi
    fi  
}

```
### 5. 写帮助文档
参照了`powershell`帮助系统的文件
进行了本土化翻译，告诉用户相关说明，并给出例子

### 6.脚本优化和结果
![stu1.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/stu1.png)

`-a` 选项
![stu2.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/stu2.png)
![stu3.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/stu3.png)

`-s`选项
![stu4.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/Stu4.png)
`-d`选项
![stu5](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/stu5.png)




# 3.练习使用ROS1
## 3.1安装ROS1
重装ubuntu系统，版本从22.04改为18.04
参考教程安装ROS1后，顺便安装了Linux GUI驱动
利用ROS1自带的小海龟验证ROS1的正常运行

以下是运行截图
![roscore.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/roscore.png)
![rosturtle.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/ros_test.png)



## 3.2研究ROS1通信机制
### 3.2.1环境搭建
跟着教程创建了一个工作空间`catkin_ws`，创建了功能包`package`
并安装了它的`depends`，并`bulid`成功。下图是功能包的文件目录
![package_tree.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/package_tree.png)

1.创建在功能包目录下创建`msg`目录，并创建自己的消息类型
![package_msg.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/package_msg.png)

2.编辑`package.xml`文件
- 添加`<build_depend>` 和`<exec_depend>`开头的依赖

3.修改`CMakeList.txt`文件
- 添加自定义消息相关字段
- 并提前添加要创建的发布者及订阅者节点相关字段
### 3.2.2编辑`Punlisher`文件
导入ROS和随机数相关头文件
```cpp
#include <ros/ros.h>
#include "package/Yuanyue.h"
//导入ROS相关头文件

#include <iostream>
#include <ctime>
#include <cstdlib>
//导入生成随机数相关文件
```

写出生成随机数的函数
```cpp
int getRand(int min, int max) {
    return ( rand() % (max - min + 1) ) + min ;
}
//定义生存随机数的函数
```

配置`Publisher`主体
```cpp
//配置Publisher
int main(int argc, char **argv)
{
    ros::init(argc, argv, "Publisher");   //初始化节点

    ros::NodeHandle nh;  //节点句柄初始化

    ros::Publisher pub = nh.advertise<package::Yuanyue>("Yuanyue", 100);  //发布叫"Yuanyue"的话题，缓存设置100

    ros::Rate loop_rate(1); //设置发布频率为1Hz

    while (ros::ok())  //判定ROS是否准备就绪
    {
        package::Yuanyue yy;  //实例化yy对象
        yy.age = 18;  //给对象的属性赋值
        yy.number = getRand(1,100);

        pub.publish(yy);

        ROS_INFO("Sending:Yuanyue's age:%d ;RandomNum:%d", yy.age, yy.number);


        loop_rate.sleep(); //按照频率延时
    }
    return 0;
}
```


### 3.2.3 编辑`Subscriber`文件
该文件编写逻辑相对较清晰
```cpp
#include <ros/ros.h>
#include "package/Yuanyue.h"

//创建回调函数
void yuanyueCallback(const package::Yuanyue::ConstPtr& msg)
{
    ROS_INFO("Receieve: Yuanyue's age:%d  Randnumber:%d", msg->age, msg->number);  //提示收到消息
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "Subscriber");  //初始化Subscriber

    ros::NodeHandle nh; //节点句柄初始化

    ros::Subscriber sub = nh.subscribe("Yuanyue", 100, yuanyueCallback); //订阅"role_details"话题

    // 循环等待回调函数
    ros::spin();

    return 0;
}
```

### 3.2.4 总结运行结果
经过几次编译失败，`debug`，运行结果如下

`Punlisher`文件
![pub.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/ros_result1.png)

`Subscriber`文件
![sub.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/ros_result2.png)

合起来
![again.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week1/week1_asset/ros_result3.png)

不足之处：
出现第一条消息漏接情况
经过查阅资料发现，此时消息发布时
`ros::Publisher pub` 还没有完成注册，导致发布的数据无法订阅

解决：
可以在`ros::Publisher pub = nh.advertise<package::Yuanyue>(“Publisher”,100)`
后加一个延时，保证`pub`注册成功
