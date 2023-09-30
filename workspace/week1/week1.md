# Week1
## 1. Reverse Linked List
##### -描述：程序的输入为某一个链表（该链表为单链表）的头节点 head ，请你用C++实现一个类，完成该链表的反转，并返回反转后的链表。
代码如下
```cpp
#include<iostream>

using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};
class solution {
    public:
        static ListNode *reverseList(ListNode *head) {
		if (head == nullptr) return nullptr;
		ListNode * pre = nullptr;
		ListNode *cur = head;
		while (cur) {
			ListNode *t = cur->next;
			cur->next = pre;
			pre = cur;
			cur = t;
		}
		return pre;
	}
};

int main() {
    int i;
    ListNode *head = new ListNode(0);
    ListNode *p = head;
    for (i = 0; i < 5; ++i) {
		int x;
		cin >> x;
		p->next = new ListNode(x);
		p = p->next;
	}
	head = head->next;

	ListNode *q = solution::reverseList(head);
	while (q) {
		if (q->next == nullptr) cout << q->val;
		else cout << q-val << "->";
		q = q->next;
	}
}

```

![makefile方法]("C:\Users\Young\Desktop\week1\image\22b436a74f71957984b876f7e12d8ed.png")


![cmake方法]("C:\Users\Young\Desktop\week1\image\49cbf319b18358ce1cc247f52d5a01d.jpg")

#### **cmake是一种跨平台编译工具，比makefile更加高级**

## 2.Linux Shell
##### 2.1
-   创建目录  `/tmp/scripts`。
-   切换工作目录至此目录中。
-   复制  `/etc/pam.d`  目录至当前目录，并重命名为  `test`。
-   将当前目录的  `test`  及其里面的文件和子目录的属主改为  `redhat`。
-   将  `test`  及其子目录中的文件的其它用户的权限改为没有任何权限。

![2.1 终端显示]("C:\Users\Young\Desktop\week1\image\2.1.png")


##### 2.2
-   显示当前系统日期和时间，而后创建目录  `/tmp/lstest`。
-   切换工作目录至  `/tmp/lstest`。
-   创建目录  `a1d`，`b56e`，`6test`。
-   创建空文件  `xy`，`x2y`，`732`。
-   列出当前目录下以  `a`，`x`  或者  `6`  开头的文件或目录。
-   列出当前目录下以字母开头，后跟一个任意数字，而后跟任意长度字符的文件或目录。

![2.2终端显示]("C:\Users\Young\Desktop\week1\image\5f420e27a5c241db8935a442b6b6c39.png")

![文件夹过程]("C:\Users\Young\Desktop\week1\image\27d7f5c7cd824a0a571a812f635fe51.png")


##### 2.3 未完成

## 3.ROS通信机制

##### 安装ROS
- 在系统中运行小海龟程序，证明已安装ROS

![小海龟]("C:\Users\Young\Desktop\week1\image\6b54459f730066b5cd1cab803144fb6.png")

- 编写一个 package，其中包含一个信息发布节点 `Publisher`，和一个信息订阅节点 `Subscriber`。信息发布节点产生随机数据并发布，要求使用自己创建的自定义消息类型，信息订阅节点订阅话题并将数据输出到终端。
### Publisher
```cpp
  #include "ros/ros.h"
  #include "std_msgs/String.h"
  #include <sstream>
   

int main(int argc, char **argv)
{
     ros::init(argc, argv, "talker");
     ros::NodeHandle n;
     ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
     ros::Rate loop_rate(10);
     int count = 0;
     while (ros::ok())
     {
         std_msgs::String msg;
         std::stringstream ss;
         ss << "hello world " << count;
         msg.data = ss.str();
 
        ROS_INFO("%s", msg.data.c_str());
        
        chatter_pub.publish(msg);
        ros::spinOnce();
        loop_rate.sleep();
        ++count;
     }
return 0;
}
```

### Subscriber
```cpp
#include "ros/ros.h"
#include "std_msgs/String.h"

 
void chatterCallback(const std_msgs::String::ConstPtr& msg) {
ROS_INFO("I heard: [%s]", msg->data.c_str());
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "listener");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("chatter", 1000,chatterCallback);
    ros::spin();

return 0;
}
```

### CMakeLists.txt

```cpp
   1 cmake_minimum_required(VERSION 3.0)
   2 project(beginner_tutorials)
   3 
   4 ## Find catkin and any catkin packages
   5 find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs genmsg)
   6 
   7 ## Declare ROS messages and services
   8 add_message_files(FILES Num.msg)
   9 add_service_files(FILES AddTwoInts.srv)
  10 
  11 ## Generate added messages and services
  12 generate_messages(DEPENDENCIES std_msgs)
  13 
  14 ## Declare a catkin package
  15 catkin_package()
  16 
  17 ## Build talker and listener
  18 include_directories(include ${catkin_INCLUDE_DIRS})
  19 
  20 add_executable(talker src/talker.cpp)
  21 target_link_libraries(talker ${catkin_LIBRARIES})
  22 add_dependencies(talker beginner_tutorials_generate_messages_cpp)
  23 
  24 add_executable(listener src/listener.cpp)
  25 target_link_libraries(listener ${catkin_LIBRARIES})
  26 add_dependencies(listener beginner_tutorials_generate_messages_cpp)
```


#####    由于第一周的操作不熟悉与假期返乡的耽搁，并没有如期完成所有的任务。不过第一周的考核仍让我收获许多，Linux操作系统，ROS的下载安装和使用，Linux Shell脚本的学习，还有cmake与makefile的联系区别和使用，都是我未涉及过的陌生领域。

##### 相信在第二周的考核和学习中我能够更加适应，及时补上第一周剩下的内容，争取全部完成第二周内容。

##### 最后祝学长学姐双节快乐，辛苦了
