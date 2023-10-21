#include <opencv2/opencv.hpp>
#include <string>

class Recovery {
    //创建Recovery类
public:
    //类中包含readVideo、process和showResult三个公共方法
    void readVideo(std::string filePath);
    void process();
    void showResult(cv::Mat frame);
    

private:
    cv::VideoCapture video;
    //用OpenCV的VideoCapture类来读取视频文件
    //传递视频文件的绝对路径作为参数

};
