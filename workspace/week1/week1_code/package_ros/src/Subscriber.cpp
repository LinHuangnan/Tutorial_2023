#include <ros/ros.h>
#include "package/Yuanyue.h"
 
//创建回调函数
void yuanyueCallback(const package::Yuanyue::ConstPtr& msg)
{
    ROS_INFO("Receieve: Yuanyue's age:%d  Randnumber:%d", msg->age, msg->number);  //提示收到消息
}
 
int main(int argc, char **argv)
{
    ros::init(argc, argv, "Subscriber");  //初始化Subscriber
 
    ros::NodeHandle nh; //节点句柄初始化
 
    ros::Subscriber sub = nh.subscribe("Yuanyue", 100, yuanyueCallback); //订阅"role_details"话题
 
    // 循环等待回调函数
    ros::spin();
 
    return 0;
}
