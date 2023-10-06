#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include <geometry_msgs/Twist.h>

using namespace std;





SVector3 velocity={0.001,0,0};
float yaw = 0.00;
//声明速度向量为全局变量


void doVel(const geometry_msgs::Twist::ConstPtr &msg,little_car& car){
	//设置回调函数，修改速度变量的值
	
	velocity.x = msg->linear.x;
	          
	while (ros::ok()) {
		
		yaw += msg->angular.z;
		car.set_yaw(yaw); 		    //修改小车的方向
		car.set_velocity(velocity); //设置小车速度
    	car.update_();              //小车状态更新
    }

}

int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
	ros::NodeHandle n;
	little_car car;

    car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
	car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1); //小车的位置消息发布
	
	ros::Subscriber sub = n.subscribe<geometry_msgs::Twist>("cmd_car_vel",10, boost::bind(doVel, _1, boost::ref(car)));
	//添加一个Subscriber，从自己编写的Publisher处订阅指令

	/*
	 *若有需要，也可以从小车处发布你所需要的信息
	 */
    ros::Rate loop_rate(60);
	
	car.set_noise_level(0);		   //设置噪声等级
	
    
	
	 while (ros::ok()){
        ros::spinOnce();
		loop_rate.sleep();
    }


    return 0;
}


