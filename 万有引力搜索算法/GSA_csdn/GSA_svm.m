function [Fbest,Lbest,BestChart,MeanChart]=GSA_svm(objfun,N,max_it,ElitistCheck,min_flag,Rpower,...
    train_wine_labels,train_wine,test_wine_labels,test_wine)
% 说明
% Main function for Gravitational Search Algorithm.
% V: 速度 Velocity.
% a: 加速度 Acceleration.
% M: 惯性质量 Mass. Ma=Mp=Mi=M;
% dim: 自变量维度 Dimension of the test function.
% N: 种群规模 Number of agents.
% X: 个体位置集，一个N*dim矩阵 Position of agents. dim-by-N matrix.
% R: 个体距离 Distance between agents in search space.
% [low-up]: 参数范围 Allowable range for search space.
% Rnorm: 范数，参考文献公式8 Norm in eq.8.
% Rpower: 参考文献公式7 Power of R in eq.7.

Rnorm=2; % 使用二阶范数 
% 获取目标函数参数界限、维数 get allowable range and dimension of the test function.
low=0.01;
up=100;
dim=2;
% 随机初始化种群 random initialization for agents.
X=initialization(dim,N,up,low); 
% 用于保存当前最优值和平均适应度值变化情况 create the best so far chart and average fitnesses chart.
BestChart=zeros(1,max_it);
MeanChart=zeros(1,max_it);
% 初始化个体解
V=zeros(N,dim);
for iteration=1:max_it
    % 检查是否越界 Checking allowable range. 
    X=space_bound(X,up,low);
    % 计算个体适应度函数值 Evaluation of agents.
    fitness=zeros(1,N);
    for agent=1:N
        fitness(1,agent)=objfun(X(agent,:),train_wine_labels,train_wine,test_wine_labels,test_wine);
    end
    % 寻找当前迭代最优个体
    if min_flag==1
        [best,best_X]=min(fitness); % 最小化情况 minimization.
    else
        [best,best_X]=max(fitness); % 最大化情况 maximization.
    end
    if iteration==1
       Fbest=best;
       Lbest=X(best_X,:);
    end
    % 更新目前为止最优个体
    if min_flag==1
        if best<Fbest % 最小化情况 minimization.
            Fbest=best;
            Lbest=X(best_X,:);
        end
    else
        if best>Fbest % 最大化情况 maximization
            Fbest=best;
            Lbest=X(best_X,:);
        end
    end
    BestChart(iteration)=Fbest;
    MeanChart(iteration)=mean(fitness);
    % 计算惯性质量M（文献公式14—20） Calculation of M. eq.14-20
    M=massCalculation(fitness,min_flag);
    % 计算引力常亮（文献公式13） Calculation of Gravitational constant. eq.13.
    G=Gconstant(iteration,max_it);
    % 计算加速度 Calculation of accelaration in gravitational field. eq.7-10,21.
    a=Gfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it);
    % 个体移动 Agent movement. eq.11-12
    [X,V]=move(X,a,V);
end