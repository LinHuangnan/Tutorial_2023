#!/usr/bin/env python
# -*- coding: UTF-8 -*-
#导入库
import rospy
import random
from week2test.srv import *

def client():
    rospy.init_node("asker")
    rospy.wait_for_service("get")
    try:
        ToAsk = rospy.ServiceProxy("get", Number)
        random_number = random.random()
        respon = ToAsk.call(random_number)
        rospy.loginfo("发送的是：")
        print(random_number)
        print(respon)
        if respon.answer:
            rospy.loginfo("收到:Yes")
            #print("收到:Yes")
        else:
            rospy.loginfo("收到:No")
            #print("收到:No")
    except rospy.ServiceException as e:
        print("发送失败：", e)
    
if __name__ == "__main__":
    client()