#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include "car_turn/yaw_v.h"
#include <cmath>
#include <math.h>
#define PI acos(-1)
using namespace std;
SVector3 velocity={0,0.008,0};  //速度向量
float yaw = 0.0;
int noise;
float v_x=0,v_y=0,v_z=0;
void callback(const car_turn::yaw_v::ConstPtr& msg)
{
    ROS_INFO("收到信息");
	yaw=msg->yaw;
	v_x=msg->v_x;
	v_y=msg->v_y;
	v_z=msg->v_z;
	noise=msg->noise;
}
int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
	little_car car;//初始化控制对象  小车
    car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
	car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
	ros::init(argc, argv, "subscribe_turn");
	ros::NodeHandle node;
	ros::Subscriber sub_turn= node.subscribe<car_turn::yaw_v>("turn", 1, callback);
    ros::Rate loop_rate(60);
	
			   //设置噪声等级

    while (ros::ok()) {
		car.set_noise_level(noise);
	//	yaw += 0.01;
		
		// if(abs(yaw-PI/2)<=0.1)
		// {
		// 	v_x=v;
		// 	v_y=0;
		// 	yaw=PI/2;
		// }
		// else
		// {
		// 	v_x=tan(yaw)*v;
		// 	v_y=v;
		// }
		car.set_yaw(yaw); 		   //修改小车的方向
		velocity={v_x,v_y,0};
		car.set_velocity(velocity);//设置小车速度
        car.update_();//小车状态更新
		ros::spinOnce();
		loop_rate.sleep();
    }


    return 0;
}

