#ifndef __RECOVERY_H
#define __RECOVERY_H

#include <opencv2/opencv.hpp>
#include <string>
#include "Recovery.h"
using namespace std;
using namespace cv;

class Recovery
{
private:
    string filepath;
public:
    void readVideo(string filePath);
    void process();
    void showResult();
};


#endif