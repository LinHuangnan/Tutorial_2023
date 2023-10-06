### 任务一：完成Service与Client通信

* 首先编写client文件。

  > * 在编写client文件之前，需要自己定义通信之间的变量。故需要新建一个srv文件夹来存放自己定义的变量的属性。具体步骤描述见[参考流程](https://blog.csdn.net/hltt3838/article/details/107633323)
  >
  >   ``` c++
  >   float32 data //这是request
  >   ---
  >   bool result //这是response
  >         
  >   ```
  >
  >   接着开始编写client文件
  >
  >   ```c++
  >   #include "ros/ros.h"
  >   #include "std_msgs/Bool.h"
  >   #include "test1/check.h"
  >   #define N 999
  >     
  >   int main(int argc, char **argv)
  >   {
  >     ros::init(argc, argv, "client_node");
  >     ros::NodeHandle nh;
  >     
  >     ros::ServiceClient client = nh.serviceClient<test1::check>("check_random_number");
  >     
  >     test1::check srv;
  >     
  >     while(ros::ok())
  >     {
  >        srand(time(NULL));
  >        srv.request.data = rand() % (N+1) / (float)(N+1); // 生成0到1之间的随机浮点数
  >        if(client.call(srv))
  >        {
  >   	ROS_INFO("Random number: %f", srv.request.data);
  >           if (srv.response.result)
  >               ROS_INFO("Yes");
  >           else
  >               ROS_INFO("No");
  >        }
  >        else
  >        {
  >   	ROS_ERROR("Failed to call service!");
  >        }
  >     
  >     }
  >     return 0;
  >   }
  >   ```

* 其次就是编写对应的service函数

  > * ```c++
  >   #include "ros/ros.h"
  >   #include "std_msgs/Bool.h"
  >   #include "test1/check.h"
  >     
  >   bool checkRandomNumber(test1::check::Request &req,
  >   test1::check::Response &res)//自己定义的数据类型
  >   {
  >       //会对相应的response赋值来完成要求
  >     if (req.data < 0.5)
  >       res.result = 1;
  >     else
  >       res.result = 0;
  >     ROS_INFO("recieve request: data=%f",(float)req.data);
  >     ROS_INFO("send response: sum=%d",(bool)res.result);
  >     return true; 
  >     
  >   }
  >     
  >   int main(int argc, char **argv)
  >   {
  >     ros::init(argc, argv, "service_node");
  >     ros::NodeHandle nh;
  >     
  >     ros::ServiceServer service = nh.advertiseService("check_random_number", checkRandomNumber);
  >     ROS_INFO("Service ready!");
  >     
  >     ros::spin();
  >     
  >     return 0;
  >   }
  >   
  >   
  >   ```

* 最后就是执行的结果

​	图片结果如下：

​		[图片1](./image/1.png)

​		[图片2](./image/2.png )

​		[图片3](./image/3.png)

​	任务一正常完成。



### 任务二：编写launch文件来启动节点

* 任务流程：在所提供的工作包` ros_project `中进行catkin_make指令之后，在针对小车模型，执行roslaunch指令，启动小车模型。

​	任务二也是顺利完成。（PS：任务二执行成果的图片与任务三一同给出）



### 任务三：搭建小车的urdf模型

* 根据网络上查找的资料[参考资料](https://blog.csdn.net/baoli8425/article/details/117262960?ops_request_misc=%7B%22request%5Fid%22%3A%22169648757016800197038400%22%2C%22scm%22%3A%2220140713.130102334.pc%5Fall.%22%7D&request_id=169648757016800197038400&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_ecpm_v1~rank_v31_ecpm-1-117262960-null-null.142^v94^chatsearchT3_1&utm_term=Ros中创建模型重心离地&spm=1018.2226.3001.4187)，熟悉模拟小车模型需要什么参量来实现对应的要求，具体实现放在所上交代码处。

  最终结果如下图：

  [图片4](./image/4.png)

​	任务三顺利完成（同时也证明任务二中的launch也启动成功过）。



### 任务四（选做）：使用solidworks导出模型

* 该任务并没有完成。



### 任务五：实现通过Pubisher控制小车运动

* 首先，自己在主函数中实现让小车自己转弯（死控制？），最后结果可以让小车自己做圆周运动。

  * 实现代码如下：

    ```c++
    #include "parser.h"
    #include <urdf/model.h>
    #include <string>
    #include <sensor_msgs/JointState.h>
    #include <tf/transform_broadcaster.h>
    #include <geometry_msgs/Point.h>
    #include <ros/ros.h>
    #include <random>
    #include <iomanip>
    
    using namespace std;
    
    int main(int argc, char** argv) {
        ros::init(argc, argv, "state_publisher");
        ros::NodeHandle n;
        little_car car; // 初始化控制对象小车
        car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
        car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
        ros::Rate loop_rate(60);
        float v = 0.004; // 速度大小
        float yaw = 0.0; // 方向角度
        car.set_noise_level(0); // 设置噪声等级
        while (ros::ok()) {
            yaw += 0.01;
            SVector3 velocity = {v*cos(yaw), v*sin(yaw), 0.0}; // 设置速度向量
            car.set_yaw(yaw); // 修改小车的方向
            car.set_velocity(velocity); // 设置小车速度
            car.update_(); // 小车状态更新
            loop_rate.sleep();
        }
        return 0;
    }
    //这串代码中，在方向角度中对小车x和y方向的速度用了正余弦函数实现让小车绕圈运动的要求。（此时并没有加入噪声控制）
    ```

* 其次，创建对应的publisher功能包。并在` main.cpp `中编写对应的订阅者函数。相应的代码在上交的`ros_project`中。

  但是本人没有找到问题最后出在哪里。编译时可以正常编译，但是一旦调用订阅者函数时就会出现如下图的报错，使得订阅者不能及时收到消息故小车路径不会发生改变。

  [图片5](./image/5.jpg)

​	但是过程中publisher函数可以正常发布内容。

​	[图片6](./image/6.png)

​	综上所述，并没有实现利用publisher来控制小车运作的要求，但是完成了对小车转弯的死控制。



### 任务六：让小车走S形（1级噪声）

* 该任务是在小车内部实现，通过自学PID算法，加上网络上的查询实现了让小车按照S形曲线走动的要求。对应的代码实现也在提交的代码中。

* 在测试过程中，对于给定的不同噪声，小车的运动抗干扰能力也会不同，在后续加大噪声时小车有明显的震荡现象。

  

