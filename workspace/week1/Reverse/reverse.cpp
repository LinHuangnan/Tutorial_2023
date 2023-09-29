
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