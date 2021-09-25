clc
clear
% 遗传算法

% 目标函数优类型;1最大化，-1最小化
Obj_minmax=1;

% 种群规模：个体个数
NumofPPU=50;

% 最大遗传代数
NumofGEN=60;

% 基因长度
LenofCH=20;

% 代沟
Gap=0.9;

% 变量取值上限
Up=2.5;
% 变量取值下限
Down=-1;

% 是否选择格雷编码 ：1是 0 否

Choice_Gray=1;

% 是否选择对数标度:1是 0否
Choice_Log=0;

% 遗传迭代性能跟踪器
Tracer=zeros(NumofGEN,2);

% 区域描述器
Fielder=[LenofCH;Down;Up;1-Choice_Gray;Choice_Log;1;1];

% 初始化种群
Population=crtbp(NumofPPU,LenofCH);

% 当前遗传
Cur_GEN=0;

% 翻译初始化种群为10进制
X=bs2rv(Population,Fielder);

% 计算目标函数值
Value=fun(X);

TmpX=Down:0.01:Up;
plot(TmpX,fun(TmpX));
xlabel('x');
ylabel('y');
title('一元函数优化结果');
hold on;


% 开始种群进化
while(Cur_GEN<NumofGEN)
    %计算目标函数的适应度
    Fit_value=ranking(-Obj_minmax*Value);
    
    %使用轮盘算法选择
    Sel_population=select('rws',Population,Fit_value,Gap);
    
    %交叉
    Sel_population=recombin('xovsp',Sel_population);
    
    %变异
    Sel_population=mut(Sel_population);
    
    %子代个体翻译
    X=bs2rv(Sel_population,Fielder);
    
    %子代个体对应目标函数值
    Sub_value=fun(X);

    %根据目标函数值将子代个插入新种群
    [Population,Value]=reins(Population,Sel_population,1,1,Obj_minmax*Value,Obj_minmax*Sub_value);
    
    %寻找当前种群的最优解
    [Fun_value,index]=max(Value);
    
    % 翻译更新后种群为10进制
    X=bs2rv(Population,Fielder);
    
    Fun_value=Fun_value*Obj_minmax;
    
    Value=Value*Obj_minmax;
    
    
    %当前遗传代数加一
    Cur_GEN=Cur_GEN+1;
    
    tracer(Cur_GEN,1)=Fun_value;
    
    tracer(Cur_GEN,2)=mean(Value);
    
end


plot(X(index),Fun_value,'r *');
figure;

plot(tracer(:,1),'r-*');
hold on;

plot(tracer(:,2),'b-o');
legend('各子代种群最优解','各子代种群平均值');
xlabel('迭代次数');
ylabel('目标函数优化情况');
title('一元函数优化过程');





























