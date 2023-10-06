#include"ros/ros.h"
#include"task1/random.h"
#include<iostream>
bool doNums(task1::random::Request &request,task1::random::Response &response){
//1.处理请求
float f1=request.num1;
std::cout<<"收到数据:"<<f1<<"\n";
//组织响应
if(f1<0.5) response.flag="Yes";
else response.flag="No";
return true;
}
int main(int argc,char* argv[]){
  ros::init(argc,argv,"taskw201");
  ros::NodeHandle nh;
   std::cout<<"服务器哦\n";
  ros::ServiceServer server=nh.advertiseService("randomnum",doNums);//发布话题为randomnum，回调函数为doNums 返回值为bool型;
  ros::spin();
  
}
