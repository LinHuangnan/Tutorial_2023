# 完成的部分
## 1.服务通信任务
进行了服务通信的学习记录，总结了编写流程，参见`week2/week2_code/服务通信总结`

并成功编写了`Client.cpp`和`Server.cpp`源文件，见`week2_code/service_pkg/src`

以下是运行结果截图
[服务通信运行截图.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week2/week2_asset/%E6%9C%8D%E5%8A%A1%E9%80%9A%E4%BF%A1%E8%BF%90%E8%A1%8C%E6%88%AA%E5%9B%BE.png)

## 2.使用launch来启动节点
编写了一个小海龟启动节点来运行，参见`week2_code/service_pkg/launch`
[launch文件例子.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week2/week2_asset/launch%E6%96%87%E4%BB%B6%E4%BE%8B%E5%AD%90.png)
## 3.补全了小车的urdf模型
参见`week2_code/ros_project/little_car/urdf`
[小车模型.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week2/week2_asset/%E5%B0%8F%E8%BD%A6%E6%A8%A1%E5%9E%8B.png)

## 5.利用publisher实现小车转弯
经过测试发现，虽然可以改变yaw值使小车转动，但是在odom下观察，改变`S3vector`类型的`velocity`的值是改变绝对坐标系的，不是改变相对于小车自己坐标系的
于是出现一边平移一边旋转的情况

为了实现像`geometry_msgs/Twist`类型的线速度，速度方向是小车自己x轴方向发效果
我的解决方案如下：
1. 通过发布的话题`/tf`，在另外一个功能包的`sub_angular`里面编写一个订阅者，获取小车自己坐标系x轴和绝对坐标系x轴的欧拉角四元数数值
2. 然后在`sub_angular`转换成小车自己坐标系x轴和绝对坐标系x轴的夹角
3. 接着在`sub_angular`将其分别转换成三角函数的形式，得到从绝对坐标系转换成小车坐标系x轴和y轴两个方向的权重
4. 再在`sub_angular`编写一个发布者，将权重信息发布给`main.cpp`的节点
5. 在`main.cpp`里面把权重信息添加给`S3vector`类型的`velocity`的值

协调两个节点的发布频率，并将`sub_angular`添加一点休眠时间，用`roslaunch`同时去启动

利用`yaw`持续缓慢增加，导致小车x轴和绝对坐标轴的夹角持续缓慢增加，而提高速度比重，实现转弯
[利用publisher实现转弯.mp4](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week2/week2_asset/%E5%88%A9%E7%94%A8publisher%E5%AE%9E%E7%8E%B0%E8%BD%AC%E5%BC%AF.mp4)
不足之处，由于响应需要一定时间，速度方向的调整有一定的延迟，但轨迹还是可以转弯
## 6.在1级噪声下实现小车S形转弯
其中，利用`yaw`持续增加，导致小车x轴和绝对坐标轴的夹角持续增加
而该夹角的三角函数值是周期变化的，实现小车的S形转弯

[无噪声s形状转弯.mp4](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week2/week2_asset/%E6%97%A0%E5%99%AA%E5%A3%B0s%E5%BD%A2%E7%8A%B6%E8%BD%AC%E5%BC%AF.mp4)

[1级噪声s形状转弯.mp4](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week2/week2_asset/1%E7%BA%A7%E5%99%AA%E5%A3%B0s%E5%BD%A2%E7%8A%B6%E8%BD%AC%E5%BC%AF.mp4)

不足之处，由于响应需要一定时间，速度方向的调整有一定的延迟，但轨迹还是可以转弯


# 未完成的部分与目前进度

## 4.已经在学习soliddworks  (QAQ)


