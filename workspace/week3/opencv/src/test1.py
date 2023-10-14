import cv2
import numpy as np
 
img = cv2.imread('src/3.jpg', 0)
cv2.imshow('imshow', img)

cv2.waitKey(0)
cv2.destroyAllWindows()
