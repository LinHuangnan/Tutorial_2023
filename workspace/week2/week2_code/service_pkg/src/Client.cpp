#include "ros/ros.h"
#include "test_pkg/num.h"
#include <bits/stdc++.h>
#define N  99 //设置精度为小数点后面2位
//1.引入头文件

float randFloat(){
    float random;
	srand(time(NULL));//设置随机数种子，使每次产生的随机序列不同
	random = rand() % (N + 1) / (float)(N + 1);
	
    return random;
}

int main(int argc, char  *argv[])
{   
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"Client_Node");
    //2.初始化ros节点

    ros::NodeHandle nh;
    //3.创建ros句柄

    ros::ServiceClient client = nh.serviceClient<test_pkg::num>("judge");
    //4.创建客户端对象

    test_pkg::num srvObj;
    //创建srv服务对象

    srvObj.request.num1 = randFloat();
    //将随机数传送到srv服务对象的请求对象中

    bool flag = client.call(srvObj);
    //利用客户端将srv服务对象发送给服务器端

    ROS_INFO("客户端已成功发送");

    if (flag){
        ROS_INFO("服务器响应成功");
        ROS_INFO("产生的随机数是%f",srvObj.request.num1);
        if (srvObj.response.num2 == 1){
            ROS_INFO("Yes");
        }else{
            ROS_INFO("No");
        }
        
        
    }else{
        ROS_INFO("服务器响应失败");
    }

    return 0;
}

