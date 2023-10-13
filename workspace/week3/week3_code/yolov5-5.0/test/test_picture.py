import cv2

# ~~~~~~~~读取图像~~~~~~~~~~
image = cv2.imread('data/images/grey.jpg')
# # 1.转换图像颜色空间
# # 1.1转换为灰度图像
# gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
# # 1.2转换为HSV颜色空间
# hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

# # 2.调整图像大小和缩放
# # 2.1调整图像大小
# new_width=
# new_height=
# resized = cv2.resize(image, (new_width, new_height))
# # 2.2等比例缩放图像
# scale_percent = 50  # 50% 缩放
# width = int(image.shape[1] * scale_percent / 100)
# height = int(image.shape[0] * scale_percent / 100)
# resized = cv2.resize(image, (width, height))

# # 3.骚操作
# # 3.1均值模糊处理
ksize = 3  # ksize是核大小，一般是奇数1，3，5，7...
# blurred = cv2.blur(image, (ksize, ksize))
#  #3.2中值模糊处理
# blurred = cv2.medianBlur(image, ksize)
# # 3.3高斯模糊处理
# sigmaX = 0  # X方向上的标准差
# blurred = cv2.GaussianBlur(image, (ksize, ksize), sigmaX)
# # 3.4边缘检测
threshold1 = 100  # 第一个阈值
threshold2 = 200  # 第二个阈值
# # 根据这两个阈值来确定哪些边缘需要保留，哪些边缘需要丢弃
# # 如果希望检测到更多的边缘，可以降低阈值；如果只关注更强的边缘，可以增加阈值
edges = cv2.Canny(image, threshold1, threshold2)

# ~~~~~~~~显示图像窗口~~~~~~~~~
cv2.imshow('test_result', edges)
# 灵活改变参数2的值~~~，直接在这里一边调试一边记录，就没写用户输入啦QAQ

# ~~~~~~~~等待键盘输入~~~~~~~~~
cv2.waitKey(0)

# ~~~~~~~~关闭图像窗口~~~~~~~~~
cv2.destroyAllWindows()