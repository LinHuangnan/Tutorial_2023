#include <iostream>

//下面是链表的定义
struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};
      

//下面是解决方法的类
class Solution {
    public:
        ListNode* reverseList(ListNode* head) {
            ListNode* pPrev = nullptr;
            //pPrev指针用来保存当前节点的前一个节点
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

int main() {
    // 这里在创建链表的实例
    ListNode* head = new ListNode(1); // 创建链表的头节点
    ListNode* second = new ListNode(2);
    ListNode* third = new ListNode(3);
    ListNode* fourth = new ListNode(4);
    ListNode* fifth = new ListNode(5);

    // 这里在构建链表关系
    head->next = second;
    second->next = third;
    third->next = fourth;
    fourth->next = fifth;

    // 创建Solution类的实例
    Solution solution;

    //开始调用函数来反转链表
    ListNode* reversedHead = solution.reverseList(head);

    // 遍历反转后的链表并输出值
    ListNode* current = reversedHead;
    while (current != nullptr) {
        std::cout << current->val << " ";
        current = current->next;
    }
    std::cout << std::endl;

    return 0;
}
