#include <ros/ros.h>
#include "my_topic/my_msg.h"
int main(int argc, char** argv)
{
 ros::init(argc, argv, "msg_pub");
 //分配给节点的名称“msg——pub”
 ros::NodeHandle nh;//节点句柄化//对象标识符//用来连接对象的
 ros::Publisher pb=nh.advertise<my_topic::my_msg>("/role_details" ,5);
 //<>内是数据泛型 第一个参数是话题名，int型是缓冲区大小
 ros::Rate loop_rate(1);//发布频率
 while(ros::ok()){//只要ok节点活着循环就成立
    my_topic::my_msg new_msg;
    new_msg.m_Name="hello,world!";
    new_msg.m_Age=19;//创建变量，变量赋值
    pb.publish(new_msg);
    //输出
    ROS_INFO("PUblish role name:%s Age:%d",new_msg.m_Name.c_str(),new_msg.m_Age);
    loop_rate.sleep();
 }
 return 0;
}
