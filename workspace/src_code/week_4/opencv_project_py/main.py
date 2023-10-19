import cv2
import numpy

video=cv2.VideoCapture("D:\\Tutorial_2023\\workspace\\src_code\\week_4\\opencv_project\\resource\\video1.mp4")
while video.isOpened:
    ret,frame=video.read()
    if frame is None:
        break
    if ret is True:
        cv2.imshow("result",frame)
        if cv2.waitKey(10) & 0xFF == 27 :
            break
video.release()
cv2.destroyAllWindows()