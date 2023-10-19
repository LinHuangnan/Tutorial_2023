#include <opencv2/opencv.hpp>
#include <vector>
using namespace cv;
using namespace std;

int main()
{
    Mat img,img2,img3;
    img = imread("D:\\Tutorial_2023\\workspace\\src_code\\week_4\\opencv_project\\resource\\res1.jpg");
    // vector<int> image;
    // image = img.reshape(1, 1);
    // Mat_<Vec3b>::iterator it = img.begin<Vec3b>();
    // Mat_<Vec3b>::iterator endit = img.end<Vec3b>();
    // int b,tmp(0);
    // for(;it!=endit;it++)
    // {
    //     b = (*it)[0];
    //     cout<<b<<"\t";
    //     cin>>tmp;
    //     if(tmp==1)
    //     {
    //         break;
    //     }
    // }
    // for (int i = 0; i < 1000; i++)
    // {
    //     for (int j = 0; j < 1000; j++)
    //     {
    //         img.at<float>(i, j) = 3.2f;
    //     }
    // }
    // cout << "\n--------------------------\n";
    // for (int i = 0; i < image.size(); i+=3)
    // {
    //     cout << image[i]<<"\t";
    //     cin>>tmp;
    // }

}