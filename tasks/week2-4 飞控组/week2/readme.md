## 基础考核 - 第二周

Author：@GuanYufeng

Revice：@LinHuangnan

| 版本 | 说明 |时间|备注|
| ---- | ---- | ---- |----|
| v1.0.0 | 第二周基础考核 |2023.9.26| @GuanYufeng |
| v1.0.1 | 内容微调 | 2023.9.27 | @LinHuangnan |

### 学习内容：
1. 熟悉 ROS 的基本操作，包括文件架构、通信机制 (`Publisher`, `Subscriber`, `Service`, `Client`, `msgs`)、包的创建、节点、服务器等。
2. 熟悉`roslaunch`的基本使用，进一步了解如何将机器人模型在`.launch`文件中加载到参数服务器上。
3. 熟悉`urdf`模型构造，进一步了解如何将`urdf`载入至`rviz`仿真器。
4. 熟悉ROS TF包、了解如何在RVIZ中模拟机器人模型的运动。参考资料：[ROS TF包 官方文档 tf/Tutorials - ROS Wiki](http://wiki.ros.org/tf/Tutorials)，建议阅读一遍官方文档中的`Learning TF`，以把握基本概念。
5. (附加)学习使用`solidworks`绘制小车模型并导出`urdf`文件。

### 本周任务：

1. 编写 `Service` 和 `Client`，`Client` 产生一个 0 到 1 内的随机浮点数，然后发给 `Service`，`Service` 接受到请求后，判断随机数是否小于 0.5，若是则回应布尔值 1，否则回应 0。`Client` 接收到回应后，先输出产生的随机数，然后输出 `Yes` 或 `No` 到终端。
2. 利用提供的小车模型和源码，**补全小车模型(ros_project/src/little_car/urdf内)，模仿源码(ros_project/src/little_car/src)并在源码的基础上修改控制代码，试着实现小车的转弯、停止，并使用 `Publisher` 来发布指令来控制小车的方向和速度**。详细要求请见 [任务说明](./task2_description.md)
3. 让小车走一个 S 形（注意，我们在小车的行走中将加上噪声，你可能需要使用到PID控制）
4. 编写 ROS launch 文件并用 `roslaunch` 启动节点。
5. 提交时请使用 `.gitignore` 忽略追踪中间文件（`build/`、`devel/`等）。

### **评分标准**：

| 评分项                                         | 积分值 |
| ---------------------------------------------- | ------ |
| 完成Service与Client通信           | 50分  |
| 编写launch文件来启动节点      | 50分 |
| 搭建小车的urdf模型             | 50分 |
| 使用solidworks导出模型(选做)  |  50   |
| 实现通过Publisher控制小车运动 | 50分 |
| 让小车走S形（1级噪声）         | 100分 |

### **怎么运行所提供的小车程序？**

```shell
$ cd ros_project  # 请先确保工程在catkin workspace下
$ catkin_make  
$ source devel/setup.bash
$ roslaunch launch/little_car.launch
```
### **如何学习urdf搭建模型**

[ros关于urdf的官方教程](http://wiki.ros.org/cn/urdf)


### **Tips:**

1. 本次任务所需知识基本在doc文件夹内， ROS wiki 以及使用搜索引擎将有助于你解决大部分问题。
2. 对于源码有疑问，可以在群里发问，我们会在合适的范围内给予解答。
