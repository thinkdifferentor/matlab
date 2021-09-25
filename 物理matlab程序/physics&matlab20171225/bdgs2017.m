%波的干涉动画和图样
clear                                  %清除变量
x1=-2.5;                               %横坐标左边界(波长的倍数)
x2=10;                                 %横坐标右边界
ym=5;                                  %纵坐标范围
x0=0.5;                                %波阵面之间的距离(半波长) 
%a=1;                                   %两缝中心的半距离
a=1.5;                                 %两缝中心的半距离
d=0.05;                                %缝的半宽度
figure                                 %建立图形窗口
plot([0,0,0;0,0,0],[ym,a-d,-a-d;a+d,-a+d,-ym],'k','LineWidth',3)%画上下档板
rectangle('Position',[x1,-ym,x2-x1,2*ym],'LineWidth',3)%画方框
axis off equal                         %不显示坐标并使坐标间隔相等
axis([x1,x2,-ym,ym])                   %设定坐标范围
title('波的干涉图样','FontSize',20)    %显示标题
hold on                                %保持图像
plot(x1,0,'o')                         %画点波源
th0=linspace(-pi/3,pi/3);              %点波源的角度向量
th=linspace(-pi/2,pi/2);               %相干波源的角度向量
n=1;                                   %第1个波阵面 
c='rb';                                %两个颜色符号 
pause                                  %暂停 
while 1                                %无限循环
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    h1(n)=plot(x1,0,'Color',c(mod(n,2)+1),'LineWidth',1.5);%第一个波阵面的句柄
    h2(n)=plot(x1,0,'Color',c(mod(n,2)+1),'LineWidth',1.5);%第二个波阵面的句柄
	xr=0.05;                           %波阵面的相对初位置
    while xr<x0                        %在两波阵面之间的距离内循环
        for i=1:n                      %按波阵面循环
            x=x1+x0*(n-i)+xr;          %波阵面的横坐标
            if x<0                     %如果没有达到档板右边
                xx=(-x1+x)*cos(th0)+x1;%横坐标向量
                yy=(-x1+x)*sin(th0);   %纵坐标向量
                set(h1(i),'XData',xx,'YData',yy)%设置弧形波阵面
            else                       %否则
                xx=x*cos(th);          %横坐标向量
                yy=x*sin(th);          %纵坐标向量
                set(h1(i),'XData',xx,'YData',yy+a)%设置第一个半圆形波阵面
                set(h2(i),'XData',xx,'YData',yy-a)%设置第二个半圆形波阵面
            end                        %结束条件
        end                            %结束循环
        drawnow                        %更新屏幕
        pause(0.02)                    %延时
        xr=xr+0.05;                    %下一步
    end                                %结束循环 
    n=n+1;                             %增加一个波阵面
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
end                                    %结束循环
x=linspace(0,x2);                      %横坐标向量
n=4*a;                                 %干涉线的最大编号
[X,K]=meshgrid(x,1:2:n);               %坐标和奇数矩阵
D=(K-1)/2;                             %波程差
Y=D/2.*sqrt(1+X.^2*4./(4*a^2-D.^2));   %纵坐标
plot(x,Y,'k--',x,-Y,'k--','LineWidth',2)%画长虚黑线(振动加强)
D=K/2;                                 %波程差
Y=D/2.*sqrt(1+X.^2*4./(4*a^2-D.^2));   %纵坐标
plot(x,Y,'g--',x,-Y,'g--','LineWidth',2)%画长虚绿线(振动减弱)

