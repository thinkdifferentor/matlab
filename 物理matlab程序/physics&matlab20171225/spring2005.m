%弹簧振子运动的动画和位移
clear                                  %清除变量
a=0.2;                                 %约化振幅A/l
xm=1+2*a;                              %图形范围
xx=linspace(0,1+a,1000);               %弹簧的初始横坐标
n=20;                                  %正弦线的个数
s0=0.02;                               %弹簧粗细
yy=s0*sin(xx/(1+a)*n*2*pi);            %用正弦线表示弹簧
figure                                 %建立图形窗口
subplot(2,1,1)                         %选子图
plot([1;1],[-2;-4]*s0)                 %画平衡位置
grid on                                %加网格
axis equal off                         %坐标间隔相等
fs=16;                                 %字体大小
title('弹簧振子的运动','FontSize',fs)  %显示标题
hold on                                %保持图像
plot([0;0;xm],[1;-1;-1]*2*s0,'LineWidth',3)%画坚板和水平线
ball=plot(1+a,yy(end),'g.','MarkerSize',50);%取球的句柄
spring=plot(xx,yy,'r','LineWidth',2);  %取弹簧的句柄
pause(10);                                  %暂停
t=0;                                   %初始时刻
dt=0.005;                              %时间间隔(步长)
while 1                                %无限循环
    if get(gcf,'CurrentCharacter')==char(27) break;end  %按ESC键则中断循环
    x=a*cos(2*pi*t);                   %振子位移
    set(ball,'xdata',x+1)              %设置球的坐标
    xx=linspace(0,1+x,1000);           %弹簧的横坐标
    yy=s0*sin(xx./(1+x)*n*2*pi);       %弹簧各点的纵坐标
    set(spring,'xdata',xx,'ydata',yy)  %设置弹簧的坐标
    drawnow                            %刷新
   if abs(t-5)<1e-6,break,end
    t=t+dt;                            %下一个时刻
end                                    %结束循环
t=0:dt:2;                              %时间向量
x=a*cos(2*pi*t);                       %振子位移
subplot(2,1,2)                         %选子图
plot(t,x,'LineWidth',2)                %画曲线
grid on                                %加网格
title('弹簧振子的位移','FontSize',fs)  %显示标题
xlabel('\itt/T','FontSize',fs)         %标记横轴
ylabel('\itx/l','FontSize',fs)         %标记纵轴
text(0,0,'\itT\rm=2\pi(\itm/k\rm)^{1/2}','FontSize',fs)%标记周期文本

