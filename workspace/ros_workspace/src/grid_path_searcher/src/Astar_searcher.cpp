#include "Astar_searcher.h"
#include"cmath"
#include<algorithm>
using namespace std;
using namespace Eigen;

void AstarPathFinder::initGridMap(double _resolution, Vector3d global_xyz_l, Vector3d global_xyz_u, int max_x_id, int max_y_id, int max_z_id)
{   
    gl_xl = global_xyz_l(0);
    gl_yl = global_xyz_l(1);
    gl_zl = global_xyz_l(2);

    gl_xu = global_xyz_u(0);
    gl_yu = global_xyz_u(1);
    gl_zu = global_xyz_u(2);
    
    GLX_SIZE = max_x_id;
    GLY_SIZE = max_y_id;
    GLZ_SIZE = max_z_id;
    GLYZ_SIZE  = GLY_SIZE * GLZ_SIZE;
    GLXYZ_SIZE = GLX_SIZE * GLYZ_SIZE;

    resolution = _resolution;
    inv_resolution = 1.0 / _resolution;    

    data = new uint8_t[GLXYZ_SIZE];
    memset(data, 0, GLXYZ_SIZE * sizeof(uint8_t));
    
    GridNodeMap = new GridNodePtr ** [GLX_SIZE];
    for(int i = 0; i < GLX_SIZE; i++){
        GridNodeMap[i] = new GridNodePtr * [GLY_SIZE];
        for(int j = 0; j < GLY_SIZE; j++){
            GridNodeMap[i][j] = new GridNodePtr [GLZ_SIZE];
            for( int k = 0; k < GLZ_SIZE;k++){
                Vector3i tmpIdx(i,j,k);
                Vector3d pos = gridIndex2coord(tmpIdx);
                GridNodeMap[i][j][k] = new GridNode(tmpIdx, pos);
            }
        }
    }
}

void AstarPathFinder::resetGrid(GridNodePtr ptr)
{
    ptr->id = 0;
    ptr->cameFrom = NULL;
    ptr->gScore = inf;
    ptr->fScore = inf;
}

void AstarPathFinder::resetUsedGrids()
{   
    for(int i=0; i < GLX_SIZE ; i++)
        for(int j=0; j < GLY_SIZE ; j++)
            for(int k=0; k < GLZ_SIZE ; k++)
                resetGrid(GridNodeMap[i][j][k]);
}

void AstarPathFinder::setObs(const double coord_x, const double coord_y, const double coord_z)
{
    if( coord_x < gl_xl  || coord_y < gl_yl  || coord_z <  gl_zl || 
        coord_x >= gl_xu || coord_y >= gl_yu || coord_z >= gl_zu )
        return;

    int idx_x = static_cast<int>( (coord_x - gl_xl) * inv_resolution);
    int idx_y = static_cast<int>( (coord_y - gl_yl) * inv_resolution);
    int idx_z = static_cast<int>( (coord_z - gl_zl) * inv_resolution);      

    data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] = 1;
}

vector<Vector3d> AstarPathFinder::getVisitedNodes()
{   
    vector<Vector3d> visited_nodes;
    for(int i = 0; i < GLX_SIZE; i++)
        for(int j = 0; j < GLY_SIZE; j++)
            for(int k = 0; k < GLZ_SIZE; k++){   
                //if(GridNodeMap[i][j][k]->id != 0) // visualize all nodes in open and close list
                if(GridNodeMap[i][j][k]->id == -1)  // visualize nodes in close list only
                    visited_nodes.push_back(GridNodeMap[i][j][k]->coord);
            }

    ROS_WARN("visited_nodes size : %d", visited_nodes.size());
    return visited_nodes;
}

Vector3d AstarPathFinder::gridIndex2coord(const Vector3i & index) 
{
    Vector3d pt;

    pt(0) = ((double)index(0) + 0.5) * resolution + gl_xl;
    pt(1) = ((double)index(1) + 0.5) * resolution + gl_yl;
    pt(2) = ((double)index(2) + 0.5) * resolution + gl_zl;

    return pt;
}

