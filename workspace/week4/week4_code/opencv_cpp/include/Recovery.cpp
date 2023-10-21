#include "Recovery.h"
#include <vector>
#include <chrono>

void Recovery::readVideo(std::string filePath) {
    video.open(filePath);
    //尝试打开视频文件
    if (!video.isOpened()) {
        std::cout << "无法读取视频文件" << std::endl;
    }
}

void Recovery::showResult(cv::Mat frame){
    cv::Mat colorFrame = frame ;
    // 显示背景还原后的彩色图像
    cv::imshow("背景还原结果", colorFrame);
        
}

void Recovery::process(){
    // 存储背景帧的灰度图像和彩色图像
    cv::Mat backgroundGray;
    cv::Mat backgroundColor;
    
    // 读取第一帧作为背景帧
    video.read(backgroundColor);
    
    // 将背景帧转换为灰度图像
    cv::cvtColor(backgroundColor, backgroundGray, cv::COLOR_BGR2GRAY);
    
    // 获取视频的尺寸
    int height = backgroundGray.rows;
    int width = backgroundGray.cols;
    
    // 存储每个像素的背景模型参数：均值和标准差
    std::vector<std::vector<std::pair<double, double>>> backgroundModel(height, std::vector<std::pair<double, double>>(width));
    
    // 初始化背景模型参数
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            backgroundModel[i][j].first = backgroundGray.at<uchar>(i, j);
            backgroundModel[i][j].second = 1.0;
        }
    }
    
    // 计算函数开始时间
    auto start = std::chrono::high_resolution_clock::now();

    // 处理每一帧图像
    cv::Mat frame;
    while (video.read(frame)) {
        // 将当前帧转换为灰度图像
        cv::Mat grayFrame;
        cv::cvtColor(frame, grayFrame, cv::COLOR_BGR2GRAY);
        
        // 遍历每个像素，根据高斯模型进行背景提取
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                // 获取当前帧的像素值
                double pixelValue = grayFrame.at<uchar>(i, j);
                
                // 获取背景模型参数
                double mean = backgroundModel[i][j].first;
                double stddev = backgroundModel[i][j].second;
                
                // 计算当前帧像素值与背景模型的差异
                double diff = std::abs(pixelValue - mean);
                
                // 更新背景模型参数
                double alpha = 0.01; // 学习率
                mean = (1 - alpha) * mean + alpha * pixelValue;
                stddev = std::sqrt((1 - alpha) * stddev * stddev + alpha * diff * diff);
                
                // 判断当前像素是否属于背景
                double threshold = 50.0; // 阈值
                if (diff <= threshold * stddev) {
                    // 将当前像素标记为背景
                    grayFrame.at<uchar>(i, j) = mean;
                } else {
                    // 将当前像素标记为前景
                    grayFrame.at<uchar>(i, j) = 255;
                }
                
                // 更新背景模型参数
                backgroundModel[i][j].first = mean;
                backgroundModel[i][j].second = stddev;
            }
        }
        
        // 创建一个彩色的图像，与原始帧的尺寸和颜色通道数相同
        cv::Mat colorFrame(frame.size(), CV_8UC3);
        
        // 将原始帧复制到彩色图像，保留彩色信息
        frame.copyTo(colorFrame);
        
        // 将灰度图像复制到彩色图像的一个颜色通道
        cv::cvtColor(grayFrame, grayFrame, cv::COLOR_GRAY2BGR);
        cv::extractChannel(grayFrame, grayFrame, 0);
        cv::merge(std::vector<cv::Mat>{grayFrame, grayFrame, grayFrame}, grayFrame);
        
        // 将处理后的灰度图像与原始彩色图像进行合并
        cv::bitwise_or(colorFrame, grayFrame, colorFrame);
        
        // 显示背景还原后的彩色图像
        Recovery::showResult(colorFrame);
        if (cv::waitKey(1) == 'q') {
            break;
        }            
    }
    // 计算函数结束时间
    auto end = std::chrono::high_resolution_clock::now();
    // 计算函数的执行时间（以秒为单位）
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() / 1000.0;
    // 在命令行输出函数的处理时间
    std::cout << "这次的处理时间：" << duration << "s" << std::endl;
}









