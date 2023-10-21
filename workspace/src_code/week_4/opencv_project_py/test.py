import cv2
import numpy as np
import threading
import time
time_start=time.time()
file_path="D:\\Tutorial_2023\\workspace\\src_code\\week_4\\opencv_project\\resource\\video1.mp4"
video=cv2.VideoCapture(file_path)
frame_count=int(video.get(cv2.CAP_PROP_FRAME_COUNT))
frame_height=int(video.get(cv2.CAP_PROP_FRAME_HEIGHT))
frame_width=int(video.get(cv2.CAP_PROP_FRAME_WIDTH))
matrix=np.zeros((frame_count,frame_height,frame_width,3),dtype=np.uint8)
image_result=np.zeros((frame_height,frame_width,3),dtype=np.uint8)
if video.isOpened:
    for i in range(frame_count):
        ret,frame=video.read()
        if frame is None:
            break
        if ret is True:
            cv2.imshow("result",frame)
            if cv2.waitKey(10) & 0xFF == 27 :
                break
            matrix[i]=frame

video.release()
cv2.destroyAllWindows()
def process(height,width,channel):
    for b in range(height):
        for j in range(width):
            tmp1=matrix[:,b,j,channel]
            tmp2=np.argmax(np.bincount(tmp1))
            # result=list(tmp1).index(tmp2)
            image_result[b,j,channel]=tmp2
threads=[]
for i in range(3):
    thread=threading.Thread(target=process,args=(frame_height,frame_width,i))
    threads.append(thread)
for thread in threads:
    thread.start()
for thread in threads:
    thread.join()
cv2.imshow("result",image_result)
time_end=time.time()
print(time_end-time_start)
cv2.waitKey(0)