Vector3i AstarPathFinder::coord2gridIndex(const Vector3d & pt) 
{
    Vector3i idx;
    idx <<  min( max( int( (pt(0) - gl_xl) * inv_resolution), 0), GLX_SIZE - 1),
            min( max( int( (pt(1) - gl_yl) * inv_resolution), 0), GLY_SIZE - 1),
            min( max( int( (pt(2) - gl_zl) * inv_resolution), 0), GLZ_SIZE - 1);                  
  
    return idx;
}

Eigen::Vector3d AstarPathFinder::coordRounding(const Eigen::Vector3d & coord)
{
    return gridIndex2coord(coord2gridIndex(coord));
}

inline bool AstarPathFinder::isOccupied(const Eigen::Vector3i & index) const
{
    return isOccupied(index(0), index(1), index(2));
}

inline bool AstarPathFinder::isFree(const Eigen::Vector3i & index) const
{
    return isFree(index(0), index(1), index(2));
}

inline bool AstarPathFinder::isOccupied(const int & idx_x, const int & idx_y, const int & idx_z) const 
{
    return  (idx_x >= 0 && idx_x < GLX_SIZE && idx_y >= 0 && idx_y < GLY_SIZE && idx_z >= 0 && idx_z < GLZ_SIZE && 
            (data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] == 1));
}//

inline bool AstarPathFinder::isFree(const int & idx_x, const int & idx_y, const int & idx_z) const 
{
    return (idx_x >= 0 && idx_x < GLX_SIZE && idx_y >= 0 && idx_y < GLY_SIZE && idx_z >= 0 && idx_z < GLZ_SIZE && 
           (data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] < 1));
}

inline void AstarPathFinder::AstarGetSucc(GridNodePtr currentPtr, vector<GridNodePtr> & neighborPtrSets, vector<double> & edgeCostSets)
{   
    neighborPtrSets.clear();//存放邻居的
    edgeCostSets.clear();//存放与终点距离的
    /*
    *
    STEP 4: finish AstarPathFinder::AstarGetSucc yourself 
    please write your code below
    *
    *
    */
//GridNodePtr *** GridNodeMap;
    if(currentPtr==nullptr) return;
    //要遍历它的四个邻节点，首先是把坐标提取出来，根据坐标遍历在地图找到点，然后给他丢到一个nodePtr变量里面，进一步判断它是不是个合格的邻居
     currentPtr->id=-1;//访问过了死集
     //提取坐标
     int current_x=currentPtr->index(0);
     int current_y=currentPtr->index(1);
     int current_z=currentPtr->index(2);
    //给它的坐标换个名字，不然老长了
     auto this_coord=currentPtr->coord;
    //给它的邻居也准备一个
     Eigen::Vector3d n_coord;
    //准备好存新坐标的变量
      int n_x,n_y,n_z;
     //把丢到的nodeptr的变量准备好
    GridNodePtr nPtr=nullptr;
    double dist;//存距离的哇
     //遍历邻居
    for(int i=-1;i<=1;i++){
      for(int j=-1;j<=1;j++){
        for(int k=-1;k<=1;k++){
        if(i==0&&j==0&&k==0) continue;//防止进到自己身上
        n_x=current_x+i;
        n_y=current_y+j;
        n_z=current_z+k;
        //判断在边界内，注意坐标是整数，可参考上面的函数
       if((n_x <0) || (n_x > (GLX_SIZE-1)) ||( n_y<0) ||(n_y> (GLY_SIZE-1))||(n_z <0 )|| (n_z > (GLZ_SIZE-1))) continue;
       //判断是否是有用的点点，障碍物,data
       if(isOccupied(n_x,n_y,n_z)) continue;
       //丢到nPtr里看看是不是合格邻居
       nPtr=GridNodeMap[n_x][n_y][n_z];
       if(nPtr->id==-1) continue;//死的哦，还访问个鬼哦
       if(nPtr==currentPtr) cout<<"Error"<<"\n";
       n_coord=nPtr->coord;
        dist = std::sqrt( (n_coord[0] - this_coord[0]) * (n_coord[0] - this_coord[0])+
                        (n_coord[1] - this_coord[1]) * (n_coord[1] - this_coord[1])+
                        (n_coord[2] - this_coord[2]) * (n_coord[2] - this_coord[2]));
       //准备就绪push push
       neighborPtrSets.push_back(nPtr);
       edgeCostSets.push_back(dist);

     }
   }
}
     
   
}

