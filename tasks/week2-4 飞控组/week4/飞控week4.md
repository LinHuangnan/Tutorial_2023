#### Task4 ####

1. 相应代码解释：

   >* ``` demo.h``` //本代码大部分是参考dji_sdk_demo中的dji_fight_control.h文件只对mission做出大部分修改。
   >
   >  ```c++
   >  
   >  #ifndef DEMO_FLIGHT_CONTROL_H
   >  #define DEMO_FLIGHT_CONTROL_H
   >  
   >  // ROS includes
   >  #include <ros/ros.h>
   >  #include <geometry_msgs/QuaternionStamped.h>
   >  #include <geometry_msgs/Vector3Stamped.h>
   >  #include <sensor_msgs/NavSatFix.h>
   >  #include <std_msgs/UInt8.h>
   >  
   >  // DJI SDK includes
   >  #include <dji_sdk/DroneTaskControl.h>
   >  #include <dji_sdk/SDKControlAuthority.h>
   >  #include <dji_sdk/QueryDroneVersion.h>
   >  #include <dji_sdk/SetLocalPosRef.h>
   >  
   >  
   >  #include <tf/tf.h>
   >  #include <sensor_msgs/Joy.h>
   >  
   >  #define C_EARTH (double)6378137.0
   >  #define C_PI (double)3.141592653589793
   >  #define DEG2RAD(DEG) ((DEG) * ((C_PI) / (180.0)))
   >  
   >  /*!
   >   * @brief a bare bone state machine to track the stage of the mission
   >   */
   >  
   >  // 代码其他部分都是参考dji_sdk_demo中的demo_flight_control.h直接搬运，只对轨迹部分进行修改
   >  class Mission {
   >  public:
   >    Mission() {}
   >    ~Mission() {}
   >  
   >    void reset() {
   >      state = 0;
   >    }
   >  
   >    void setTarget(float x, float y, float z, float speed) {
   >      target_local_position.x = x;
   >      target_local_position.y = y;
   >      target_local_position.z = z;
   >      target_speed = speed;
   >    }
   >  
   >    void step(sensor_msgs::NavSatFix current_gps, geometry_msgs::Point current_local_pos, geometry_msgs::Quaternion current_atti)； //任务函数，在主函数内部实现
   >  
   >  
   >    int state = 0; //默认状态
   >    geometry_msgs::Point start_local_position;  //初始位置
   >    geometry_msgs::Point target_local_position; //目标位置
   >    float target_speed; // 飞行速度
   >    const float target_radius = 0.5; //距离阈值
   >    int outbound_counter = 0;
   >    int inbound_counter = 0; 
   >    int break_counter = 0; 
   >  
   >  };
   >  //剩下的都是原来有的回调函数和一些辅助函数
   >  
   >  void localOffsetFromGpsOffset(geometry_msgs::Vector3&  deltaNed,
   >                           sensor_msgs::NavSatFix& target,
   >                           sensor_msgs::NavSatFix& origin);
   >  
   >  geometry_msgs::Vector3 toEulerAngle(geometry_msgs::Quaternion quat);
   >  
   >  void display_mode_callback(const std_msgs::UInt8::ConstPtr& msg);
   >  
   >  void flight_status_callback(const std_msgs::UInt8::ConstPtr& msg);
   >  
   >  void gps_callback(const sensor_msgs::NavSatFix::ConstPtr& msg);
   >  
   >  void attitude_callback(const geometry_msgs::QuaternionStamped::ConstPtr& msg);
   >  
   >  void local_position_callback(const geometry_msgs::PointStamped::ConstPtr& msg);
   >  
   >  bool takeoff_land(int task);
   >  
   >  bool obtain_control();
   >  
   >  bool is_M100();
   >  
   >  bool monitoredTakeoff();
   >  
   >  bool M100monitoredTakeoff();
   >  
   >  bool set_local_position();
   >  
   >  #endif // DEMO_FLIGHT_CONTROL_H
   >  ```
   >
   >* ``` demo.cpp``` 与头文件一样，这里只修改了原函数中的mission部分。
   >
   >  ```c++
   >  
   >  #include "dji_sdk_demo/demo.h"
   >  #include "dji_sdk/dji_sdk.h"
   >  
   >  // 回调函数，将信息传递给circle_mission来完成圆周运动
   >  void targetPositionCallback(const geometry_msgs::Point& msg) {
   >    circle_mission.setTarget(msg.x, msg.y, msg.z, 5);
   >  }
   >  
   >  
   >  const float deg2rad = C_PI/180.0;
   >  const float rad2deg = 180.0/C_PI;
   >  
   >  ros::ServiceClient set_local_pos_reference;
   >  ros::ServiceClient sdk_ctrl_authority_service;
   >  ros::ServiceClient drone_task_service;
   >  ros::ServiceClient query_version_service;
   >  
   >  ros::Publisher ctrlPosYawPub;
   >  ros::Publisher ctrlBrakePub;
   >  
   >  // global variables for subscribed topics
   >  uint8_t flight_status = 255;
   >  uint8_t display_mode  = 255;
   >  sensor_msgs::NavSatFix current_gps;
   >  geometry_msgs::Quaternion current_atti;
   >  geometry_msgs::Point current_local_pos;
   >  
   >  
   >  Mission circle_mission; //创建相关对象
   >  
   >  int main(int argc, char** argv)
   >  {
   >    ros::init(argc, argv, "demo_flight_control_node");
   >    ros::NodeHandle nh;
   >    ros::Subscriber targetPositionSub = nh.subscribe("target_position", 10,    &targetPositionCallback); //接收"target_position"的话题
   >  
   >    // Subscribe to messages from dji_sdk_node
   >    ros::Subscriber attitudeSub = nh.subscribe("dji_sdk/attitude", 10, &attitude_callback);
   >    ros::Subscriber gpsSub      = nh.subscribe("dji_sdk/gps_position", 10, &gps_callback);
   >    ros::Subscriber flightStatusSub = nh.subscribe("dji_sdk/flight_status", 10, &flight_status_callback);
   >    ros::Subscriber displayModeSub = nh.subscribe("dji_sdk/display_mode", 10, &display_mode_callback);
   >    ros::Subscriber localPosition = nh.subscribe("dji_sdk/local_position", 10, &local_position_callback);
   >  
   >    // Publish the control signal
   >    ctrlPosYawPub = nh.advertise<sensor_msgs::Joy>("dji_sdk/flight_control_setpoint_ENUposition_yaw", 10);
   >    
   >    // We could use dji_sdk/flight_control_setpoint_ENUvelocity_yawrate here, but
   >    // we use dji_sdk/flight_control_setpoint_generic to demonstrate how to set the flag
   >    // properly in function Mission::step()
   >    ctrlBrakePub = nh.advertise<sensor_msgs::Joy>("dji_sdk/flight_control_setpoint_generic", 10);
   >    
   >    // Basic services
   >    sdk_ctrl_authority_service = nh.serviceClient<dji_sdk::SDKControlAuthority> ("dji_sdk/sdk_control_authority");
   >    drone_task_service         = nh.serviceClient<dji_sdk::DroneTaskControl>("dji_sdk/drone_task_control");
   >    query_version_service      = nh.serviceClient<dji_sdk::QueryDroneVersion>("dji_sdk/query_drone_version");
   >    set_local_pos_reference    = nh.serviceClient<dji_sdk::SetLocalPosRef> ("dji_sdk/set_local_pos_ref");
   >  
   >    bool obtain_control_result = obtain_control();
   >    bool takeoff_result;
   >    if (!set_local_position()) // We need this for height
   >    {
   >      ROS_ERROR("GPS health insufficient - No local frame reference for height. Exiting.");
   >      return 1;
   >    }
   >  
   >    if(is_M100())
   >    {
   >      ROS_INFO("M100 taking off!");
   >      takeoff_result = M100monitoredTakeoff();
   >    }
   >    else
   >    {
   >      ROS_INFO("A3/N3 taking off!");
   >      takeoff_result = monitoredTakeoff();
   >    }
   >  	//上面许多状态函数都没有进行修改，接下来判断无人机是否起飞，如果起飞就可以开始任务了
   >    if(takeoff_result)
   >    {
   >  	circle_mission.reset();
   >  	circle_mission.start_gps_location = current_gps;
   >  	circle_mission.start_local_position = current_local_pos;
   >  	circle_mission.setTarget(10, 0, 3, 5);
   >  	circle_mission.state = 1;
   >  	ROS_INFO("Starting circle mission.");
   >  
   >  	ros::Rate loop_rate(10);
   >  	while (ros::ok()) {
   >    	circle_mission.step(current_gps, current_local_pos, current_atti); //按照任务的步骤一步一步执行下去，不断更新无人机的位置，实现圆周运动
   >    	ros::spinOnce();
   >    	loop_rate.sleep();
   >  
   >    	}
   >  
   >    }
   >    ros::spin();
   >    return 0;
   >  }
   >  
   >  // Helper Functions
   >  
   >  /*! Very simple calculation of local NED offset between two pairs of GPS
   >  /coordinates. Accurate when distances are small.
   >  !*/
   >  void
   >  localOffsetFromGpsOffset(geometry_msgs::Vector3&  deltaNed,
   >                           sensor_msgs::NavSatFix& target,
   >                           sensor_msgs::NavSatFix& origin)
   >  {
   >    double deltaLon = target.longitude - origin.longitude;
   >    double deltaLat = target.latitude - origin.latitude;
   >  
   >    deltaNed.y = deltaLat * deg2rad * C_EARTH;
   >    deltaNed.x = deltaLon * deg2rad * C_EARTH * cos(deg2rad*target.latitude);
   >    deltaNed.z = target.altitude - origin.altitude;
   >  }
   >  
   >  
   >  geometry_msgs::Vector3 toEulerAngle(geometry_msgs::Quaternion quat)
   >  {
   >    geometry_msgs::Vector3 ans;
   >  
   >    tf::Matrix3x3 R_FLU2ENU(tf::Quaternion(quat.x, quat.y, quat.z, quat.w));
   >    R_FLU2ENU.getRPY(ans.x, ans.y, ans.z);
   >    return ans;
   >  }
   >  
   >  void Mission::step()
   >  {
   >    static int info_counter = 0;
   >    geometry_msgs::Vector3 localOffset;
   >  
   >    float speedFactor = 2;
   >    float yawThresholdInDeg = 2;
   >  
   >    float xCmd, yCmd, zCmd;
   >  
   >    localOffsetFromGpsOffset(localOffset, current_gps, start_gps_location);
   >  
   >    double xOffsetRemaining = target_offset_x - localOffset.x;
   >    double yOffsetRemaining = target_offset_y - localOffset.y;
   >    double zOffsetRemaining = target_offset_z - localOffset.z;
   >  
   >    double yawDesiredRad = deg2rad * target_yaw;
   >    double yawThresholdInRad = deg2rad * yawThresholdInDeg;
   >    double yawInRad = toEulerAngle(current_atti).z;
   >  
   >    info_counter++;
   >    if (info_counter > 25)
   >    {
   >      info_counter = 0;
   >      ROS_INFO("-----x=%f, y=%f, z=%f, yaw=%f ...", localOffset.x, localOffset.y, localOffset.z, yawInRad);
   >      ROS_INFO("+++++dx=%f, dy=%f, dz=%f, dyaw=%f ...", xOffsetRemaining, yOffsetRemaining, zOffsetRemaining, yawInRad - yawDesiredRad);
   >    }
   >  
   >    // 圆形运动代码开始
   >    static int state = 0; // 状态变量，用于控制圆形运动的不同阶段
   >  
   >    if (state == 0)
   >    {
   >      // 第一阶段：向前飞行
   >      xCmd = speedFactor;
   >      yCmd = 0;
   >      zCmd = start_local_position.z + target_offset_z;
   >  
   >      if (xOffsetRemaining < 0)
   >      {
   >        // 到达目标位置，进入下一个阶段
   >        state = 1;
   >      }
   >    }
   >    else if (state == 1)
   >    {
   >      // 第二阶段：绕圈运动
   >      double radius = 5; // 圆的半径
   >      double theta = 0.1; // 角度增量
   >  
   >      // 计算当前位置到圆心的距离
   >      double distanceToCenter = sqrt(pow(localOffset.x, 2) + pow(localOffset.y, 2)); //通过分别计算x轴和y轴距离原点的距离
   >  
   >      // 计算当前位置相对于圆心的角度
   >      double currentAngle = atan2(localOffset.y, localOffset.x);
   >  
   >      // 计算目标角度
   >      double targetAngle = currentAngle + theta;
   >  
   >      // 计算目标位置
   >      xCmd = radius * cos(targetAngle);
   >      yCmd = radius * sin(targetAngle);
   >      zCmd = start_local_position.z + target_offset_z; //通过不断计算当前的角度更新无人机的位置
   >      //若当前位置到圆心的距离大于圆的周长就完成任务
   >      if (distanceToCenter > 2 * M_PI * radius)
   >      {
   >        // 绕圈一周完成，进入下一个阶段
   >        state = 2;
   >      }
   >    }
   >    else if (state == 2)
   >    {
   >      // 第三阶段：向后飞行
   >      xCmd = -speedFactor;
   >      yCmd = 0;
   >      zCmd = start_local_position.z + target_offset_z;
   >  
   >      if (xOffsetRemaining >= 0)
   >      {
   >        // 返回起始位置，完成圆形运动
   >        state = 0;
   >        ROS_INFO("##### Circle mission completed!");
   >      }
   >    }
   >  }
   >  
   >  
   >  
   >    /*!
   >     * @brief: if we already started breaking, keep break for 50 sample (1sec)
   >     *         and call it done, else we send normal command
   >     */
   >  
   >    if (break_counter > 50)
   >    {
   >      ROS_INFO("##### Route %d finished....", state);
   >      finished = true;
   >      return;
   >    }
   >    else if(break_counter > 0)
   >    {
   >      sensor_msgs::Joy controlVelYawRate;
   >      uint8_t flag = (DJISDK::VERTICAL_VELOCITY   |
   >                  DJISDK::HORIZONTAL_VELOCITY |
   >                  DJISDK::YAW_RATE            |
   >                  DJISDK::HORIZONTAL_GROUND   |
   >                  DJISDK::STABLE_ENABLE);
   >      controlVelYawRate.axes.push_back(0);
   >      controlVelYawRate.axes.push_back(0);
   >      controlVelYawRate.axes.push_back(0);
   >      controlVelYawRate.axes.push_back(0);
   >      controlVelYawRate.axes.push_back(flag);
   >  
   >      ctrlBrakePub.publish(controlVelYawRate);
   >      break_counter++;
   >      return;
   >    }
   >    else //break_counter = 0, not in break stage
   >    {
   >      sensor_msgs::Joy controlPosYaw;
   >  
   >  
   >      controlPosYaw.axes.push_back(xCmd);
   >      controlPosYaw.axes.push_back(yCmd);
   >      controlPosYaw.axes.push_back(zCmd);
   >      controlPosYaw.axes.push_back(yawDesiredRad);
   >      ctrlPosYawPub.publish(controlPosYaw);
   >    }
   >  
   >    if (std::abs(xOffsetRemaining) < 0.5 &&
   >        std::abs(yOffsetRemaining) < 0.5 &&
   >        std::abs(zOffsetRemaining) < 0.5 &&
   >        std::abs(yawInRad - yawDesiredRad) < yawThresholdInRad)
   >    {
   >      //! 1. We are within bounds; start incrementing our in-bound counter
   >      inbound_counter ++;
   >    }
   >    else
   >    {
   >      if (inbound_counter != 0)
   >      {
   >        //! 2. Start incrementing an out-of-bounds counter
   >        outbound_counter ++;
   >      }
   >    }
   >  
   >    //! 3. Reset withinBoundsCounter if necessary
   >  if (current_local_pos.x > boundary_x || current_local_pos.x < -boundary_x ||
   >      current_local_pos.y > boundary_y || current_local_pos.y < -boundary_y)
   >  {
   >    outbound_counter++;
   >    inbound_counter = 0;
   >  }
   >  else
   >  {
   >    inbound_counter++;
   >    outbound_counter = 0; /
   >  }
   >  
   >  if (outbound_counter > 10)
   >  {
   >    ROS_INFO("##### Route %d: out of bounds, reset....", state);
   >    inbound_counter  = 0;
   >    outbound_counter = 0;
   >  }
   >  
   >  if (inbound_counter > 50)
   >  {
   >    ROS_INFO("##### Route %d start break....", state);
   >    break_counter = 1;
   >  }
   >  
   >  
   >  bool takeoff_land(int task)
   >  {
   >    dji_sdk::DroneTaskControl droneTaskControl;
   >  
   >    droneTaskControl.request.task = task;
   >  
   >    drone_task_service.call(droneTaskControl);
   >  
   >    if(!droneTaskControl.response.result)
   >    {
   >      ROS_ERROR("takeoff_land fail");
   >      return false;
   >    }
   >  
   >    return true;
   >  }
   >  
   >  bool obtain_control()
   >  {
   >    dji_sdk::SDKControlAuthority authority;
   >    authority.request.control_enable=1;
   >    sdk_ctrl_authority_service.call(authority);
   >  
   >    if(!authority.response.result)
   >    {
   >      ROS_ERROR("obtain control failed!");
   >      return false;
   >    }
   >  
   >    return true;
   >  }
   >  
   >  bool is_M100()
   >  {
   >    dji_sdk::QueryDroneVersion query;
   >    query_version_service.call(query);
   >  
   >    if(query.response.version == DJISDK::DroneFirmwareVersion::M100_31)
   >    {
   >      return true;
   >    }
   >  
   >    return false;
   >  }
   >  
   >  void attitude_callback(const geometry_msgs::QuaternionStamped::ConstPtr& msg)
   >  {
   >    current_atti = msg->quaternion;
   >  }
   >  
   >  void local_position_callback(const geometry_msgs::PointStamped::ConstPtr& msg)
   >  {
   >    current_local_pos = msg->point;
   >  }
   >  
   >  void gps_callback(const sensor_msgs::NavSatFix::ConstPtr& msg)
   >  {
   >    static ros::Time start_time = ros::Time::now();
   >    ros::Duration elapsed_time = ros::Time::now() - start_time;
   >    current_gps = *msg;
   >  
   >    // Down sampled to 50Hz loop
   >    if(elapsed_time > ros::Duration(0.02))
   >    {
   >      start_time = ros::Time::now();
   >      switch(circle_mission.state)
   >      {
   >        case 0:
   >          break;
   >  	
   >        case 1:
   >          if(!circle_mission.finished)
   >          {
   >            circle_mission.step(current_gps, current_local_pos, current_atti);
   >          }
   >          else
   >          {
   >            circle_mission.reset();
   >            circle_mission.start_gps_location = current_gps;
   >            circle_mission.start_local_position = current_local_pos;
   >            circle_mission.setTarget(10, 0, 3, 5); //设置圆心位置
   >            circle_mission.state = 2;
   >            ROS_INFO("##### Start circle mission ....");
   >          }
   >          break;
   >  
   >        case 2:
   >          if(!circle_mission.finished)
   >          {
   >            circle_mission.step(current_gps, current_local_pos, current_atti);
   >          }
   >          else
   >          {
   >            ROS_INFO("##### Circle mission finished ....");
   >            circle_mission.state = 0;
   >          }
   >          break;
   >      }
   >    }
   >  }
   >  //剩下辅助函数也是没有进行修改
   >  
   >  void flight_status_callback(const std_msgs::UInt8::ConstPtr& msg)
   >  {
   >    flight_status = msg->data;
   >  }
   >  
   >  void display_mode_callback(const std_msgs::UInt8::ConstPtr& msg)
   >  {
   >    display_mode = msg->data;
   >  }
   >  
   >  
   >  /*!
   >   * This function demos how to use the flight_status
   >   * and the more detailed display_mode (only for A3/N3)
   >   * to monitor the take off process with some error
   >   * handling. Note M100 flight status is different
   >   * from A3/N3 flight status.
   >   */
   >  bool
   >  monitoredTakeoff()
   >  {
   >    ros::Time start_time = ros::Time::now();
   >  
   >    if(!takeoff_land(dji_sdk::DroneTaskControl::Request::TASK_TAKEOFF)) {
   >      return false;
   >    }
   >  
   >    ros::Duration(0.01).sleep();
   >    ros::spinOnce();
   >  
   >    // Step 1.1: Spin the motor
   >    while (flight_status != DJISDK::FlightStatus::STATUS_ON_GROUND &&
   >           display_mode != DJISDK::DisplayMode::MODE_ENGINE_START &&
   >           ros::Time::now() - start_time < ros::Duration(5)) {
   >      ros::Duration(0.01).sleep();
   >      ros::spinOnce();
   >    }
   >  
   >    if(ros::Time::now() - start_time > ros::Duration(5)) {
   >      ROS_ERROR("Takeoff failed. Motors are not spinnning.");
   >      return false;
   >    }
   >    else {
   >      start_time = ros::Time::now();
   >      ROS_INFO("Motor Spinning ...");
   >      ros::spinOnce();
   >    }
   >  
   >  
   >    // Step 1.2: Get in to the air
   >    while (flight_status != DJISDK::FlightStatus::STATUS_IN_AIR &&
   >            (display_mode != DJISDK::DisplayMode::MODE_ASSISTED_TAKEOFF || display_mode != DJISDK::DisplayMode::MODE_AUTO_TAKEOFF) &&
   >            ros::Time::now() - start_time < ros::Duration(20)) {
   >      ros::Duration(0.01).sleep();
   >      ros::spinOnce();
   >    }
   >  
   >    if(ros::Time::now() - start_time > ros::Duration(20)) {
   >      ROS_ERROR("Takeoff failed. Aircraft is still on the ground, but the motors are spinning.");
   >      return false;
   >    }
   >    else {
   >      start_time = ros::Time::now();
   >      ROS_INFO("Ascending...");
   >      ros::spinOnce();
   >    }
   >  
   >    // Final check: Finished takeoff
   >    while ( (display_mode == DJISDK::DisplayMode::MODE_ASSISTED_TAKEOFF || display_mode == DJISDK::DisplayMode::MODE_AUTO_TAKEOFF) &&
   >            ros::Time::now() - start_time < ros::Duration(20)) {
   >      ros::Duration(0.01).sleep();
   >      ros::spinOnce();
   >    }
   >  
   >    if ( display_mode != DJISDK::DisplayMode::MODE_P_GPS || display_mode != DJISDK::DisplayMode::MODE_ATTITUDE)
   >    {
   >      ROS_INFO("Successful takeoff!");
   >      start_time = ros::Time::now();
   >    }
   >    else
   >    {
   >      ROS_ERROR("Takeoff finished, but the aircraft is in an unexpected mode. Please connect DJI GO.");
   >      return false;
   >    }
   >  
   >    return true;
   >  }
   >  
   >  
   >  /*!
   >   * This function demos how to use M100 flight_status
   >   * to monitor the take off process with some error
   >   * handling. Note M100 flight status is different
   >   * from A3/N3 flight status.
   >   */
   >  bool
   >  M100monitoredTakeoff()
   >  {
   >    ros::Time start_time = ros::Time::now();
   >  
   >    float home_altitude = current_gps.altitude;
   >    if(!takeoff_land(dji_sdk::DroneTaskControl::Request::TASK_TAKEOFF))
   >    {
   >      return false;
   >    }
   >  
   >    ros::Duration(0.01).sleep();
   >    ros::spinOnce();
   >  
   >    // Step 1: If M100 is not in the air after 10 seconds, fail.
   >    while (ros::Time::now() - start_time < ros::Duration(10))
   >    {
   >      ros::Duration(0.01).sleep();
   >      ros::spinOnce();
   >    }
   >  
   >    if(flight_status != DJISDK::M100FlightStatus::M100_STATUS_IN_AIR ||
   >        current_gps.altitude - home_altitude < 1.0)
   >    {
   >      ROS_ERROR("Takeoff failed.");
   >      return false;
   >    }
   >    else
   >    {
   >      start_time = ros::Time::now();
   >      ROS_INFO("Successful takeoff!");
   >      ros::spinOnce();
   >    }
   >  
   >    return true;
   >  }
   >  
   >  bool set_local_position()
   >  {
   >    dji_sdk::SetLocalPosRef localPosReferenceSetter;
   >    set_local_pos_reference.call(localPosReferenceSetter);
   >    return localPosReferenceSetter.response.result;
   >  }
   >  
   >  
   >  
   >  ```
   >
   >* 本次任务并没有将代码带到实验室上去验证正确性，只是在电脑上完成了整体运行代码的编写。
   >



#### 注意事项：本次demo.cpp文件已经发在dji_demo中的src文件夹中，相应的头文件demo.h放在include文件夹中，可以直接运行。 #### 