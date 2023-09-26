/**
      * Definition for singly-linked list.
      * struct ListNode {
      *     int val;
      *     ListNode *next;
      *     ListNode() : val(0), next(nullptr) {}
      *     ListNode(int x) : val(x), next(nullptr) {}
      *     ListNode(int x, ListNode *next) : val(x), next(next) {}
      * };
      */
      class Solution {
      public:
         ListNode* reverseList(ListNode* head) {
            listNode* now = head, *last = nullptr;
            while(now != nullptr){
                ListNode* i = now->next;
                now->next = last;
                last = now;
                now =  i;
            }
            return last;
         }

      };