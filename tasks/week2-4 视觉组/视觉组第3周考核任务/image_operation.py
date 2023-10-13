import cv2
import numpy as np

img = cv2.imread("test1.jpg") 
kernel = np.ones((5,5),np.uint8)

imgRGB = cv2.cvtColor(img,cv2.COLOR_BGR2RGB)
imgGray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)  #gray
imgGray2 = cv2.imread("test1.jpg",0) #gray
imgBlur = cv2.GaussianBlur(img,(3,3),1,1)  #blur
imgCanny = cv2.Canny(img,100,200,True)   #canny
imgDilation = cv2.dilate(imgCanny,kernel,iterations=1) #dilate
imgErode = cv2.erode(imgDilation,kernel,iterations=1) #erode

cv2.imshow("RGB Image",img)
cv2.imshow("Original Image",img)
cv2.imshow("Gray Image",imgGray)
cv2.imshow("Gray Image2",imgGray2)
cv2.imshow("Gaussian Blur",imgBlur)
cv2.imshow("Canny Edge",imgCanny)
cv2.imshow("Image Dilation",imgDilation)
cv2.imwrite('blur(3,3).jpg',imgBlur)
cv2.imshow("Image Erode",imgErode)
cv2.waitKey(20000)



