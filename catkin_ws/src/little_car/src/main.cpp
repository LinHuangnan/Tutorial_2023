#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include <thread>
#include<cmath>
#include "std_msgs/Int32.h"
using namespace std;

float v = 0;
float yaw = 0.0;
//回调函数
void make(const std_msgs::Int32::ConstPtr &msg){
	switch(msg->data)
	{
		case 8:
			v += 0.01;
			break;
		case 2:
			v = 0;
			break;
		case 4:
			yaw += 0.01;
			break;
		case 6:
			yaw -= 0,01;
			break;
		default:
			break;									
	}
	cout<<v;
}	
//
void handle(){

	setlocale(LC_ALL,"");
	 ros::NodeHandle x;
	 ros::Subscriber sub = x.subscribe("control", 10, make);
	 ros::spin();

}	 
//PID
float PID(float &vy, float &vx){
	float = 0.01;//时间是0.01s
	float kp=1,ki=1,kz=1;
	v1 = *vx;
	v2 = *vy;
	diff1 = 
}
int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
	little_car car;//初始化控制对象  小车
    car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
	car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
	/* 
	 *请添加一个Subscriber，从你自己编写的Publisher处订阅指令
	 */
	  thread one (handle);
	 
	/*
	 *若有需要，也可以从小车处发布你所需要的信息
	 */
    ros::Rate loop_rate(60);
	SVector3 velocity={0,0,0};  //速度向量
	car.set_noise_level(0);		   //设置噪声等级

    while (ros::ok()) {
	//	yaw += 0.01;
		car.set_yaw(yaw); 		   //修改小车的方向
		if(-v * sin(yaw) < 0.08&& -v * sin(yaw) > -0.08){
		velocity.x = -v * sin(yaw);
		}
		else if(-v * sin(yaw) > 0){ 
		velocity.x = 0.08 ;
		}
		else{
		velocity.x = -0.08 ;
		}
		if(v * cos(yaw) < 0.08&& v * cos(yaw) > -0.08){
		velocity.y  = v * cos(yaw);
		}
		else if(v * cos(yaw) > 0){ 
		velocity.y  = 0.08 ;
		}
		else{
		velocity.y  = -0.08 ;
		}
		//velocity.y = v * cos(yaw);
		car.set_velocity(velocity);//设置小车速度
        car.update_();//小车状态更新
		loop_rate.sleep();
    }


    return 0;
}

