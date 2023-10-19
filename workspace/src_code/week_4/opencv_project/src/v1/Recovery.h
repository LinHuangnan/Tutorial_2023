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
    void color_change(Mat &input_image, vector<int> b, vector<int> g, vector<int> r);
    void reverse(vector<vector<int>> vec, vector<int> &result);
    vector<std::vector<int>> color_b;
    vector<std::vector<int>> color_g;
    vector<std::vector<int>> color_r;
    vector<int> tmp_b;
    vector<int> tmp_g;
    vector<int> tmp_r;
    vector<int> b;
    vector<int> g;
    vector<int> r;

public:
    void readVideo(std::string filePath);
    Mat process();
    void showResult(string name,Mat img);
};

#endif