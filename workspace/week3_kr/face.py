import numpy as np
import cv2
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
img = cv2.imread('face.jpg',cv2.IMREAD_COLOR)
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
face = face_cascade.detectMultiScale(gray, scaleFactor=1.2, minNeighbors=1)
for (x,y,w,h) in face:
    cv2.rectangle(img,(x,y),(x+w,y+h),(255,255,0),2)
cv2.namedWindow('faces', cv2.WINDOW_AUTOSIZE)
cv2.imshow('face',img)
cv2.waitKey(0)
cv2.destroyAllWindows()