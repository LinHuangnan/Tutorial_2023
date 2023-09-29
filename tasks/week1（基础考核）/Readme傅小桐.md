# Readme

## 1、reverse linked list

```c++
#include <iostream>
using namespace std;
struct ListNode {
    int val;
    ListNode* next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode* next) : val(x), next(next) {}
};

class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* prev = nullptr;
        ListNode* current = head;
        ListNode* next = nullptr;

        while (current != nullptr) {
            next = current->next;
            current->next = prev;
            prev = current;
            current = next;
        }

        return prev;
    }
};

int main() {
    ListNode* head = new ListNode(1);
    head->next = new ListNode(2);
    head->next->next = new ListNode(3);
    head->next->next->next = new ListNode(4);
    head->next->next->next->next = new ListNode(5);
    Solution s;
    ListNode* reversedHead = s.reverseList(head);
    while (reversedHead != nullptr) {
        cout << reversedHead->val << " -> ";
        reversedHead = reversedHead->next;
    }
    cout << "nullptr" << endl;

    return 0;
}

```

```cmake
cmake_minimum_required(VERSION 3.0)
project(ReverseLinkedList)

set(CMAKE_CXX_STANDARD 11)

add_executable(reverse_linked_list reverse_linked_list.cpp)

```

```makefile
all: build

build:
    cmake -Bbuild -H.
    cmake --build build

clean:
    rm -rf build

```

```bash
make
./build/reverse_linked_list
```



## 2、Linux shell

### 2.1 写一个脚本

- 创建目录

  ```shell
  if[! -d "/tmp/scripts"]; then
  mkdir -p"/tmp/scripts"
  fi
  ```

- 切换到该目录下

  ```shell
  cd "/tmp/scripts"
  ```


- 复制 `/etc/pam.d` 目录至当前目录，并重命名为 `test`。

  ```shell
  cp -R "/etc/pam.d" test
  ```

- 将当前目录的 `test` 及其里面的文件和子目录的属主改为 `redhat`。

  ```shell
  sudo useradd "redhat"
  sudo chown redhat ./test
  ```

- 将 `test` 及其子目录中的文件的其它用户的权限改为没有任何权限。

  ```shell
  sudo chmod -R o= ./test
  ```



### 2.2 写一个脚本

- ![image-20230929003942624](C:\Users\lenovo\AppData\Roaming\Typora\typora-user-images\image-20230929003942624.png)

### 2.3 



## 3.ROS通信机制

