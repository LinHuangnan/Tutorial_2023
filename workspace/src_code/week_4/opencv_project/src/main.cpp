#include<opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include "Recovery.h"
#include<conio.h>
//using namespace cv;
using namespace std;


int main(int argc ,char *argv[])
{
    cout<<argv[0]<<endl;
    string filepath;
    Recovery rec;
    
    if(argc==2)
    {
        filepath=argv[1];
        cout<<filepath;
        rec.readVideo(filepath);
    }
    else if(argc>2)
    {
        cout<<"111";
    }
    else
    {
        cout<<"000";
    }
    cout<<"121";
    return 0;
}