import cv2
import numpy as np
#  
img = cv2.imread('src/3.jpg')

blur_img = cv2.GaussianBlur(img,(7, 7), 3)

cv2.imshow('imshow', blur_img)

cv2.waitKey(0)
cv2.destroyAllWindows()