double AstarPathFinder::getHeu(GridNodePtr node1, GridNodePtr node2)
{
    /* 
    choose possible heuristic function you want
    Manhattan, Euclidean, Diagonal, or 0 (Dijkstra)
    Remember tie_breaker learned in lecture, add it here ?
    *
    *
    *
    STEP 1: finish the AstarPathFinder::getHeu , which is the heuristic function
    please write your code below
    *
    *
    */
    double h;//估价
    auto coord1=node1->coord;//node1的坐标
    auto coord2=node2->coord;//node2的坐标
  //  h=sqrt(pow((coord1(0)-coord2(0)),2)+pow((coord1(1)-coord2(1)),2)+pow((coord1(2)-coord2(2)),2));//欧拉距离
//曼哈顿
  //h=abs(coord1(0)-coord2(0)+abs(coord1(1)-coord2(1))+abs(coord1(2)-coord2(2)));
//对角线函数
   double dis_x=abs(coord1(0)-coord2(0));
   double dis_y=abs(coord1(1)-coord2(1));
   double dis_z=abs(coord1(2)-coord2(2));
   double min1=dis_x;
   if(min1>dis_y) min1=dis_y;
   if(min1>dis_z) min1=dis_z;
   h=dis_x+dis_y+dis_z+(sqrt(3.0)-3)*min1;
//加个tie_breaker打破对称，打破！打破！！！
   h*=1.000001;//也可以用cross来着，但是函数应该要多给个start的信息
    //tie-breaker2
      
   return h;//return h还是return 0 哦;//还有个参数看看要不要设置
}

