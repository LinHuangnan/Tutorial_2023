#!/usr/bin/env python
import rospy
from first_Pkg import Message

def callback(data):
    rospy.loginfo("Received:" + str(data.random_number))

def subscriber():
    rospy.init_node('subscriber',anonymous = True)
    rospy.Subscriber("my_topic", Message, callback)
    rospy.spin()

if _name_ == '_main_':
    subscriber()