#ifndef _NODE_H_
#define _NODE_H_

#include <iostream>
#include <ros/ros.h>
#include <ros/console.h>
#include <Eigen/Eigen>
#include "backward.hpp"

#define inf 1>>20
struct GridNode;
typedef GridNode* GridNodePtr;

struct GridNode
{     
    int id;        // 1--> open set, -1 --> closed set
    Eigen::Vector3d coord; //这是坐标的含义？
    Eigen::Vector3i dir;   // direction of expanding 是不是用这个变量去存储下一个节点的坐标
    			    //可能是存向那个方向走的吧。
    Eigen::Vector3i index;	//这是干啥的？编号用？
				//i应该是int d应该是double
    double gScore, fScore;
    GridNodePtr cameFrom;//这个应该是指向那个父节点的吧
    std::multimap<double, GridNodePtr>::iterator nodeMapIt;

    GridNode(Eigen::Vector3i _index, Eigen::Vector3d _coord){  
		id = 0;
		index = _index;
		coord = _coord;
		dir   = Eigen::Vector3i::Zero();

		gScore = inf;
		fScore = inf;
		cameFrom = NULL;
    }

    GridNode(){};
    ~GridNode(){};
};


#endif
