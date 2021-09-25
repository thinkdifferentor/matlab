clc
clear
% 模拟退火算法

% 目标函数优类型;1最大化，-1最小化
Obj_minmax=1;

% 变量取值上限
Up=2.5;

% 变量取值下限
Down=-1;

% 取中间值
Mid=(Up+Down)/5;

% 温度衰减速率
yita=0.99;

% 退火算法迭代性能跟踪器
Tracer=[];

% 迭代次数参数
Iteration=3000;

TmpX=Down:0.01;Up;

Fun_value=fun(TmpX);

%模拟初始温度
Tmper=max(Fun_value)-min(Fun_value);

plot(TmpX,Fun_value);
xlabel('x');
ylabel('y');
title('一元函数优化结果');
hold on;

% 获取在区间[dow, up]之间的随机数
Random1=rand*(Up - Down)+Down;

% 求解随机数所对应的函数值--随机产生初始状态
Fun_random1=fun(Random1);

% 当前迭代次数
Cur_Iteration=0;

% 在图像中标记初始位置
plot(Random1,Fun_random1,'ro','linewidth',2);

% 开始退火迭代
while (Cur_Iteration<Iteration)
    %在当前迭代点附近随机产生下一个迭代点位置
    Random2=Random1+(2*rand-1)*Mid;
    %保留所在考察区域内
    Random2=min(Random2,Up);
    Random2=max(Random2,Down);
    
    Fun_random2=fun(Random2);
    
    %迭代点优于当前点，接受迭代结果并设置为当前迭代点
    if(Obj_minmax*Fun_random2>Obj_minmax*Fun_random1)
        Random1=Random2;
        Fun_random1=Fun_random2;
    %迭代点劣于当前点，以Boltzmann概率接受迭代结果并设置为当前迭代点
    elseif (rand<exp(Obj_minmax*(Fun_random2-Fun_random1)/Tmper))
        Random1=Random2;
        Fun_random1=Fun_random2;
    end
    
    %已缓慢速度衰减温度Tmper;
    Tmper=yita*Tmper;
    
    %迭代次数加一
    Cur_Iteration=Cur_Iteration+1;
    
    %跟新退伙算法性能跟踪器
    Tracer=[Tracer;Fun_random1];
    
    [Random1,Fun_random1];
end



plot(Random1,Fun_random1,'r *','linewidth',2);
figure;
plot(Tracer(:),'r-*');
hold on;
xlabel('迭代次数');
ylabel('目标函数优化情况');
title('一元函数优化过程');















































