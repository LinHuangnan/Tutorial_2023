#include "car_turn/yaw_v.h"
#include <geometry_msgs/Point.h>
#include "ros/ros.h"
float yaw = 0.0;
int noise=0;
float v_x,v_y,v_z;
void callback(const car_turn::yaw_v::ConstPtr& msg)
{
    ROS_INFO("yaw=%f",msg->yaw);
    ROS_INFO("v_x=%f",msg->v_x);
    ROS_INFO("v_y=%f",msg->v_y);
    ROS_INFO("v_z=%f",msg->v_z);
    ROS_INFO("noise=%d",msg->noise);
}
int main(int argc, char** argv) {
    ros::init(argc, argv, "test");
	ros::NodeHandle node;
	ros::Subscriber sub_turn= node.subscribe<car_turn::yaw_v>("turn", 1, callback);
    ros::Rate loop_rate(60);
ros::spin();

}