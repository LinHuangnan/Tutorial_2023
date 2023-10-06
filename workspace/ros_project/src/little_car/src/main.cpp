#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include<cmath>
using namespace std;
ros::Subscriber sub;
little_car car;//初始化控制对象  小车
//回调函数
void doMsg(const SVector3 ConstPtr& p){//这里要改参数类型
        SVector3 velocity={0,0,0};//速度信息 
        float yaw=0;
        velocity.x=p.x;
        velocity.y=p.y;
        yaw=p.z;
        car.set_yaw(yaw); 		   //修改小车的方向
      	car.set_velocity(velocity);//设置小车速度
        car.update_();//小车状态更新 
}
int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
    car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
	car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
	//请添加一个Subscriber，从你自己编写的Publisher处订阅指令
	sub = n.subscribe<SVector3>("controlcar",1,doMsg);
	//小车消息发布
	  geometry_msgs::Point p;//要发布的位置信
	 SVector3 position=car.get_position();//得到位置信息 
	 ros::Rate loop_rate(110);
	 while (ros::ok()) {
         position=car.get_position();
         p.x=position.x;
	  p.y=position.y;
	  p.z=position.z;
	  car.pos_pub.publish(p);//发送信息
	   //订阅改变信息
        loop_rate.sleep();
    }
	ros::spin();
    /*ros::Rate loop_rate(100);
	SVector3 velocity={0,0.0008,0};  //速度向量
	car.set_noise_level(1);		   //设置噪声等级
	float yaw = 0;
	car.set_yaw(yaw); 
	float e2=0;
	float e3=0;
	float e4=0;
	const double pi = acos(-1.0);
	int i=0;
    while (ros::ok()&&i<1000) {
              i++;
		car.update_();
		SVector3 _position=car.get_position();
	if(_position.x==0&&(_position.y>=0.35&&_position.y<=0.55)) break;
		float v1;//切向速度
		float v2;//向心速度
		float e=(_position.y)*(_position.y)+_position.x*_position.x;
                float e1=sqrt(e);
                e3=e1;
                 e1-=0.5;
                 e2+=e1;
                 e4+=e3;
     		 v1=(0.001*pi)*e3+0.000000002*e4;
	         v2=0.001*e1+0.00003*e2;	              
	         velocity.x=(-1)*(v1*sin(yaw)+
	         v2*sin(yaw+(pi/2)));
	         velocity.y=(v1*cos(yaw)+v2*cos(yaw+(pi/2)));
		float y=atan2(-(_position.x),(_position.y));//yaw是相对于
		if(y<0&&y>=(pi/2*(-1)))y+=(pi/2);
		else if(y>0&&y<=(pi/2))y+=(pi/2);
		else if(y>(pi/2)&&y<=(pi))y+=(pi/2);
		else y+=(pi*5/2);
		yaw=y;
	         car.set_velocity(velocity);//设置小车速度
		car.set_yaw(yaw); 		   //修改小车的方向
                car.update_();//小车状态更新
		loop_rate.sleep();
    }
    i=0;
    e2=0;
    e4=0;
    while (ros::ok()&&i<1000) {
              i++;
		car.update_();
		SVector3 _position=car.get_position();
	//if(_position.x==0&&(_position.y>=0.35&&_position.y<=0.55)) break;
		float v1;//切向速度
		float v2;//向心速度
		float e=(_position.x-1)*(_position.x-1)+_position.y*_position.y;
                float e1=sqrt(e);
                e3=e1;
                 e1-=0.5;
                 e2+=e1;
                 e4+=e3;
     		 v1=(0.001*pi)*e3+0.000000002*e4;
	         v2=0.01*e1+0.00003*e2;	              
	         velocity.x=(-1)*(v1*sin(yaw)+
	         v2*sin(yaw-(pi/2)));
	         velocity.y=(v1*cos(yaw)+v2*cos(yaw-(pi/2)));
		float y=atan2(-(_position.x-1),(_position.y));//yaw是相对于
		if(y<0&&y>=(pi/2*(-1)))y+=(pi*3/2);
		else if(y>0&&y<=(pi/2))y+=(pi*3/2);
		else if(y>(pi/2)&&y<=(pi))y-=(pi/2);
		else y+=(pi*3/2);
		yaw=y;
	         car.set_velocity(velocity);//设置小车速度
		car.set_yaw(yaw); 		   //修改小车的方向
                car.update_();//小车状态更新
		loop_rate.sleep();
    }*/

    return 0;
}

