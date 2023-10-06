#include "../../little_car/src/parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include<cmath>
#include <pthread.h>
using namespace std;
ros::Publisher pub;
SVector3 position;//全局参数，以便能回调函数访问
//int i=0;//计数
void A(){
SVector3 p;//发布出去的消息
ros::Rate loop_rate(100);
SVector3 velocity={0,0.0008,0}; 
float yaw = 0;
float e2=0;
float e3=0;
float e4=0;
const double pi = acos(-1.0);
int i=0;
while (ros::ok()&&i<1000) {
  i++;
  float v1;//切向速度
   float v2;//向心速度
   float e=(position.y)*(position.y)+position.x*position.x;
   float e1=sqrt(e);
    e3=e1;
    e1-=0.5;
    e2+=e1;
    e4+=e3;
     v1=(0.001*pi)*e3+0.000000002*e4;
     v2=0.001*e1+0.00003*e2;	              
     velocity.x=(-1)*(v1*sin(yaw)+
	         v2*sin(yaw+(pi/2)));
     velocity.y=(v1*cos(yaw)+v2*cos(yaw+(pi/2)));
      float y=atan2(-(position.x),(position.y));//yaw是相对于
		if(y<0&&y>=(pi/2*(-1)))y+=(pi/2);
		else if(y>0&&y<=(pi/2))y+=(pi/2);
		else if(y>(pi/2)&&y<=(pi))y+=(pi/2);
		else y+=(pi*5/2);
		yaw=y;
		p.x= velocity.x;
		p.y= velocity.y;
		p.z=yaw;
		pub.publish(p);
		loop_rate.sleep();
    }
     i=0;
    e2=0;
    e4=0;
    while (ros::ok()&&i<1000) {
              i++;
		float v1;//切向速度
		float v2;//向心速度
		float e=(position.x-1)*(position.x-1)+position.y*position.y;
                float e1=sqrt(e);
                e3=e1;
                 e1-=0.5;
                 e2+=e1;
                 e4+=e3;
     		 v1=(0.001*pi)*e3+0.000000002*e4;
	         v2=0.01*e1+0.00003*e2;	              
	         velocity.x=(-1)*(v1*sin(yaw)+
	         v2*sin(yaw-(pi/2)));
	         velocity.y=(v1*cos(yaw)+v2*cos(yaw-(pi/2)));
		float y=atan2(-(position.x-1),(position.y));//yaw是相对于
		if(y<0&&y>=(pi/2*(-1)))y+=(pi*3/2);
		else if(y>0&&y<=(pi/2))y+=(pi*3/2);
		else if(y>(pi/2)&&y<=(pi))y-=(pi/2);
		else y+=(pi*3/2);
		yaw=y;
	     	p.x= velocity.x;
		p.y= velocity.y;
		p.z=yaw;
		pub.publish(p);
		loop_rate.sleep();
    }
}

void doMsg(const geometry_msgs::Point ConstPtr& p1){
position.x=p1.x;
position.y=p1.y;
position.z=p1.z;
}
int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher2");
    ros::NodeHandle nh;
     pub=nh.advertise<SVector3>("controlcar",1); 
    ros::Subscriber sub = nh.subscribe<geometry_msgs::Point>("car_position",1,doMsg);//订阅位置
    ros::spin();
   }

