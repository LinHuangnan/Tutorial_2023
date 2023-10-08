#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
using namespace std;
void callback(const geometry_msgs::Point::ConstPtr& msg)
{
    ROS_INFO("收到的信息为：%f",msg->x);
}
int main(int argc,char** argv)
{
    ros::init(argc,argv,"subcribe_node");
    ros::NodeHandle nodehandle;
    ros::Subscriber sub=nodehandle.subscribe("car_position",1,callback);
    ros::spin();
    return 0;
}