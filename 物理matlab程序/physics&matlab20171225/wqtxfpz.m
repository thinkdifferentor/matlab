%对心非弹性碰撞曲面
clear                                  %清除变量
v0=-4:0.2:4;                           %v20/v10初速度比向量
m=0:0.2:3;                             %m2/m1的质量比向量
[V0,M]=meshgrid(v0,m);                 %初速度比和质量比矩阵
V=(1+M.*V0)./(1+M);                    %物体完全非弹性碰撞后的速度
s1='m1*v10+m2*v20-m1*v1-m2*v2';        %动量守恒字符串
s2='v2-v1-e*(v10-v20)';                %恢复系数字符串
[v1,v2]=solve(s1,s2,'v1','v2')         %对心非弹性碰撞的速度的符号解
figure                                 %创建图形窗口
surf(V0,M,V)                           %画完全非弹性碰撞的速度曲面
box on                                 %框架
hold on                                %保持图像
contour(v0,m,V,[0,0],'r','LineWidth',2)%画速度为零的等值线
fs=16;                                 %字体大小
title('对心完全非弹性碰撞的速度','FontSize',fs)%标题
xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%初速度比标签
ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%质量比标签
zlabel('\itv\rm_1/\itv\rm_1_0','FontSize',fs)%碰撞后速度比标签
figure                                 %创建图形窗口
surf(V0,M,V)                           %画曲面
box on                                 %加框架
shading interp                         %染色
V=2*(1+M.*V0)./(1+M)-1;                %物体对心完全弹性碰撞后的速度
hold on                                %保持图像
surf(V0,M,V)                           %画对心完全弹性碰撞的速度曲面
e=0.5;                                 %恢复系数
V=(1+e)*(1+M.*V0)./(1+M)-e;            %物体弹性碰撞后的速度
mesh(V0,M,V)                           %画一般弹性碰撞后的速度网格曲面
alpha(0.5)                             %使平面透明
xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%初速度比标签
ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%质量比标签
zlabel('\itv\rm_1/\itv\rm_1_0','FontSize',fs)%碰撞后速度比标签
title('对心非弹性碰撞的速度','FontSize',fs)%标题

