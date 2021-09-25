%在匀强磁场中旋转导体棒的电动势
clear                                  %清除变量
l=0.2;                                 %棒的长度
b=0.01;                                %磁感应强度
w=200*pi;                              %角速度
e=b*w*l^2/2;                           %动生电动势
xm=l+0.1;                              %磁场范围
x=-xm:0.05:xm;                         %坐标向量
[X,Y]=meshgrid(x);                     %坐标矩阵
figure                                 %创建图形窗口
plot(X,Y,'x','MarkerSize',10)          %画“叉”
title('在匀强磁场中旋转导体棒的电动势','FontSize',20)%标题
th=linspace(0,2*pi,30);                %角度向量
axis equal off                         %使坐标轴间隔相等并隐轴
hold on                                %保持图像
plot(l*cos(th),l*sin(th),'--','linewidth',2)%画虚线圆
text(-l,l,['\it\epsilon\rm=',num2str(e),'V'],'FontSize',16)%显示电动势
text(0,0,'\itO','FontSize',16)         %显示原点
ht=text(l,0,'\itA','FontSize',16);     %显示字母A并取句柄
hp=plot([0,l],[0,0],'LineWidth',3);    %画棒并取句柄
pause                                  %暂停
th=0;                                  %初始角度清零
while 1                                %无限循环
    th=th+pi/180;                      %加一个度数
    x=l*cos(th);                       %端点横坐标
    y=l*sin(th);                       %端点纵坐标
    set(hp,'XData',[0,x],'YData',[0,y])%设置棒的坐标
    set(ht,'Position',[x,y])           %设置字母A的位置
    drawnow                            %刷新屏幕
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键退出
end                                    %结束循环

