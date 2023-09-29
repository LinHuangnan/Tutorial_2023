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

* 已安装ROS 

  [这是roscore结果](./image/task_3.png)

* 后续内容暂时未完成。

