以下的运行照片，有些没办法截图QAQ
因为windows自带的和微信自带的截图工具没办法截屏到LinuxGUI的框框
所以只能拍照（鞠躬）
# 飞控组
## 1.成功部署整个ros_workspace
完成了基本的环境配置
下面是roslaunch后的截图
[roslaunch后的截图.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week3/week3_asset/roslaunch%E5%90%8E%E7%9A%84%E6%88%AA%E5%9B%BE.png)

## 2.till next time
最近三周学校的课表一直挺紧的，特别是这周国庆调休作业挺多
于是先完成视觉组的任务TwT，下次一定好好琢磨！！


# 视觉组
yolov5的训练的权重没有上传~~
## 1.配置yolov5的虚拟环境
需要安装`yolov5`对应版本的相关依赖

使用国内源来安装
临时换源`pip install markdown -i https://mirrors.aliyun.com/pypi/simple/`
永久换源`pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`

源目录
```
https://pypi.tuna.tsinghua.edu.cn/simple
https://mirrors.aliyun.com/pypi/simple/
http://mirrors.cloud.tencent.com/pypi/simple
http://pypi.douban.com/simple/
```

如果使用`pip`没有反应，那么可能是源的下载速度太慢

并且从github上下载的源码要作为独立的工作空间打开才可以正常编译

以下是相关结果截图
[配置环境.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week3/week3_asset/%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.png)

[待完成的安装依赖包的脚本.png](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week3/week3_asset/%E5%BE%85%E5%AE%8C%E6%88%90%E7%9A%84%E5%AE%89%E8%A3%85%E4%BE%9D%E8%B5%96%E5%8C%85%E7%9A%84%E8%84%9A%E6%9C%AC.png)
## 2.部署yolov5模型，检测实验样例

![[实例.png]]

## 3.利用现有库实现人脸识别
经过查阅资料，决定使用比较简单的导库，代码见`/yolov5/test/face.py`

1. 查阅资料，使用OpenCV提供的Haar级联分类器作为人脸识别器模型
2. 加载人脸识别器模型
```python
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
```
3. 加载图像并人脸识别
```python
img = cv2.imread('example.jpg')  # 替换为图像文件路径
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
for (x, y, w, h) in faces:
    cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)

cv2.imshow('Face Detection', img)
cv2.waitKey(0)
cv2.destroyAllWindows()
```

运行结果如下（目前精度欠佳TwT）
![[人脸识别.jpg]]

## 4.使用基本操作处理图片
经过查阅资料进行了对图片的简单处理
代码见`/yolov5/test/test_picture.py`

设置灰度
![[灰度.jpg]]

等比例缩放
![[缩放.jpg]]

设置HSV色度
![[色度.jpg]]

模糊处理（本身相机拍得就模糊，就不辣眼睛了QAQ）
![[模糊.jpg]]

边缘
![[边缘.jpg]]


## 5.关于一些加分项的内容
### 使用摄像头视频流作为yolov5模型的输入
使用摄像头视频流作为 yolov5 模型的输入，实现实时检测

但是发现WSL子系统无法直接调用本地的摄像头
代码见`/yolov5/test/camera_test.py`

于是将本地的摄像头通过ffmpeg推流到一个rstp服务器
但是又发现Windows系统下的VLC可以接收到视频流
而偏偏WSL子系统里的py文件又接受不到
代码见`/yolov5/test/capture_test.py`

以下是运行结果
![[视频流.png]]

traceback如下
```
(yolov5) yuanyue@Musii0:~/yolov5-5.0$ /home/yuanyue/anaconda3/envs/yolov5/bin/python /home/yuanyue/yolov5-5.0/t2detect.py
[tcp @ 0x55e1464e3400] Connection to tcp://127.0.0.1:554?timeout=0 failed: Connection refused
```
### 一些函数接口原理的理解
#### cv2.VideoCapture()
这个函数用于创建一个视频捕获对象，可以从摄像头、文件或网络源加载视频流

它的参数可以是设备索引（例如0代表默认摄像头）或视频文件的路径，也可以是网络视频流的URL

该函数会返回一个VideoCapture对象，用于后续的视频流读取操作

#### VideoCapture对象.read()
这个方法用于从视频流中读取一帧图像
它会返回两个值：
一个布尔值（ret），表示是否成功读取到图像帧
一个图像帧（frame），是一个numpy数组，包含了图像的像素数据

#### cv2.imshow()
这个函数用于在窗口中显示图像帧

它接受两个参数：
窗口的名称和要显示的图像帧

如果要使用它，要完成以下的步骤
1. 使用cv2.imread()函数读取图像文件
2. 使用cv2.imshow()函数显示图像窗口
3. 使用cv2.waitKey()函数等待键盘输入
4. 使用cv2.destroyAllWindows()函数关闭图像窗口
#### cv2.waitKey()
这个函数用于等待键盘输入

它接受一个整数参数，表示等待的时间（以毫秒为单位）
如果等待期间没有键盘输入，函数会返回-1
如果等待期间有键盘输入，函数会返回被按下的键的ASCII码值


#### cap.release()
这个方法用于释放VideoCapture对象所占用的资源
例如关闭视频流或释放摄像头

#### cv2.destroyAllWindows()
这个函数用于关闭所有通过cv2.namedWindow()创建的窗口
