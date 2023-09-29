#include<ros/ros.h>
#include"my_topic/my_msg.h"
void msg_Callback(const my_topic::my_msg::ConstPtr& msg){
 ROS_INFO("Subcribe role: Name:%s Age:%d",msg->m_Name.c_str(),msg->m_Age);
}
int main(int argc,char **argv){
ros::init(argc,argv,"msg_sub");
ros::NodeHandle nh;
ros::Subscriber pb=nh.subscribe("/role_details",5,msg_Callback);
//订阅话题，等待处理信息队列，回调函数
ros::spin();//循环等待回调函数
}
