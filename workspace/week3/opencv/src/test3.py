import cv2
import numpy as np
#  
img = cv2.imread('src/3.jpg')

edge_img = cv2.Canny(img, 100, 2)
cv2.imshow('imshow', edge_img)
cv2.waitKey(0)
cv2.destroyAllWindows()