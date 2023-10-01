#include "ros/ros.h"
#include "task_3/msg1.h"

int main(int argc, char **argv)
{
	ros::init(argc, argv, "publish_node");
	ros::NodeHandle node_handle;

	ros::Publisher pub = node_handle.advertise<task_3::msg1>("topic",10);
	ros::Rate rate(1);
	while(ros::ok())
	{
		task_3::msg1 msg;
		msg.data=rand()%100;
		pub.publish(msg);
		ros::spinOnce();
		rate.sleep();
	}

	return 0;
}	
