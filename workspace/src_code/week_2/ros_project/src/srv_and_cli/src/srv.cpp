#include <ros/ros.h>
#include <srv_and_cli/data.h>
bool result_callback(srv_and_cli::data::Request &req,
                    srv_and_cli::data::Response &res)
{
    if(req.num<0.5)
    {
        res.result=true;
    }
    else
    {
        res.result=false;
    }
}

int main(int argc,char** argv)
{
    ros::init(argc,argv,"service_node");
    ros::NodeHandle node;
    ros::ServiceServer service=node.advertiseService("/random_num_service",result_callback);
    ROS_INFO("Service node ready.");
    ros::spin();
    return 0;
}