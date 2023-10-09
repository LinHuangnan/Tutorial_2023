import cv2

img=cv2.imread("workspace/image/week_3/opencv/face_detect.jpg")
face_detect=cv2.CascadeClassifier(r'workspace/src_code/week_3/opencv_code/haarcascade_frontalface_default.xml')
faces=face_detect.detectMultiScale(image=img,scaleFactor=1.1,minNeighbors=5)
print("检测到有%d个人脸,坐标信息如下：\n"%(len(faces)),faces)
for x,y,w,h in faces:
    cv2.rectangle(img=img,pt1=(x,y),pt2=(x+w,y+w),color=(0,0,225),thickness=2)
cv2.imshow("result",img)
cv2.waitKey(0)
    