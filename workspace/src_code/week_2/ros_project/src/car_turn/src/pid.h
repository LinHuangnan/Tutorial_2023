#ifndef __PARSER_H
#define __PARSER_H
#include "pid.h"
struct POSITION
{
    float x;
    float y;
    float z;
};
struct SPEED
{
    float v_x;
    float v_y;
    float v_z;
};
struct PID
{
    float kp,ki,kd;
    SPEED max_output;
    SPEED max_integral;
};
class pid_process
{
private:
    PID pid_;
    SPEED error,last_error;
    SPEED output;
    SPEED pout ,dout ,integral;
public:
    pid_process();
    void pid_init(PID pid);
    void pid_calculate(POSITION now,POSITION traget);
    SPEED get_output(void);
};
#endif



