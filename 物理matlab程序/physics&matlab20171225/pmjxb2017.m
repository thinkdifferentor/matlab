%平面波动方程曲面
clear                                  %清除变量
%rand('state',0)
n=2.5;                                 %周期的个数
t=0:0.05:n;                            %时间向量(周期的倍数)
m=3;                                   %波的个数
x=0:0.01:m;                            %位置向量(波长倍数)
[X,T]=meshgrid(x,t);                   %时间和位置矩阵
a=0.2;                                 %振幅(波长的倍数)
U=a*cos(2*pi*(T-X));                   %波动方程
figure                                 %创建图形窗口
waterfall(x,t,U)                       %画瀑布曲线
%mesh(x,t,U)                            %画网格曲面
alpha(0.1)                             %使曲面透明
box on                                 %加框架
axis equal                             %使坐标间隔相等
fs=16;                                 %字体大小
title('平面波动方程的曲面','FontSize',fs)%标题
xlabel('\itx/\lambda','FontSize',fs)   %x标签
ylabel('\itt/T','FontSize',fs)         %y标签
zlabel('\itu/\lambda','FontSize',fs)   %z标签
i=floor(rand*length(x))+1;             %随机取坐标的下标
x0=x(i);                               %某一坐标
u1=a*cos(2*pi*(t-x0));                 %位移方程
hold on                                %保持图像
plot3(ones(size(t))*x0,t,u1,'LineWidth',2)%画三维位移曲线
i=floor(rand*length(t))+1;             %随机取坐标的下标
t0=t(i);                               %某一时刻
u2=a*cos(2*pi*(t0-x));                 %波形方程
plot3(x,ones(size(x))*t0,u2,'r','LineWidth',2)%画三维波形曲线

figure                                 %创建图形窗口
subplot(2,1,1)                         %取子图
plot(t,u1,'LineWidth',2)               %画质点的位移曲线
grid on                                %加网格
title('某质点的振动曲线','FontSize',fs)%标题
xlabel('\itt/T','FontSize',fs)         %x标签
ylabel('\itu/\lambda','FontSize',fs)   %y标签
text(0,a,['\itA\rm=',num2str(a),'\it\lambda'],'FontSize',fs)%振幅文本
text(0,-a,['\itx\rm_0=',num2str(x0),'\it\lambda'],'FontSize',fs)%标记坐标
subplot(2,1,2)                         %取子图
plot(x,u2,'LineWidth',2)               %画栽时刻的波形曲线
grid on                                %加网格
title('某时刻的波形曲线','FontSize',fs)%标题
xlabel('\itx/\lambda','FontSize',fs)   %x标签   
ylabel('\itu/\lambda','FontSize',fs)   %y标签
text(0,-a,['\itt\rm_0=',num2str(t0),'\itT'],'FontSize',fs)%标记时刻

