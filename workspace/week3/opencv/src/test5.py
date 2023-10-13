import cv2
import numpy as np
#  
img = cv2.imread('src/3.jpg')

Kernel = np.ones((4,4), dtype=np.uint8)
erosion = cv2.erode(img, Kernel, 1)
cv2.imshow('erosion', erosion)
cv2.waitKey(0)
cv2.destroyAllWindows()