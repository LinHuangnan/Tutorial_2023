import cv2
 
# 读取照片，转换成灰度图
img1 = cv2.imread("test2.jpg")
gray_img = cv2.cvtColor(img1, cv2.COLOR_RGB2GRAY)
 
# 将级联算法加载到一个变量中
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
# 读取测试图片
img = cv2.imread('test2.jpg',cv2.IMREAD_COLOR)
# 将原彩色图转换成灰度图
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# 开始在灰度图上检测人脸，输出是人脸区域的外接矩形框
faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=6)
# 遍历人脸检测结果
for (x,y,w,h) in faces:
    # 在原彩色图上画人脸矩形框
    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
# 显示画好矩形框的图片
cv2.namedWindow('faces', cv2.WINDOW_AUTOSIZE)
cv2.imshow('faces',img)
cv2.imwrite("Group_img.jpg", img)
# 等待退出键
cv2.waitKey(10000)
# 销毁显示窗口
cv2.destroyAllWindows()
