#ifndef __RECOVERY_H
#define __RECOVERY_H

#include <opencv2/opencv.hpp>
#include <string>
#include "Recovery.h"
#include <vector>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <algorithm>
using namespace std;
using namespace cv;
class Recovery
{
private:
    string filepath;
    void color_store(Mat input_image, int num);
    void mat2vector(Mat& input_image,vector<int>& output_image);
    void color_change(Mat &input_image, vector<int> color);
    void reverse(vector<vector<int>> vec, vector<int> &result);
    vector<vector<int>> color;
    vector<int>result;

public:
    void readVideo(std::string filePath);
    Mat process();
    void showResult(string name,Mat img);
};

#endif