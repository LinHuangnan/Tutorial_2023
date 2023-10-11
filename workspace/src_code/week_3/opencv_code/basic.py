import cv2
import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['figure.figsize'] = (12.8*2, 7.2*2)
img = cv2.imread("workspace/image/week_3/opencv/color.jpg")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
gray_show = cv2.cvtColor(gray, cv2.COLOR_BGR2RGB)
img_show = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
gauss_1=cv2.GaussianBlur(img_show,ksize=(11,11),sigmaX=5,sigmaY=5)
gauss_2=cv2.GaussianBlur(gray_show,ksize=(11,11),sigmaX=5,sigmaY=
                       5)
img_rac=cv2.imread("workspace/image/week_3/opencv/rectangle.jpg")
img_rac_show=cv2.cvtColor(img_rac,cv2.COLOR_BGR2RGB)
#利用sobel算子的算法
# img_rac_show=cv2.cvtColor(img_rac,cv2.COLOR_BGR2RGB)
# img_rac_gray=cv2.cvtColor(img_rac,cv2.COLOR_BGR2GRAY)
# img_rac_gray_rgb=cv2.cvtColor(img_rac_gray,cv2.COLOR_BGR2RGB)
# img_rac_gray_rgb_gauss=cv2.GaussianBlur(img_rac_gray_rgb,(5,5),1)
# img_rac_sobelx=cv2.Sobel(img_rac_gray_rgb_gauss,cv2.CV_64F,1,0,ksize=3)
# img_rac_sobely=cv2.Sobel(img_rac_gray_rgb_gauss,cv2.CV_64F,1,0,ksize=3)
# img_rac_sobelxy=cv2.addWeighted(cv2.convertScaleAbs(img_rac_sobelx),0.5,cv2.convertScaleAbs(img_rac_sobely),0.5,0)
#直接调用canny函数的算法
img_canny=cv2.Canny(img,50,100,apertureSize=3,L2gradient=True)
img_canny_show=cv2.cvtColor(img_canny, cv2.COLOR_BGR2RGB)
img_rac_canny=cv2.Canny(img_rac,50,100,apertureSize=3,L2gradient=True)
img_rac_canny_show=cv2.cvtColor(img_rac_canny, cv2.COLOR_BGR2RGB)
kernel=np.ones((5,5),np.uint8)
img_erosion_1=cv2.dilate(img,kernel=kernel)
img_erosion_1_show=cv2.cvtColor(img_erosion_1,cv2.COLOR_BGR2RGB)
img_erosion_2=cv2.erode(img,kernel=kernel)
img_erosion_2_show=cv2.cvtColor(img_erosion_2,cv2.COLOR_BGR2RGB)
for i in range(9):
    if i == 0:
        image = img_show
        title = "原图1"
    elif i == 1:
        image = img_rac_show
        title ="原图2"
    elif i == 2:
        image = gray_show
        title = "灰度处理"  
    elif i == 3:
        image = gauss_1
        title = "高斯模糊处理1"  
    elif i==4:
        image = gauss_2
        title = "高斯模糊处理2"
    elif i==5:
        image=img_canny_show
        title="边缘检测1"
    elif i==6:
        image=img_rac_canny_show
        title="边缘检测2"
    elif i==7:
        image=img_erosion_1_show
        title="图像膨胀"
    elif i==8:
        image=img_erosion_2_show
        title="图像腐蚀"
    plt.subplot(3, 3, i + 1)
    plt.imshow(image)
    plt.title(title, fontsize=12)
    plt.axis('off')

plt.show()
