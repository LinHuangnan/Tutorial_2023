#include "ros/ros.h"
#include "car_turn/yaw_v.h"
#include <math.h>
#include <geometry_msgs/Point.h>
#define PI acos(-1)
float x,y,z;
float x_point=0;
float y_point=0;
void callback(const geometry_msgs::Point::ConstPtr& msg)
{
    ROS_INFO("收到信息");
	x=msg->x;
	y=msg->y;
	z=msg->z;
}
int main(int argc, char **argv)
{
	ros::init(argc, argv, "turn_s");
	ros::NodeHandle node_handle;
    ros::Subscriber sub=node_handle.subscribe("car_position",1,callback);
	ros::Publisher pub = node_handle.advertise<car_turn::yaw_v>("turn",1);
    car_turn::yaw_v msg;
	ros::Rate rate(20);

	while(ros::ok())
	{
        x_point=x_point+0.02;
		if(x_point>=0&&x_point<=2)
		{
			y_point=sqrt(1-pow((x_point-1),2));
		}
		else if (x_point>=2&&x_point<4)
		{
			y_point=-sqrt(1-pow((x_point-3),2));
		}
		// else
		// {
		// 	x_point=0;
		// 	y_point=0;
		// }
        msg.yaw=atan(y-y_point)/(x-x_point);
        msg.v_x=(x_point-x)*0.05;
        msg.v_y=(y_point-y)*0.05;
        msg.v_z=0;
        msg.noise=0;
		pub.publish(msg);
		ros::spinOnce();
		rate.sleep();
	}

	return 0;
}	