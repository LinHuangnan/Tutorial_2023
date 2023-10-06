# 完成的部分
## 1.服务通信任务
进行了服务通信的学习记录，总结了编写流程，参见[[服务通信总结]]

并成功编写了`Client.cpp`和`Server.cpp`源文件，见`week2_code/service_pkg/src`

以下是运行结果截图
![[服务通信运行截图.png]]

## 2.使用launch来启动节点
编写了一个小海龟启动节点来运行，参见`week2_code/service_pkg/launch`
![[launch文件例子.png]]
## 3.补全了小车的urdf模型
参见`week2_code/ros_project/little_car/urdf`
![[小车模型.png]]


# 未完成的部分与目前进度

## 4.本来打算在完成5和6后才完成
## 5.编写完publisher与subscriber，但控制效果不理想
能够实现publisher和subscriber的通信，但是在odom下显示为白色模型，在base_link下看不出来
代码见`/week2_code/ros_project/little_car/src/`

![[目前进度1.png]]

而且虽然发现可以改变yaw值使小车转动，但是在odom下观察，改变S3vector类型的velocity的值是改变绝对坐标系的，不是改变相对于小车自己坐标系的
于是出现一边平移一边旋转的情况

是不是通过设定小车相对绝对坐标系的速度，来转换成小车相对小车自己坐标系的速度，
比如通过某种操作设定好绝对速度，希望让小车无论怎么转弯都是相对自己坐标系x轴方向0.01m/s
感觉好怪异，为什么Svector3给出的不是相对自己本身坐标系的速度

目前还没有熟悉TF包，不知道是不是要使用坐标变换，希望下次任务说明可以更加详尽一些QAQ

## 6. 需要在5的基础上解决