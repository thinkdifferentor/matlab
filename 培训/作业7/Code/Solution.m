% 函数说明：求解每个省内的停留时间
function Solution

clc,clear
% 距离数据矩阵
global Tim

% 城市数目参数
Num_city=5;

% 数据矩阵
Tim=zeros(Num_city);


% 距离数据输入--上三角
% 海南数据 1



Tim(1,2)=16;Tim(1,3)=73;Tim(1,4)=90;Tim(1,5)=61;

Tim(2,3)=78;Tim(2,4)=98;Tim(2,5)=67;

Tim(3,4)=77;Tim(3,5)=13;

Tim(4,5)=65;


Capital_total=2640;


% 省内各景点浏览时间加上省会停留24小时
% 每个旅游景点的停留时间数据
% During=zeros(1,Num_city);
% During(1,1)=2;During(1,2)=2;During(1,3)=3;
% During(1,4)=4;During(1,5)=5;During(1,6)=6;

% 所有旅游景点的停留时间总和
% Total_during=sum(During);

% 各个城市间的距离对称矩阵
Tim=Tim+Tim'; 

% 定义初始圈--出发地点到最后一个城市构成的初始圈
c1=[1 2:4 5];
[Circle,Time]=modifycircle(c1,Num_city);

c2=[1 5 2:4];%改变初始圈，该算法的最后一个顶点不动
[Circle2,Time2]=modifycircle(c2,Num_city);

if Time2<Time
    Time=Time2;
    Circle=Circle2;
end

Total_time=Time+Capital_total;


Circle
Time
Total_time



%*******************************************
%修改圈的子函数
%*******************************************
function [Circle,Time]=modifycircle(c1,Num_city)
global Tim
flag=1;

while flag>0
flag=0;
    for m=1:Num_city-3
        for n=m+2:Num_city-1
            if Tim(c1(m),c1(n))+Tim(c1(m+1),c1(n+1))<Tim(c1(m),c1(m+1))+Tim(c1(n),c1(n+1))
                flag=1;
                c1(m+1:n)=c1(n:-1:m+1);
            end
        end
    end
end

Time=Tim(c1(1),c1(Num_city));

for i=1:Num_city-1
    Time=Time+Tim(c1(i),c1(i+1));
end
Circle=c1;