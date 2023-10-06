## 基础考核 - 第三周

Author：@LinHuangnan

Revice：@LinHuangnan

| 版本 | 说明 |时间|备注|
| ---- | ---- | ---- |----|
| v1.0.0 | 第三周基础考核 |2023.10.6| @LinHuangnan |
| v1.0.1 | 内容微调 | 2023.10.6 | @LinHuangnan |

### 学习内容：
1. 熟悉 ROS 的基本操作，包括文件架构、通信机制 (`Publisher`, `Subscriber`, `Service`, `Client`, `msgs`)、包的创建、节点、服务器等。
2. 熟悉`roslaunch`的基本使用。
3. 掌握A*搜索算法，Jump Point Search(JPS)算法。


### 本周任务：
1. 利用提供的ros_workspace源码,实现A*搜索算法，提交完整可编译运行的程序功能包grid_path_searcher。
2. 提供完整的算法流程、运行结果。
3. 对比不同启发式函数（Manhattan、Euclidean、Diagonal Heuristic）对A*运行效率的影响。
    - 对比是否加入Tie Breaker对A*运行效率的影响；
    - 如果完成了JPS，最好附上A*和JPS算法效率的分析（何种情况下A*更优、何种情况下JPS更优？）
4. 提交时请使用 `.gitignore` 忽略追踪中间文件（`build/`、`devel/`等）。
5. （附加） 在完成以上任务的基础上，仿照void AstarPathFinder::AstarGraphSearch(...)的写法，补全src/grid_path_searcheer/src/readonly/JPS_searcher.cpp下的void JPSPathFinder::JPSGraphSearch(...)，由于JPS和Astar仅在扩展节点时有区别，所以只需要仔细对照，并结合已经写好的void JPSPathFinder::JPSGetSucc (...)；完成JPS难度不大。

##### Tips（**A*搜索算法实现流程**）
完成 src/grid_path_searcheer/src/Astar_searcher.cpp 下的,请仔细阅读代码注释，按照STEP1-STEP8的提示逐步完成。

`void AstarPathFinder::AstarGetSucc(...);`

`double AstarPathFinder::getHeu(...);`

`void AstarPathFinder::AstarGraphSearch(...);`

`vector<Vector3d> AstarPathFinder::getPath(...);`

### **评分标准**：

| 评分项                                         | 积分值 | 备注 |
| ---------------------------------------------- | ------ | ------ |
| 成功部署整个ros_workspace     | 10分  | roslaunch启动节点可看见点云地图  |
| 实现A*搜索算法（STEP1-STEP8） | 100分 |每个STEP 10分，全部完成得100分  |
| 完成了JPS算法(选做)  |  100分   |  无 |           
| 对比不同启发式函数对A*运行效率的影响 | 20分 | 无 |
| 完成了JPS，附上A*和JPS算法效率的分析（选做）     | 20分 | 无 |
| 对比是否加入Tie Breaker对A*运行效率的影响     | 20分 | 无 |
| 提供完整的算法流程、运行结果     | 30分 | 无 |

### **怎么运行所提供的程序？**

```shell
$ cd ros_workspace  # 请先确保工程在catkin workspace下
$ catkin_make  
$ source devel/setup.bash
$ roslaunch grid_path_search demo.launch
```
### **环境配置**
环境配置详情请见 [环境配置](./environment_setup.md)

### **Tips:**

1. 本次任务用到的Jump Point Search(JPS)算法和A*搜索算法是无人机路径规划(planning)的经典算法。
2. 对于源码有疑问，可以在群里发问，我们会在合适的范围内给予解答。
