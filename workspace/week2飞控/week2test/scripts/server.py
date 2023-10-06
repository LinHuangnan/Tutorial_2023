#!/usr/bin/env python
# -*- coding: UTF-8 -*-
#导入库
import rospy
from week2test.srv import *

def server():
    rospy.init_node("answerist")
    ans = rospy.Service("get", Number, handle)
    rospy.loginfo("服务启动！")
    rospy.spin()

def handle(request): 
    respon = NumberResponse()
    if request.ask < 0.5:
        respon.answer = 1
    else:
        respon.answer = 0
    rospy.loginfo("响应为:")
    rospy.loginfo(1 == respon.answer)
    return respon

if __name__ == "__main__":
    server()