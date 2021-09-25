%双人滑冰运动员的拉手和旋转运动
clear                                  %清除变量
%m1=50;                                 %第一人的质量
%v1=5;                                 %第一人的速率
m1=80;                                 %第一人的质量
v1=3.5;                                %第一人的速率
m2=70;                                 %第二人的质量
v2=4;                                  %第二人迎面的速率
vc=(m2*v2-m1*v1)/(m1+m2);              %质心速率
r=1.5;                                 %两人间的距离
w=(v1+v2)/r;                           %角速度
r1=r*m2/(m1+m2);                       %第一人到质心的距离
r2=r*m1/(m1+m2);                       %第二人到质心的距离
x1=0;                                  %第一人的起始横坐标
y1=r1;                                 %第一人的起始纵坐标
x2=0;                                  %第二人的起始横坐标
y2=-r2;                                %第二人的起始纵坐标
xc=0;                                  %质心起始横坐标
figure                                 %创建图形窗口
plot([x1;x2],[y1;y2],'-o','LineWidth',3)%画杆
grid on                                %加网格
axis off equal                         %坐标刻度相等
hold on                                %保持图像
plot([1;0],[y1;y1],'k--',[-0.8;0],[y2;y2],'r--')%画平动线
fs=16;                                 %字体大小
xlabel('\itx\rm/m','FontSize',fs)      %横坐标标签
ylabel('\ity\rm/m','FontSize',fs)      %纵坐标标签
title('双人滑冰运动员的拉手和旋转运动','FontSize',fs)%加标题
txt{1}=['\itv\rm_c=',num2str(vc),'m/s'];%质心速度文本
txt{2}=['\it\omega\rm=',num2str(w),'/s'];%角速度文本
txt{3}=['\itr\rm_1=',num2str(r1),'m']; %第一人到质心的距离文本
txt{4}=['\itr\rm_2=',num2str(r2),'m']; %第二人到质心的距离文本
text(0,0,txt,'FontSize',fs)            %显示文本
pause                                  %暂停
%h12=plot([x1;x2],[y1;y2],'-o','LineWidth',2,'erasemode','xor');%画杆并取句柄
h12=plot([x1;x2],[y1;y2],'-o','LineWidth',3);%画杆并取句柄
dt=0.02;                               %时间差
t=0;                                   %时间的初值
while 1                                %无限循环
    t=t+dt;                            %累加时间
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键则中断循环
    xc0=xc;                            %保存质心旧横坐标
	xc=vc*t;                           %计算质心新横坐标
    plot([xc0;xc],[0;0],'c','LineWidth',2)%画质心轨迹
    x10=x1;                            %保存第一人旧横坐标
    y10=y1;                            %保存第一人旧纵坐标
    x20=x2;                            %保存第二人旧横坐标
    y20=y2;                            %保存第二人旧纵坐标
	x1=xc+r1*cos(w*t+pi/2);            %计算第一人的新横坐标
	y1=r1*sin(w*t+pi/2);               %计算第一人的新纵坐标
	x2=xc+r2*cos(w*t-pi/2);            %计算第二人的新横坐标
	y2=r2*sin(w*t-pi/2);               %计算第二人的新纵坐标
    set(h12,'XData',[x1;x2],'YData',[y1;y2]);%设置两人的连线
    plot([x10;x1],[y10;y1],'k','LineWidth',2)%画第一人的轨迹
    plot([x20;x2],[y20;y2],'r','LineWidth',2)%画第二人的轨迹
    drawnow                            %刷新屏幕
end                                    %结束循环

