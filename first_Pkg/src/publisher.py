#!/usr/bin/env python
import rospy
from first_Pkg.msg import Message
import random

def publisher():
    publish = rospy.publisher('my_topic', Message, queue_size = 10)
    rospy.init_node('publisher', anonymous = True)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        msg = Message()
        msg.random_number = random.uniform(0, 100)
        rospy.loginfo("Puslishing:" + str(msg.random_number))
        pub.publish(msg)
        rate.sleep()

if _name_ == '_main_':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass
        