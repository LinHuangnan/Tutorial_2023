#include <ros/ros.h>
#include <srv_and_cli/data.h>
#include <ctime>
int main(int argc,char** argv)
{
    srand(time(0));
    ros::init(argc,argv,"client_node");
    ros::NodeHandle node;
    ros::service::waitForService("random_num_service");
    ros::ServiceClient client_node=node.serviceClient<srv_and_cli::data>("random_num_service");
    srv_and_cli::data srv;
    srv.request.num= (static_cast<double>(rand() % 101)) / 100;
    if(client_node.call(srv))
    {
        ROS_INFO("The num is:%f",srv.request.num);
        if(srv.response.result)
        {
            ROS_INFO("yes");
        }
        else
        {
            ROS_INFO("no");
        }
    }
    else
    {
        ROS_INFO("请求响应失败");
        return 1;
    }
    return 0;
}