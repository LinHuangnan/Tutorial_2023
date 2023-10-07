#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
#include "little_car/Car.h"

int main(int argc, char **argv){
    ros::init(argc, argv, "turn_publisher");
    ros::NodeHandle n;
    ros::Publisher car_pub = n.advertise<little_car::Car>("/car_turn", 20);
    ros::Rate loop_rate(20);
    int count = 0;
    float yaw = 0;
    int x = 0;
    int y = 0;
    while(ros::ok()){
        little_car::Car car_msg;
        car_msg.x = x;
        car_msg.y = y;
        car_msg.yaw = yaw;
        car_pub.publish(car_msg);
        ROS_INFO("Publish turn info");
        loop_rate.sleep();
    }
}