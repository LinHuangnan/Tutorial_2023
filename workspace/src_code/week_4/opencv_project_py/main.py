import cv2
import numpy as np

video=cv2.VideoCapture("D:\\Tutorial_2023\\workspace\\src_code\\week_4\\opencv_project\\resource\\video2.mp4")
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
for b in range(frame_height):
    for j in range(frame_width):
        for m in range(3):
            tmp1=matrix[:,b,j,m]
            tmp2=np.argmax(np.bincount(tmp1))
            # result=list(tmp1).index(tmp2)
            image_result[b,j,m]=tmp2
cv2.imshow("result",image_result)
cv2.waitKey(0)