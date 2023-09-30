class Solution {
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

