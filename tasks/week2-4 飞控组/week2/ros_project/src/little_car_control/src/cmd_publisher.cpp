#include <ros/ros.h>
#include <std_msgs/String.h>
#include <sstream>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "control_publisher");
  ros::NodeHandle n;
  ros::Publisher control_pub = n.advertise<std_msgs::String>("control_topic", 10);
  ros::Rate loop_rate(10);

  while (ros::ok())
  {
    std_msgs::String msg;
    std::stringstream ss;
    ss << "turn"; // 控制指令
    msg.data = ss.str();
   ROS_INFO("turning");
    control_pub.publish(msg);


    loop_rate.sleep();
  }

  return 0;
}

