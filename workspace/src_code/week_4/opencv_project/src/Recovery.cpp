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
        cout << "open faile\n";
    }
    Mat frame;
    Mat new_frame;
    Mat frame2;
    // namedWindow("video");
    int frame_num = capture.get(CAP_PROP_FRAME_COUNT);
    // cout<<"帧数为："<<frame_num<<endl;
    for (int i = 0; i < frame_num - 1; i++)
    {
        capture.read(frame2);
        if(frame2.cols>1500||frame2.rows>900)
        {
            resize(frame2,frame,Size(0,0),1500.0/(double)frame2.cols,1500.0/(double)frame2.cols);
        }
        else
        {
            frame=frame2;
        }
        frame.copyTo(new_frame);
        color_store(frame);
        // imshow("video",frame);

        // cout<<i<<endl;
        // if(waitKey(30)=='q')
        // {
        //     break;
        // }
    }
    // destroyWindow("video");
    capture.release();
    // int x = color_g.size();
    // int y = color_g[0].size();
    reverse(color_b, b);
    reverse(color_g, g);
    reverse(color_r, r);
    // cout<<x<<"  "<<y<<endl;
    // cout<<b.size()<<endl;
    // cout<<g.size()<<endl;
    // cout<<r.size()<<endl;
    color_change(new_frame, b, g, r);
    return new_frame;
}

void Recovery::color_store(Mat input_image)
{
    Mat_<Vec3b>::iterator it = input_image.begin<Vec3b>();
    Mat_<Vec3b>::iterator itend = input_image.end<Vec3b>();
    int b, g, r;
    tmp_b.clear();
    tmp_g.clear();
    tmp_r.clear();
    for (; it != itend; it++)
    {
        // (*it)[0]=(*it)[0]/div*div+div/2;
        // (*it)[1]=(*it)[1]/div*div+div/2;
        // (*it)[2]=(*it)[2]/div*div+div/2;
        b = (*it)[0];
        g = (*it)[1];
        r = (*it)[2];
        // std::cout<<b;
        // std::cout<<g;
        // std::cout<<r<<std::endl;
        tmp_b.push_back(b);
        tmp_g.push_back(g);
        tmp_r.push_back(r);
        // color_b[num+1].push_back(b);
        // color_g[num+1].push_back(g);
        // color_r[num+1].push_back(r);
    }
    color_b.push_back(tmp_b);
    color_g.push_back(tmp_g);
    color_r.push_back(tmp_r);
    // std::cout<<"y";
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

void Recovery::color_change(Mat &input_image, vector<int> b, vector<int> g, vector<int> r)
{
    Mat_<Vec3b>::iterator it = input_image.begin<Vec3b>();
    Mat_<Vec3b>::iterator itend = input_image.end<Vec3b>();
    int i = 0;
    for (; it != itend; it++)
    {
        (*it)[0] = b[i];
        (*it)[1] = g[i];
        (*it)[2] = r[i];
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