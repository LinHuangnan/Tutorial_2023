### 相应代码解释 ###

##### 1.``` Recovery.cpp```

#####    加上最后``` readCannel```的函数实现（即摄像头输入流）

```c++
#include<iostream>
#include<string>
#include<opencv2/opencv.hpp>
#include"Recovery.h"
//#include<chrono>
//using namespace std::chrono;
using namespace cv;
using namespace std;
void Recovery::readCannel(int n) //电脑自带摄像头流默认为“0”
{
    cap = VideoCapture(n); //读取视频流
    if(!cap.isOpened()) //判断摄像头是否打开成功
    {
        cout << "Error" << endl;
        return;
    }


}


void Recovery::readVideo(String filePath) //通过绝对路径来打开视频
{
    cap.open(filePath);  //通过绝对路径来打开视频
    if(!cap.isOpened()) //判断读取视频是否成功
    {
	cout << "Error" << endl;
    	return;
    }
	
}

void Recovery::process()
{
    while(true)
    {
		Mat frame;
		bool ret = cap.read(frame); //判断读取视频帧
	if(!ret)
	{
	    break;
	}
	Mat gray;
	Mat fgmask;
	cvtColor(frame, gray, COLOR_BGR2GRAY); //将图片转化为灰度图
	
	absdiff(gray, mean(gray),fgmask); //计算当前帧图像的灰度图与平均灰度图像之间的差异
	
	imshow("frame", frame);
	imshow("mask", fgmask);
	
	if(waitKey(30)==27)
	{
	    break;
	}

	imwrite("video1.jpg",frame);	//保存图片
    }
    
    cap.release();		
    destroyAllWindows();	//关闭所有窗口，释放缓存区
}

void Recovery::showResult()
{
    img = imread("video1.jpg");  //将之前保存下来的图片展示出来
    imshow("result",img);
    waitKey(0);
}

```

##### 2.``` demo.cpp``` 

```c++
#include<iostream>
#include<string>
#include<opencv2/opencv.hpp>
#include"Recovery.h"
#include<chrono>
//using namespace std::chrono;
using namespace cv;
using namespace std::chrono;

int main()
{
    auto start = high_resolution_clock::now();  //记录开始时间
    Recovery r;
    r.readVideo("/home/jerry/code/task/video1.mp4");
    r.process();
    auto end = high_resolution_clock::now(); //纪录结束时间
    auto duration = duration_cast<milliseconds>(end - start); //计算经历时间
    r.showResult();
    cout << "time：" << duration.count() << " ms" << endl;
    return 0;
}
```

##### 3.``` CMakeLists.txt```

```cmake
cmake_minimum_required(VERSION 2.8) //限定最小cmake版本
project( demo ) // 项目的名字
find_package( OpenCV REQUIRED ) //寻找Opencv库
include_directories(include) //将include中的Recovery.h文件添加为依赖库
set(CMAKE_CXX_STANDARD 14) //指定c++14版本
include_directories( ${OpenCV_INCLUDE_DIRS} ) //添加Opencv库的头文件
add_executable( demo demo.cpp src/Recovery.cpp) //将src中的Recovery.cpp文件链接到可执行文件demo中
target_link_libraries( demo ${OpenCV_LIBS} ) //链接Opencv库

```

##### 4.``` video_MOG2.py``` ####

```python
import numpy as np
import cv2

# read the video
cap = cv2.VideoCapture('vtest.avi')

# create the subtractor
fgbg = cv2.createBackgroundSubtractorMOG2(
    history=500, varThreshold=100, detectShadows=False)


def getPerson(image, opt=1):

    # get the front mask
    mask = fgbg.apply(frame)

    # eliminate the noise
    line = cv2.getStructuringElement(cv2.MORPH_RECT, (1, 5), (-1, -1))
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, line)
    cv2.imshow("mask", mask)

    # find the max area contours
    contours, hierarchy = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    for c in range(len(contours)):
        area = cv2.contourArea(contours[c])
        if area < 150:
            continue
        rect = cv2.minAreaRect(contours[c])
        cv2.ellipse(image, rect, (0, 255, 0), 2, 8)
        cv2.circle(image, (np.int32(rect[0][0]), np.int32(rect[0][1])), 2, (255, 0, 0), 2, 8, 0)
    return image, mask


while True:
    ret, frame = cap.read()
    cv2.imwrite("input.png", frame)
    cv2.imshow('input', frame)
    result, m_ = getPerson(frame)
    cv2.imshow('result', result)
    k = cv2.waitKey(50)&0xff
    if k == 27:
        cv2.imwrite("result.png", result)
        cv2.imwrite("mask.png", m_)

        break
cap.release()
cv2.destroyAllWindows()

//官方使用案例，可以执行更为复杂的操作
```

##### 5.``` video_mask.py``` 

```python
import numpy as np
import cv2

cap = cv2.VideoCapture('vtest.avi')

fgbg = cv2.createBackgroundSubtractorMOG2() //使用MOG2的算法

while(1):
    ret, frame = cap.read()

    fgmask = fgbg.apply(frame)

    cv2.imshow('frame',frame)

    cv2.imshow('mask',fgmask)
    k = cv2.waitKey(30) & 0xff
    if k == 27:
        break

cap.release()
cv2.destroyAllWindows()

//该代码只是自己简单利用MOG2算法的实现
```

##### 6.`` Recovery.h`` 

```python
#include<iostream>
#include<string>
#include<opencv2/opencv.hpp>
//#include<chrono>
//using namespace std::chrono;
using namespace cv;
using namespace std;

class Recovery {

public:
    /* readVideo
    * @param filePath 文件绝对路径
    * 根据绝对路径读取需要还原背景的文件
    */
    void readVideo(String filePath);

    /* process
    * 进行还原过程
    */
    void process();

    /* showResult
    * 窗口展示背景还原后的结果
    */
    void showResult();

    void readCannel(int n); //增加从摄像头读取视频流的函数

private:
    Mat img; //用于存取得到的截图
    VideoCapture cap; //打开视频流
};

```



