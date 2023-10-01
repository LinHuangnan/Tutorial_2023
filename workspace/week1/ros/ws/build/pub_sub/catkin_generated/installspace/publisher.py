#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
import rospy
import random
from pub_sub.msg import number

# def publisher():
#     # 创建发布者对象
#     pub = rospy.Publisher('random_number', number, 10)
#     # 初始化节点
#     rospy.init_node("Publisher")
#     # 创建Rate对象
#     rate = rospy.Rate(1)
#     # 循环发布数据
#     while not rospy.is_shotdown():
#         # 创建number数据
#         num = number()
#         # 赋值
#         num.number = random.uniform(0, 100)
#         # 发布
#         rospy.loginfo("发布：" + str(num.number))
#         pub.publish(num)
#         rate.sleep()

if __name__ == "__main__":
    
    # 初始化节点
    rospy.init_node("publisher")
    # 创建发布者对象
    pub = rospy.Publisher("random_number", number, queue_size=10)
    # 创建Rate对象
    rate = rospy.Rate(1)
    # 循环发布数据
    while not rospy.is_shutdown():
        # 创建number数据
        num = number()
        # 赋值
        num.number = random.uniform(0, 100)
        # 发布       
        pub.publish(num)
        rospy.loginfo("发布：" + str(num.number))

        rate.sleep()
    pass
