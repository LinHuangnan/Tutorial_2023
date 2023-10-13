import cv2

def detect_faces(image):
    # 加载人脸识别器模型
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

    # 将图像转换为灰度图像
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # 在图像中检测人脸
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    # 标记出检测到的人脸
    for (x, y, w, h) in faces:
        cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)

    return image

def main():
    # 读取图像文件
    image = cv2.imread('data/images/prettygirl.png')  # 替换为要识别的图像文件路径

    # 进行人脸识别
    result = detect_faces(image)

    # 显示结果图像
    cv2.imshow('Face Detection', result)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

if __name__ == "__main__":
     main()


