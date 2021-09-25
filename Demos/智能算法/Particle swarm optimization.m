PopSize=500;%种群大小
CityNum = 14;%城市数
OldBestFitness=0;%旧的最优适应度值
Iteration=0;%迭代次数
MaxIteration =2000;%最大迭代次数
IsStop=0;%程序停止标志 
Num=0;%取得相同适应度值的迭代次数

c1=0.5;%自我认知系数
c2=0.7;%社会学习系数

%===========================Attention=====================================
%做出了新的优化--解空间的搜索能力在随着迭代次数的增加和解空间的缩小的趋势下减少，提高算法的效率！
w=0.96-Iteration/MaxIteration;%惯性系数,随迭代次数增加而递减

%节点坐标
node=[16.47 96.10; 16.47 94.44; 20.09 92.54; 22.39 93.37; 25.23 97.24;...
     22.00 96.05; 20.47 97.02; 17.20 96.29; 16.30 97.38; 14.05 98.12;...
     16.53 97.38; 21.52 95.59; 19.41 97.13; 20.09 94.55];

%初始化各粒子，即产生路径种群
Group=ones(CityNum,PopSize);   
for i=1:PopSize
    Group(:,i)=randperm(CityNum)';
end

Group=sort(Group);

%初始化粒子速度（即交换序）
Velocity =zeros(CityNum,PopSize);   
for i=1:PopSize
    Velocity(:,i)=round(rand(1,CityNum)'*CityNum); %round取整
end

%计算每个城市之间的距离
CityBetweenDistance=zeros(CityNum,CityNum);   
for i=1:CityNum
    for j=1:CityNum
        CityBetweenDistance(i,j)=sqrt((node(i,1)-node(j,1))^2+(node(i,2)-node(j,2))^2);
    end
end

%计算每条路径的距离
% EachPathDis=zeros(1,PopSize);%
for i=1:PopSize   
        EachPathDis(i) = PathDistance(Group(:,i)',CityBetweenDistance);
end

IndivdualBest=Group;%记录各粒子的个体极值点位置,即个体找到的最短路径
IndivdualBestFitness=EachPathDis;%记录最佳适应度值,即个体找到的最短路径的长度
[GlobalBestFitness,index]=min(EachPathDis);%找出全局最优值和相应序号 

%初始随机解
figure;
subplot(2,2,1);
PathPlot(node,CityNum,index,IndivdualBest);
title('随机解');

%寻优
while(IsStop == 0) && (Iteration < MaxIteration) 
    %迭代次数递增
    Iteration = Iteration +1;  
    
    %更新全局极值点位置,这里指路径
    for i=1:PopSize   
        GlobalBest(:,i) = Group(:,index);
      
    end
    
    %求pij-xij ,pgj-xij交换序，并以概率c1，c2的保留交换序
    pij_xij=GenerateChangeNums(Group,IndivdualBest);  
    pij_xij=HoldByOdds(pij_xij,c1); 
    pgj_xij=GenerateChangeNums(Group,GlobalBest);
    pgj_xij=HoldByOdds(pgj_xij,c2);
    
    %以概率w保留上一代交换序
    Velocity=HoldByOdds(Velocity,w);

    Group = PathExchange(Group,Velocity); %根据交换序进行路径交换
    Group = PathExchange(Group,pij_xij);
    Group = PathExchange(Group,pgj_xij);
    for i = 1:PopSize    % 更新各路径总距离
          EachPathDis(i) = PathDistance(Group(:,i)',CityBetweenDistance);
    
    end

    IsChange = EachPathDis<IndivdualBestFitness;%更新后的距离优于更新前的，记录序号
    IndivdualBest(:, find(IsChange)) = Group(:, find(IsChange));%更新个体最佳路径
    IndivdualBestFitness = IndivdualBestFitness.*( ~IsChange) + EachPathDis.*IsChange;%更新个体最佳路径距离
    [GlobalBestFitness, index] = min(EachPathDis);%更新全局最佳路径,记录相应的序号
   
    if GlobalBestFitness==OldBestFitness %比较更新前和更新后的适应度值;
        Num=Num+1; %相等时记录加一;
    else
        OldBestFitness=GlobalBestFitness;%不相等时更新适应度值，并记录清零;
        Num=0;
    end    
    if Num >= 20 %多次迭代的适应度值相近时程序停止
        IsStop=1;
    end

     BestFitness(Iteration) =GlobalBestFitness;%每一代的最优适应度


end

%最优解
subplot(2,2,2);
PathPlot(node,CityNum,index,IndivdualBest);
title('优化解');
%进化曲线
subplot(2,2,3);
plot((1:Iteration),BestFitness(1:Iteration));
grid on;
title('进化曲线');
%最小路径值
GlobalBestFitness