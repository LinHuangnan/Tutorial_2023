#include<ros/ros.h>
#include<week2_task1/Num.h>
#include <bits/stdc++.h>
int main(int argc, char** argv){
    ros::init(argc, argv, "num_client");
    ros::NodeHandle node;

    ros::service::waitForService("/show_num");
    ros::ServiceClient num_client = node.serviceClient<week2_task1::Num>("/show_num");

    week2_task1::Num srv;
    srand(time(NULL));
    srv.request.num = rand() % (100) / (float)(100);
    ROS_INFO("Call service to judge num[num:%f]", srv.request.num);
    num_client.call(srv);
    if(srv.response.ans) ROS_INFO("Yes");
    else ROS_INFO("No");
    return 0;
}