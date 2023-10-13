import numpy as np
import cv2
def face_detect(img):
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    face_detector = cv2.CascadeClassifier('src/haarcascade_frontalface_default.xml')
    faces = face_detector.detectMultiScale(gray, scaleFactor = 1.2, minNeighbors = 6)
    for (x, y, w, h) in faces:
        cv2.rectangle(img, (x, y), (x + w, y + h), (0, 0, 255), 2)
    cv2.imshow('faces', img)


img = cv2.imread('src/1.png')
face_detect(img)
cv2.waitKey(0)
cv2.destroyAllWindows()