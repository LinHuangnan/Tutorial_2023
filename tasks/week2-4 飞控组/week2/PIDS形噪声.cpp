#include "parser.h"
#include <urdf/model.h>
#include <string>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Point.h>
#include <ros/ros.h>
#include <random>
#include <iomanip>
using namespace std;

int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
    little_car car;
    car.joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
    car.pos_pub = n.advertise<geometry_msgs::Point>("car_position",1);
    tf::TransformBroadcaster broadcaster;

    // 设置小车速度和方向
    SVector3 velocity = {0.008, 0.0, 0.0};
    car.set_velocity(velocity);

    // 设置噪声级别
    car.set_noise_level(2);

    // 设置转弯方向
    int direction = 1;

    // 初始化PID参数
    double kp = 0.02;
    double ki = 0.0;
    double kd = 0.005;
    double integral = 0.0;
    double derivative = 0.0;
    double prev_error = 0.0;

    // 设置初始位置和角度
    SVector3 position = car.get_position();
    double yaw = 0.0;

    // 初始化S形轨迹参数
    double a = 1.0;  // 控制轨迹宽度
    double b = 2.0;  // 控制轨迹高度
    double c = 2.5;  // 控制轨迹长度
    double t = 0.0;  // 时间变量

    ros::Time prev_time = ros::Time::now();
    ros::Rate loop_rate(20);

    while (ros::ok()) {
        ros::Time current_time = ros::Time::now();
        double dt = (current_time - prev_time).toSec();
        prev_time = current_time;

        // 计算PID控制器输出
        double error = b * sin(c * t) - position.y;
        integral += error * dt;
        derivative = (error - prev_error) / dt;
        double output = kp * error + ki * integral + kd * derivative;
        prev_error = error;

        // 根据PID控制器输出调整小车速度和方向
        velocity.x = 0.008;
        velocity.y = direction * output;
        velocity.z = 0.0;
        car.set_velocity(velocity);

        // 更新时间变量
        t += dt;

        // 调用更新函数
        car.update_();

        loop_rate.sleep();
        ros::spinOnce();
    }

    return 0;
}