void AstarPathFinder::AstarGraphSearch(Vector3d start_pt, Vector3d end_pt)
{   
    ros::Time time_1 = ros::Time::now();    

    //index of start_point and end_point
    Vector3i start_idx = coord2gridIndex(start_pt);//这个函数是什么东东
    Vector3i end_idx   = coord2gridIndex(end_pt);
    goalIdx = end_idx;

    //position of start_point and end_point
    start_pt = gridIndex2coord(start_idx);//？？
    end_pt   = gridIndex2coord(end_idx);

    //Initialize the pointers of struct GridNode which represent start node and goal node
    GridNodePtr startPtr = new GridNode(start_idx, start_pt);
    GridNodePtr endPtr   = new GridNode(end_idx,   end_pt);

    //openSet is the open_list implemented through multimap in STL library
    openSet.clear();
    // currentPtr represents the node with lowest f(n) in the open_list
    GridNodePtr currentPtr  = NULL;
    GridNodePtr neighborPtr = NULL;

    //put start node in open set
    startPtr -> gScore = 0;//当前价
    startPtr -> fScore = getHeu(startPtr,endPtr);//总价   
    //STEP 1: finish the AstarPathFinder::getHeu , which is the heuristic function
    startPtr -> id = 1; //已经被访问了？
    startPtr -> coord = start_pt;//坐标
    openSet.insert( make_pair(startPtr -> fScore, startPtr) );// std::multimap<double, GridNodePtr> openSet;
    /*
    *
    STEP 2 :  some else preparatory works which should be done before while loop
    please write your code below
    *
    *
    */
    GridNodeMap[start_idx[0]][start_idx[1]][start_idx[2]]->id=1;//代表已经被访问 
    vector<GridNodePtr> neighborPtrSets;
    vector<double> edgeCostSets;

    // this is the main loop
    while ( !openSet.empty() ){
        /*
        *
        *
        step 3: Remove the node with lowest cost function from open set to closed set
        please write your code below
        
        IMPORTANT NOTE!!!
        This part you should use the C++ STL: multimap, more details can be find in Homework description
        *
        *
        */
       //要将openset最开头那个也就是key最小，预估价最小的点点放到current中
        int x=openSet.begin()->second->index(0);
        int y=openSet.begin()->second->index(1);
        int z=openSet.begin()->second->index(2);
        openSet.erase(openSet.begin());//访问过了就踢出去
        currentPtr=GridNodeMap[x][y][z];//怎么躲避障碍物的，难道创建地图的时候，把可疑障碍物标记了，id标记的
         if(currentPtr->id==-1) continue;//死集就返回
         
        // if the current node is the goal 
        if( currentPtr->index == goalIdx ){//current就是终点啦
            ros::Time time_2 = ros::Time::now();
            terminatePtr = currentPtr;
            ROS_WARN("[A*]{sucess}  Time in A*  is %f ms, path cost if %f m", (time_2 - time_1).toSec() * 1000.0, currentPtr->gScore * resolution );            
            return;
        }
        //get the succetion
        AstarGetSucc(currentPtr, neighborPtrSets, edgeCostSets);  //STEP 4: finish AstarPathFinder::AstarGetSucc yourself     

        /*
        *
        *
        STEP 5:  For all unexpanded neigbors "m" of node "n", please finish this for loop
        please write your code below
        *        
        */         
        for(int i = 0; i < (int)neighborPtrSets.size(); i++){
            /*
            *
            *
            Judge if the neigbors have been expanded
            please write your code below
            
            IMPORTANT NOTE!!!
            neighborPtrSets[i]->id = -1 : expanded, equal to this node is in close set
            neighborPtrSets[i]->id = 1 : unexpanded, equal to this node is in open set
            *        
            */
            //在非常非常前面出现过定义
           neighborPtr=neighborPtrSets[i];
            if(neighborPtr -> id == 0){ //discover a new node, which is not in the closed set and open set
                /*
                *
                *
                STEP 6:  As for a new node, do what you need do ,and then put neighbor in open set and record it
                please write your code below
                *        
                */
                 //没访问过嘛，那就pushpush
                 //注意注意fSorce是总价
                 neighborPtr->gScore=currentPtr->gScore+edgeCostSets[i];
                 neighborPtr->fScore=neighborPtr->gScore+ getHeu(neighborPtr,endPtr);
                 neighborPtr->cameFrom=currentPtr;
                 openSet.insert(make_pair(neighborPtr -> fScore, neighborPtr));
                neighborPtr -> id = 1;//标记已经访问过了
                continue;
            }
            else if(neighborPtr->id==1){ //this node is in open set and need to judge if it needs to update, the "0" should be deleted when you are coding
                /*
                *
                *
                STEP 7:  As for a node in open set, update it , maintain the openset ,and then put neighbor in open set and record it
                please write your code below
                *        
                */
                 //重新给价//它的估价是一样的，看是否要更新当前价就好了
                 if(neighborPtr->gScore>(currentPtr->gScore+edgeCostSets[i])){
                    neighborPtr->gScore=currentPtr->gScore+edgeCostSets[i];
                 neighborPtr->fScore=neighborPtr->gScore+ getHeu(neighborPtr,endPtr);
                 neighborPtr->cameFrom=currentPtr;
                 }
              
                continue;
            }
            else{//this node is in closed set
                /*
                *
                please write your code below
                *        
                */
                //它死啦不管了，不管了
                continue;
            }
        }      
    }
    //if search fails
    ros::Time time_2 = ros::Time::now();
    if((time_2 - time_1).toSec() > 0.1)
        ROS_WARN("Time consume in Astar path finding is %f", (time_2 - time_1).toSec() );
}


vector<Vector3d> AstarPathFinder::getPath() 
{   
    vector<Vector3d> path;
    vector<GridNodePtr> gridPath;
    //怎么传入终点信息呢，注意注意头文件里有个指针在finder函数里被设为了终点
    /*
    *
    *
    STEP 8:  trace back from the curretnt nodePtr to get all nodes along the path
    please write your code below
    *      
    */
    auto p=terminatePtr;//反着找
    while(p->cameFrom!=NULL){
      gridPath.push_back(p);
      p=p->cameFrom;
  }

    for (auto ptr: gridPath)
        path.push_back(ptr->coord);
        
    reverse(path.begin(),path.end());

    return path;
}
