#include <ros/ros.h>
#include "package/Yuanyue.h"
//导入ROS相关头文件

#include <iostream>
#include <ctime>
#include <cstdlib>
//导入生成随机数相关文件


int getRand(int min, int max) {
    return ( rand() % (max - min + 1) ) + min ;
}
//定义生存随机数的函数


//配置Publisher
int main(int argc, char **argv)
{
    ros::init(argc, argv, "Publisher");   //初始化节点
 
    ros::NodeHandle nh;  //节点句柄初始化
 
    ros::Publisher pub = nh.advertise<package::Yuanyue>("Yuanyue", 100);  //发布叫"Yuanyue"的话题，缓存设置100
 
    ros::Rate loop_rate(1); //设置发布频率为1Hz
 
    while (ros::ok())  //判定ROS是否准备就绪
    {
        package::Yuanyue yy;  //实例化yy对象
        yy.age = 18;  //给对象的属性赋值
	yy.number = getRand(1,100);
 
        pub.publish(yy);
 
        ROS_INFO("Sending:Yuanyue's age:%d ;RandomNum:%d", yy.age, yy.number);
 
        
        loop_rate.sleep(); //按照频率延时
    }
    return 0;
}
