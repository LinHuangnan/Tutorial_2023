#include <iostream>
using namespace std;
struct ListNode
{
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution
{
public:
    ListNode *reverseList(ListNode *head)
    {
        ListNode *prePtr = nullptr;
        ListNode *curPtr = head;
        ListNode *nextPtr = nullptr;
        while (curPtr != nullptr)
        {
            nextPtr = curPtr->next;
            curPtr->next = prePtr;
            prePtr = curPtr;
            curPtr = nextPtr;
        }
        return prePtr;
    }
};

void printList(ListNode *head)
{
    ListNode *current = head;
    while (current->next != nullptr)
    {
        cout << current->val << " -> ";
        current = current->next;
    }
    cout << current->val << endl;
}

int main()
{
    ListNode *head = new ListNode(1);
    head->next = new ListNode(2);
    head->next->next = new ListNode(3);
    head->next->next->next = new ListNode(4);
    head->next->next->next->next = new ListNode(5);
    cout << "Initial list: ";
    printList(head);

    Solution solution;
    ListNode *reversed_head = solution.reverseList(head);

    cout << "Reversed list: ";
    printList(reversed_head);

    return 0;
}
