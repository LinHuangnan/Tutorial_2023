#include "pid.h"


pid_process::pid_process(/* args */)
{
    error.v_x=0;
    error.v_y=0;
    error.v_z=0;
    last_error.v_x=0;
    last_error.v_y=0;
    last_error.v_z=0;
} 
void pid_process::pid_init(PID pid)
{
    pid_.kp=pid.kp;
    pid_.ki=pid.ki;
    pid_.kd=pid.kd;
    pid_.max_output.v_x=pid.max_output.v_x;
    pid_.max_output.v_y=pid.max_output.v_y;
    pid_.max_output.v_z=pid.max_output.v_z;
    pid_.max_integral.v_x=pid.max_integral.v_x;
    pid_.max_integral.v_y=pid.max_integral.v_y;
    pid_.max_integral.v_z=pid.max_integral.v_z;
}

void pid_process::pid_calculate(POSITION now,POSITION traget)
{
    last_error.v_x=error.v_x;
    last_error.v_y=error.v_y;
    last_error.v_z=error.v_z;
    error.v_x=traget.x-now.x;
    error.v_y=traget.y-now.y;
    error.v_z=traget.z-now.z;
    pout.v_x=error.v_x*pid_.kp;
    pout.v_y=error.v_y*pid_.kp;
    pout.v_z=error.v_z*pid_.kp;
    dout.v_x=(error.v_x-last_error.v_x)*pid_.kd;
    dout.v_y=(error.v_y-last_error.v_y)*pid_.kd;
    dout.v_z=(error.v_z-last_error.v_z)*pid_.kd;
    integral.v_x+=error.v_x*pid_.ki;
    integral.v_y+=error.v_y*pid_.ki;
    integral.v_z+=error.v_z*pid_.ki;
    if(integral.v_x>pid_.max_integral.v_x)
    {
        integral.v_x=pid_.max_integral.v_x;
    }
    else if (integral.v_y>pid_.max_integral.v_y)
    {
        integral.v_y=pid_.max_integral.v_y;
    }
    else if (integral.v_z>pid_.max_integral.v_z)
    {
        integral.v_z=pid_.max_integral.v_z;
    }        
    output.v_x=pout.v_x+dout.v_x+integral.v_x;
    output.v_y=pout.v_y+dout.v_y+integral.v_y;
    output.v_z=pout.v_z+dout.v_z+integral.v_z;
    if (output.v_x>pid_.max_output.v_x)
    {
        output.v_x=pid_.max_output.v_x;
    }
    else if (output.v_y>pid_.max_output.v_y)
    {
        output.v_x=pid_.max_output.v_y;
    }
        else if (output.v_z>pid_.max_output.v_z)
    {
        output.v_z=pid_.max_output.v_z;
    }
    
}
SPEED pid_process::get_output(void)
{
    return output;
}