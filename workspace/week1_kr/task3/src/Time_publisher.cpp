#include<ros/ros.h>
#include"task3/Time.h"

int main(int argc, char** argv){
    ros::init(argc, argv, "Time_publisher");
    ros::NodeHandle n;
    ros::Publisher time_info_pub = n.advertise<task3::Time>("/time_info", 10);
    ros::Rate loop_rate(100);
    int count = 0;
    task3::Time time_msg;
    time_msg.ms = 0;
    time_msg.s = 0;
    while(ros::ok()){
        time_msg.ms++;
        if(time_msg.ms == 100){
            time_msg.ms = 0;
            time_msg.s ++;
        }
        time_info_pub.publish(time_msg);
        ROS_INFO("Publish Time Info: %d s. %d ms", time_msg.s, time_msg.ms);
        loop_rate.sleep();
    }
    return 0;
}