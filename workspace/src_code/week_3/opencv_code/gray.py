import cv2
img=cv2.imread("workspace\image\week_3\opencv\color.jpg")
gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
img=cv2.cvtColor(gray,cv2.COLOR_BGR2RGB)
cv2.imshow('灰度处理',img)
cv2.waitKey()