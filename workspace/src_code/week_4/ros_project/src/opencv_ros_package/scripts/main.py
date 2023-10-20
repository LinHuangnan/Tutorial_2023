#!/usr/bin/env python3
#coding:utf-8
import cv2
import numpy as np
import time
from rich.progress import track
if __name__=='__main__':
    time_start=time.time()
    file_path="/home/lbm/Desktop/Tutorial_2023/workspace/src_code/week_4/opencv_project/resource/video3.mp4"
    video=cv2.VideoCapture(file_path)
    if video.isOpened:
        print("文件读取成功，正在处理......")
        frame_count=int(video.get(cv2.CAP_PROP_FRAME_COUNT))
        frame_height=int(video.get(cv2.CAP_PROP_FRAME_HEIGHT))
        frame_width=int(video.get(cv2.CAP_PROP_FRAME_WIDTH))
        matrix=np.zeros((frame_count,frame_height,frame_width,3),dtype=np.uint8)
        image_result=np.zeros((frame_height,frame_width,3),dtype=np.uint8)
        for i in track(range(frame_count),description='[red]转换视频'):
            ret,frame=video.read()
            if frame is None:
                break
            if ret is True:
                # cv2.imshow("result",frame)
                # if cv2.waitKey(10) & 0xFF == 27 :
                #     break
                matrix[i]=frame

    video.release()
    for b in track(range(frame_height),description='[green]提取背景中'):
        for j in range(frame_width):
            for m in range(3):
                tmp1=matrix[:,b,j,m]
                tmp2=np.argmax(np.bincount(tmp1))
                # result=list(tmp1).index(tmp2)
                image_result[b,j,m]=tmp2
    cv2.imshow("result",image_result)
    time_end=time.time()
    print("处理时间为：",time_end-time_start)
    while 1:
        k=cv2.waitKey(10)
        if k==27:
            break
    cv2.imwrite("./result.jpg",img=image_result)
    print("文件已保存在当前目录下")
    cv2.destroyAllWindows()

