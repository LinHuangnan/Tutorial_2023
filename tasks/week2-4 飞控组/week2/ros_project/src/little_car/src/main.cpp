#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include <geometry_msgs/Vector3.h>
#include <std_msgs/String.h>
#include <iostream>
#include <string.h>
using namespace std;

string control_cmd = "straight"; // 控制指令变量
void cmd_callback(const std_msgs::String::ConstPtr& msg)
{  
    control_cmd = msg->data;
    ROS_INFO("Received command");
    if(msg->data == "turn") 
    {
        ROS_INFO("Turning...");
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
    little_car car; // 初始化控制对象小车
    car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
    car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
    ros::Subscriber sub = n.subscribe<std_msgs::String>("control_topic", 10, cmd_callback); // 添加一个Subscriber，从你自己编写的Publisher处订阅指令
   ros::spin();
   return 0;

    ros::Rate loop_rate(60);
    float v = 0.004; // 速度大小
    float yaw = 0.0; // 方向角度
    car.set_noise_level(0); // 设置噪声等级
    while (ros::ok()) {
        if(control_cmd== "turn") {
            ROS_INFO("Turning...");
            yaw += 0.01;
            SVector3 velocity = {v*cos(yaw), v*sin(yaw), 0.0}; // 设置速度向量
            car.set_yaw(yaw); // 修改小车的方向
            car.set_velocity(velocity); // 设置小车速度
        } else {
            SVector3 velocity = {v, 0.0, 0.0};
            car.set_velocity(velocity); // 设置小车速度
        }
        car.update_(); // 小车状态更新
        loop_rate.sleep();
    }
    return 0;
}

