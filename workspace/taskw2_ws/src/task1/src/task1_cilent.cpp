#include"ros/ros.h"
#include"task1/random.h"
#include<iostream>
#include <ctime>
#include <cstdlib>
int main(int argc,char* argv[]){
srand (static_cast <unsigned> (time(0)));
ros::init(argc,argv,"taskw202");
 ros::NodeHandle nh;
 //创建客户端对像
 ros::ServiceClient client=nh.serviceClient<task1::random>("randomnum");
 //提交请求
  task1::random ai;
 ai.request.num1=static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
 client.call(ai);//提交;
 //处理响应
 bool flag1=client.call(ai);//看是否正常响应
 if(flag1==1){
std::cout<<"响应成功"<<" 传入数据为："<<ai.request.num1<<"\n"
;
//获取结果,响应结果被封装进ai的response里面
std::cout<<ai.response.flag<<"\n"
; }
else std::cout<<"失败\n";
return 0;
}
