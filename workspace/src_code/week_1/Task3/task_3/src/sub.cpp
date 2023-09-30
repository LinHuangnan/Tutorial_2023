#include "ros/ros.h"
#include "task_3/msg1.h"
using namespace ros;
void callback(const task_3::msg1::ConstPtr& msg)
{
    ROS_INFO("收到的信息为：%f",msg->data);
}
int main(int argc,char** argv)
{
    init(argc,argv,"subcribe_node");
    NodeHandle nodehandle;
    Subscriber sub=nodehandle.subscribe("topic",10,callback);
    spin();
    return 0;
}