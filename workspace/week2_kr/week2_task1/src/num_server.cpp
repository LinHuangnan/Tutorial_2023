#include<ros/ros.h>
#include"week2_task1/Num.h"
bool numCallback(week2_task1::Num::Request &req, week2_task1::Num::Response &res){
    ROS_INFO("Num:%f", req.num);
    if(req.num < 0.5) res.ans = 1;
    else res.ans = 0;
    return true;
}
int main(int argc, char** argv){
    ros::init(argc, argv, "num_server");
    ros::NodeHandle n;
    ros::ServiceServer num_service = n.advertiseService("/show_num", numCallback);
    ROS_INFO("Ready to show num");
    ros::spin();
    return 0;
}