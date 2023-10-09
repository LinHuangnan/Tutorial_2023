#include <ros/ros.h>
#include <geometry_msgs/Quaternion.h>
#include <tf2_msgs/TFMessage.h>
#include <tf/transform_datatypes.h>
#include <pub_cmd/Double.h>
#include <cmath>


double x,y,z,w;
//设置四元数变量，用来存储tf变换的四元数数据
double roll, pitch, yaw;
//设置三个描述小车位姿的变量
double delta =0.0;
//这个是用来控制小车转弯的

void doQ(const tf2_msgs::TFMessage &msg){
    ROS_INFO("sucess in subscription");
    x = msg.transforms.data()->transform.rotation.x;
    y = msg.transforms.data()->transform.rotation.y;
    z = msg.transforms.data()->transform.rotation.z;
    w = msg.transforms.data()->transform.rotation.w;   

    //用来存储tf变换的四元数数据
}

int main(int argc, char  *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"sub_angular");
    ros::NodeHandle nh;
    //ros基础配置
    ros::Subscriber angular_sub = nh.subscribe("/tf",10,doQ);
    //创建用来订阅订阅/tf消息
   
    
    ros::Rate loop_rate(60);
   //设置循环频率60Hz

    ros::Duration(2).sleep();
    //休眠2秒，防止没有开始发布tf消息就进行消息处理
    while (ros::ok){
        ros::spinOnce();//接受来自tf的消息

        tf::Quaternion q(w, x, y, z);//创建四元数对象
    
        tf::Matrix3x3(q).getRPY(roll, pitch, yaw);//把四元数对象转换成欧拉角

        double angle_difference = yaw ; //设置与绝对坐标系x轴的夹角
        double sin_angle = sin(angle_difference);
        double cos_angle = cos(angle_difference);
        //换算出三角函数权重
        
        //发布三角值消息
        ros::Publisher angular_pub = nh.advertise<pub_cmd::Double>("pub_ang",10);
        pub_cmd::Double fmsg;
        
        //下面请选择一个功能注释

        // 实现小车S形转弯的三角值权重消息
        fmsg.sin = sin_angle;
        fmsg.cos = cos_angle;
        
        //实现小车转弯的三角值权重消息
        // fmsg.sin = sin(delta);
        // fmsg.cos = cos(delta);
        // delta= delta + 0.01;

        angular_pub.publish(fmsg);
        ROS_INFO("sin:%f,cos:%f",fmsg.sin,fmsg.cos);

        loop_rate.sleep();

    }

    return 0;
}
