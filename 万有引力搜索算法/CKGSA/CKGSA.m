% Chaotic Kbest Gravitational Search Algorithm.
% 混沌K最优引力搜索算法

function [Fbest,Lbest,BestChart,MeanChart]=CKGSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower,Variant)

%V:   Velocity. 速度
%a:   Acceleration. 加速度
%M:   Mass.  Ma=Mp=Mi=M; 重量
%dim: Dimension of the test function. 测试函数的维数
%N:   Number of agents. 物体的数量
%X:   Position of agents. dim-by-N matrix. 位置矩阵
%R:   Distance between agents in search space. 物体间的欧式距离
%[low-up]: Allowable range for search space. 搜索空间边界

%Rnorm:  Norm
%Rpower: Power of R
 
Rnorm=2; 
 
%get allowable range and dimension of the test function.
% 获取测试函数的维度和边界。
[low,up,dim]=test_functions_range(F_index); 

%random initialization for agents.
% 随机初始化物体的位置
X=initialization(dim,N,up,low); 

%create the best so far chart and average fitnesses chart.
% 创建迄今为止最好的图表和平均拟合图。
BestChart=[];MeanChart=[];
V=zeros(N,dim);

for iteration=1:max_it
%     iteration 开始迭代
    
    %Checking allowable range. 边界检查 
    X=space_bound(X,up,low); 

    %Evaluation of agents. 评价此时每个物体的适应度
    fitness=evaluateF(X,F_index); 
    
    if min_flag==1
    [best best_X]=min(fitness); %minimization.
    else
    [best best_X]=max(fitness); %maximization.
    end        
    
    if iteration==1
       Fbest=best;Lbest=X(best_X,:);
    end
    
    if min_flag==1
      if best<Fbest  %minimization.
       Fbest=best;Lbest=X(best_X,:);
      end
    else 
      if best>Fbest  %maximization
       Fbest=best;Lbest=X(best_X,:);
      end
    end
      
BestChart=[BestChart Fbest];
MeanChart=[MeanChart mean(fitness)];

%Calculation of M. 根据每个物体的适应度重新计算物体的重量
[M]=massCalculation(fitness,min_flag); 

%Calculation of Gravitational constant. 更新万有引力常数
G=Gconstant(iteration,max_it); 

%Calculation of accelaration in gravitational field. 更新每个物体的加速度
a=ckGfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it,Variant);

%Agent movement. 移动每个物体
[X,V]=move(X,a,V);

end %iteration

