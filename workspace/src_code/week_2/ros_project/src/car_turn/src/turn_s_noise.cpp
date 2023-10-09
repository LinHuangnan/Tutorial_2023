#include "ros/ros.h"
#include "car_turn/yaw_v.h"
#include <math.h>
#include <geometry_msgs/Point.h>
#include "pid.h"
#define PI acos(-1)
POSITION now_position={0,0,0};
POSITION target_position={0,0,0};
SPEED output;
void callback(const geometry_msgs::Point::ConstPtr& msg)
{
    ROS_INFO("收到信息");
	now_position.x=msg->x;
	now_position.y=msg->y;
	now_position.z=msg->z;
}
int main(int argc, char **argv)
{
	ros::init(argc, argv, "turn_s_noise");
	ros::NodeHandle node_handle;
    ros::Subscriber sub=node_handle.subscribe("car_position",1,callback);
	ros::Publisher pub = node_handle.advertise<car_turn::yaw_v>("turn",1);
    car_turn::yaw_v msg;
	ros::Rate rate(20);
    PID pid_config;
    pid_config.kp=0.05;
    pid_config.kd=0.06;
    pid_config.ki=0.01;
    pid_config.max_output.v_x=0.08;
    pid_config.max_output.v_y=0.08;
    pid_config.max_output.v_z=0.08;
    pid_config.max_integral.v_x=0.05;
    pid_config.max_integral.v_y=0.05;
    pid_config.max_integral.v_y=0.05;
    pid_process pid;
    pid.pid_init(pid_config);
	while(ros::ok())
	{
        target_position.x=target_position.x+0.02;
		if(target_position.x>=0&&target_position.x<=2)
		{
			target_position.y=sqrt(1-pow((target_position.x-1),2));
		}
		else if (target_position.x>=2&&target_position.x<4)
		{
			target_position.y=-sqrt(1-pow((target_position.x-3),2));
		}
        pid.pid_calculate(now_position,target_position);
        msg.yaw=atan(now_position.y-target_position.y)/(now_position.x-target_position.x);
        output=pid.get_output();
        msg.v_x=output.v_x;
        msg.v_y=output.v_y;
        msg.v_z=output.v_z;
        // msg.v_x=target_position.x;
        // msg.v_y=target_position.y;
        // msg.v_z=output.v_z;
        msg.noise=1;
		pub.publish(msg);
		ros::spinOnce();
		rate.sleep();

	}

	return 0;
}	