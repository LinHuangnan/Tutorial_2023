#include<ros/ros.h>
#include"task3/Time.h"

void timeInfoCallback(const task3::Time::ConstPtr& msg){
    ROS_INFO("Subscribe Time Info: %d s. %d ms", msg->s, msg->ms);
}
int main(int argc, char **argv){
    ros::init(argc, argv, "time_subscriber");
    ros::NodeHandle n;
    ros::Subscriber time_info_sub = n.subscribe("/time_info", 10, timeInfoCallback);
    ros::spin();
    return 0;
}