### 代码解读

#### 代码运行流程
**见文件：src/grid\_path\_searcheer/src/demo\_node.cpp** 

**主函数 main** 

```cpp
int main(int argc, char** argv)
{
    ......
    // 订阅到地图信息的回调函数
    _map_sub  = nh.subscribe( "map",       1, rcvPointCloudCallBack );
    // 订阅到终点信息的回调函数
    _pts_sub  = nh.subscribe( "waypoints", 1, rcvWaypointsCallback );
    ......
    // 定义了结构体AstarPathFinder变量_astar_path_finder，该结构体存储、实现了Astar路径规划所需的所有信息和功能
    _astar_path_finder  = new AstarPathFinder();
    _astar_path_finder  -> initGridMap(_resolution, _map_lower, _map_upper, _max_x_id, _max_y_id, _max_z_id);

    _jps_path_finder    = new JPSPathFinder();
    _jps_path_finder    -> initGridMap(_resolution, _map_lower, _map_upper, _max_x_id, _max_y_id, _max_z_id);
}
```

**回调函数 rcvPointCloudCallBack**

```cpp
void rcvPointCloudCallBack(const sensor_msgs::PointCloud2 & pointcloud_map)
{
    ......
    // 将障碍物信息设置进入栅格化地图，为后续路径规划做准备
    _astar_path_finder->setObs(pt.x, pt.y, pt.z);
    _jps_path_finder->setObs(pt.x, pt.y, pt.z);

    // 可视化地图部分
    ......
    map_vis.header.frame_id = "/world";
    _grid_map_vis_pub.publish(map_vis);
    ......
}
```

**回调函数 rcvWaypointsCallback**

```cpp
void rcvWaypointsCallback(const nav_msgs::Path & wp)
{
    // 获取交互式界面给出的终点坐标
    Vector3d target_pt;
    target_pt << wp.poses[0].pose.position.x,
                 wp.poses[0].pose.position.y,
                 wp.poses[0].pose.position.z;
    ......

    // 输入起点、终点、调用pathFind函数
    pathFinding(_start_pt, target_pt); 
}
```

**路径规划函数 pathFinding**

```cpp
void pathFinding(const Vector3d start_pt, const Vector3d target_pt)
{
    // 使用A*进行路径搜索
    _astar_path_finder->AstarGraphSearch(start_pt, target_pt);

    // 获取规划的路径
    auto grid_path     = _astar_path_finder->getPath();
    auto visited_nodes = _astar_path_finder->getVisitedNodes();

    // 可视化结果
    visGridPath (grid_path, false);
    visVisitedNode(visited_nodes);

    // 为下次规划重置地图
    _astar_path_finder->resetUsedGrids();

    // 进行JPS路径规划编写时，将_use_jps的值置为1即可
#define _use_jps 0
#if _use_jps
    {
        // 使用JPS进行路径搜索
        _jps_path_finder -> JPSGraphSearch(start_pt, target_pt);
        ......
    }
#endif
}
```

#### 涉及类和结构体的简介

**节点表⽰：⽤结构体变量 GridNode表⽰，存储了节点的坐标、g(n)、f(n)值、⽗节点指针等信息。**

```cpp
struct GridNode
{     
    int id;        // 1--> open set, -1 --> closed set
    Eigen::Vector3d coord; 
    Eigen::Vector3i dir;   // direction of expanding
    Eigen::Vector3i index;
	
    double gScore, fScore;
    GridNodePtr cameFrom;
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
```

**父类AstarPathFinder**

```cpp
class AstarPathFinder
{
    private:

	protected:
        ......
        // open set实现：用C++ STL中的multimap
        std::multimap<double, GridNodePtr> openSet;

        // 启发式函数（待完成）
        double getHeu(GridNodePtr node1, GridNodePtr node2);

        // 拓展节点函数（待完成）
        void AstarGetSucc(GridNodePtr currentPtr, std::vector<GridNodePtr> & neighborPtrSets, std::vector<double> & edgeCostSets);
    public:
        ......
        // A*搜索算法函数（待完成）
        void AstarGraphSearch(Eigen::Vector3d start_pt, Eigen::Vector3d end_pt);
        ......
}
```

**open set实现：⽤C++ STL中的multimap实现，multimap将{key,value}当做元素，允许重复元素。multimap根据key的排序准则⾃动将元素排序，因此使⽤时只需考虑插⼊和删除操作即可。**

**继承类JPSPathFinder**

```cpp
class JPSPathFinder: public AstarPathFinder
{
    ......
    // JPS 的拓展节点函数，已经完成
    void JPSGetSucc(GridNodePtr currentPtr, std::vector<GridNodePtr> & neighborPtrSets, std::vector<double> & edgeCostSets);

    //JPS 搜索算法函数，主体框架和 A\*一致，只要用心对照修改，在完成了A*的基础，使用提供的函数接口完成JPS难度不大
    void JPSGraphSearch(Eigen::Vector3d start_pt, Eigen::Vector3d end_pt);
}
```

