#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
#导入库
import rospy
from pub_sub.msg import number

#回调函数
def back(data):
    rospy.loginfo("收到:" + str(data.number))
#订阅函数
def subscriber():
    #初始化
    rospy.init_node("subscriber")
    #创建订阅者对象
    sub = rospy.Subscriber("random_number", number, back)

    rospy.spin()

if __name__ == "_main_":
    subscriber()
    pass
