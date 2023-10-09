#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include <geometry_msgs/Quaternion.h>
#include <tf2_msgs/TFMessage.h>
#include <tf/transform_datatypes.h>
#include <cmath>
#include <pub_cmd/Double.h>


using namespace std;

SVector3 velocity={0,0,0};  //绝对速度向量
double v = 0.01 ;//设置速度大小绝对值

void doV(const pub_cmd::Double::ConstPtr& fmsg){
	velocity.x = (fmsg->cos)*v;
	velocity.y = (fmsg->sin)*v;
	
}




int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle nh;
	little_car car;//初始化控制对象  小车
    car.joint_pub = nh.advertise<sensor_msgs::JointState>("joint_states", 1);
	car.pos_pub = nh.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
	/* 
	 *请添加一个Subscriber，从你自己编写的Publisher处订阅指令
	 */
	ros::Subscriber angular_sub = nh.subscribe<pub_cmd::Double>("pub_ang",10,doV);
	/*
	 *若有需要，也可以从小车处发布你所需要的信息
	 */
    ros::Rate loop_rate(60);
	
	car.set_noise_level(0);		   //设置噪声等级
	float yaw =0.0;
    while (ros::ok()) {
		yaw += 0.01;
		car.set_yaw(yaw); 		   //修改小车的方向
		ros::spinOnce();
		car.set_velocity(velocity);//设置小车速度
        car.update_();//小车状态更新
		loop_rate.sleep();
    }


    return 0;
}

//实现S形弯的参数：
//mian.cpp里面 v=0.01，yaw+=0.01 ,sub_angular里的loop_rate(60)
//实现转弯的参数:
//main.cpp里面 v=0.01 yaw+=0.01, sub_angular里的loop_rate(120)