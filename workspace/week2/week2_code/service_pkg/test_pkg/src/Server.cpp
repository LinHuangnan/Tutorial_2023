#include "ros/ros.h"
#include "test_pkg/num.h"
//1.引入头文件

bool judge(test_pkg::num::Request &request,
           test_pkg::num::Response &response){
            //传入响应和请求对象
            
            float num1 = request.num1;
            if (num1 < 0.5){
                response.num2 = 1;
                ROS_INFO("回应的布尔值是1");
            }else{
                response.num2 = 0;
                ROS_INFO("回应的布尔值是0");
            }
            return true;

}


int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"Server_Node");
    //2.初始化ros节点

    ros::NodeHandle nh;
    //3.创建ros句柄对象；

    ros::ServiceServer server = nh.advertiseService("judge",judge);
    //4.创建服务对象；

    ROS_INFO("服务器启动");
    ros::spin();
    return 0;
}
