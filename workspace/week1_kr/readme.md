# Week 1_考核记录

Author：@Kr

## 1. Reverse Linked List

- **设计思路**：设置两个指针，一个为前指针p，另一个为后指针b，后指针为前指针的next。对整个链表进行遍历，在其中，设置一个temp指针对b进行暂时的存储，b移向next，修改temp->next指向p，p再指向temp，这样对一个节点的修改就完成了。*要注意边界条件，开始的时候没注意导致头节点迟迟没被修改*

* **在 gedit 上编写代码** :

  ```class Solution {
  public:
     ListNode* reverseList(ListNode* head) {
  	    ListNode *p, *b;
          p = head;
          b = head->next;
          while(b->next != NULL){
              ListNode *temp = b;
              if(p == head){
                  p->next = NULL;
              }
              b = b->next;
              temp->next = p;
              p = temp;
          }
          return p;
      }
  };

* **使用cmake和makefile进行编译**

  [这是编译的截图](./image/RLLtest.png)

## 2. Linux Shell

* 使用vim创建shell脚本进行编写。上网学习shell教程和文件管理知识。

* [这是task_2_1的执行结果](./image/task_2_1.png)
* [这是task_2_2的执行结果](./image/task_2_2.png)

* task_2_3 没怎么搞明白，未完成。

## 3. ROS通信机制

* **已安装ROS**

  [这是roscore结果](./image/task_3.png)

* **设计项目** ：将话题输出频率调整为100，做出一个秒表
* **创建工作空间与功能包**
* **创建package**：[package创建截图](./image/task_3(2).png)
* **定义话题消息msg**：[msg截图](./image/task_3(3).png)
* **在package.xml中添加功能包依赖，在CMakeLists.txt添加编译选项，编译生成语言相关文件**
* **创建** [Publisher](/image/task3(4).png) ,[Subscriber](/image/task3(5).png)
* **配置CMakeList.txt中的编译规则** [截图](./image/task3(6).png)
* **运行roscore，启动[Time_publisher](./image/task3(7).png)和[Time_subscriber](./image/task3(8).png)** 

