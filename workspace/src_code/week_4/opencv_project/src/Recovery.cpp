#include "Recovery.h"
#include <opencv2/opencv.hpp>
void Recovery::readVideo(string filePath)
{
    cv::VideoCapture capture(filePath);
    if(!capture.isOpened())
    {
        std::cout<<"打开失败\n";
    }
    Mat frame;
    namedWindow("video");
    int frame_num=capture.get(CAP_PROP_FRAME_COUNT);
    std::cout<<frame_num<<endl;
    return;
}
