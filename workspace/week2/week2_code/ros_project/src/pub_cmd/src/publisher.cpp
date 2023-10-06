#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
//包含头文件

int main(int argc, char  *argv[])
{
    ros::init(argc,argv,"pub_cmd");
    //初始化ros节点

    ros::NodeHandle nh;
    //创建节点句柄

    ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("cmd_car_vel",10);
    //创建发布对象

    geometry_msgs::Twist twist ;
    //创建速度消息对象

    twist.angular.z=0.01;
    twist.linear.x=0.001;
    //组织消息对象

    ros::Rate rate(10);
    //以10Hz发布

    while (ros::ok()){
        pub.publish(twist);
        //发布消息
        rate.sleep();
        //配合以10Hz发布
        
        ros::spinOnce();

    }
    return 0;
}
