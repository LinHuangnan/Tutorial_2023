import cv2
import matplotlib.pyplot as plt 
import numpy as np 
img = cv2.imread('./pic/pic.png')
gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
blur = cv2.GaussianBlur(img,(3,3),0,0)
sobelxy = cv2.Sobel(src=blur, ddepth=cv2.CV_64F, dx=1, dy=1, ksize=5)
k = np.ones((5, 5), np.uint8)
erode = cv2.erode(img, k)
dilate = cv2.dilate(img, k)
#cv2.imwrite('./pic/pic_gray.png', gray)
#cv2.imwrite('./pic/pic_blur.png', blur)
cv2.imwrite('./pic/pic_sobelxy.png', sobelxy)
#cv2.imwrite('./pic/pic_erode.png', erode)
#cv2.imwrite('./pic/pic_dilate.png', dilate)