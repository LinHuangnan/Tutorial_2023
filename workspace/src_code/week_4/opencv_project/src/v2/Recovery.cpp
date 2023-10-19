#include "Recovery.h"
using namespace std;
using namespace cv;
void Recovery::readVideo(std::string filePath)
{
    filepath = filePath;
}
Mat Recovery::process()
{
    VideoCapture capture(filepath);
    if (!capture.isOpened())
    {
        cout << "打开失败\n";
    }
    Mat frame;
    Mat new_frame;
    // namedWindow("video");
    int frame_num = capture.get(CAP_PROP_FRAME_COUNT);
    // cout<<"帧数为："<<frame_num<<endl;
    for (int i = 0; i < frame_num - 1; i++)
    {

        capture.read(frame);
        frame.copyTo(new_frame);
        color_store(frame, i);
        // imshow("video",frame);

        // cout<<i<<endl;
        // if(waitKey(30)=='q')
        // {
        //     break;
        // }
    }
    // destroyWindow("video");
    capture.release();
    reverse(color,result);
    // cout<<x<<"  "<<y<<endl;
    // cout<<b.size()<<endl;
    // cout<<g.size()<<endl;
    // cout<<r.size()<<endl;
    color_change(new_frame, result);
    return new_frame;
}

void Recovery::color_store(Mat input_image, int num)
{
    vector<int>image;
    image = input_image.reshape(1, 1);
    int b, g, r;
    color.push_back(image);
}

void Recovery::reverse(vector<vector<int>> vec, vector<int> &result)
{
    vector<int> tmp;
    int i, j;
    for (i = 0; i < vec[0].size(); i++)
    {
        tmp.clear();
        for (j = 0; j < vec.size(); j++)
        {
            tmp.push_back(vec[j][i]);
        }
        sort(tmp.begin(), tmp.end());
        auto last_int = tmp.front();
        auto most_freq_int = tmp.front();
        int max_freq = 0, current_freq = 0;
        for (const auto &i : tmp)
        {
            if (i == last_int)
                ++current_freq;
            else
            {
                if (current_freq > max_freq)
                {
                    max_freq = current_freq;
                    most_freq_int = last_int;
                }

                last_int = i;
                current_freq = 1;
            }
        }

        if (current_freq > max_freq)
        {
            max_freq = current_freq;
            most_freq_int = last_int;
        }
        result.push_back(most_freq_int);
    }
}

void Recovery::color_change(Mat &input_image, vector<int> color)
{
    Mat_<Vec3b>::iterator it = input_image.begin<Vec3b>();
    Mat_<Vec3b>::iterator itend = input_image.end<Vec3b>();
    int i = 0;
    for (; it != itend; it++)
    {
        (*it)[0] = color[i];
        (*it)[1] = color[i+1];
        (*it)[2] = color[i+2];
        // cout<<b[i]<<"  ";
        // cout<<g[i]<<"  ";
        // cout<<r[i]<<endl;
        i += 1;
    }
}

void Recovery::showResult(string name,Mat img)
{
    imwrite("photo.jpg", img);
    namedWindow(name);
    imshow(name, img);
    waitKey(0);
}