//包含头文件
//编写main函数
#include<iostream>
#include"ListNode.h"
#include"helloword.h"
using namespace std;
int main(){
    //ListNode head;
    ListNode node3(3,NULL);
    ListNode node2(2,&node3);
    ListNode node1(1,&node2);
    ListNode* head=new ListNode(0,&node1);
    Solution s1;
    head=s1.reverseList(head);
    ListNode* tm=head;
    int i=0;
    while(tm!=NULL&&i<4){
      cout<<tm->val<<" ";
      //i++;
      tm=tm->next;
      }      
  hello();
  return 0;
}
