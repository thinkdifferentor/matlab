%% 洛仑兹function
axis([10 50 -50 50 -50 50])              %%设定坐标轴的范围
view(3)                                  %%设定三维图形观察视角
hold on
title('Lorenz Attractor')                %%加上标题
options=odeset('OutputFcn','odephas3');  %%设定三维相空间三个变量的图形
[t,y]=ode23('lorfun',[0,20],[0,0,eps],options);  %%输出t,y的数据
