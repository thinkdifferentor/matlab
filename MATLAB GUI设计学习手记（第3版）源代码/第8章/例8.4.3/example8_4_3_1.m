%用途：采用while循环创建旋转的转盘
%作者：罗华飞 2013年3月9日
%版本：V1.1

%设置圆形的圆心和半径、扇形的弧角
r0 = [3,3];		%圆心
radius = 2;		%半径
radian = 2*pi/3;	%扇形弧度值
rad0 = 0;		%扇形初始弧角，旋转的基准弧角
%创建窗口
hFig = figure('Name','旋转的扇形BY罗华飞V1.1', 'visible', 'off');
%创建坐标轴
hAxes = axes('parent', hFig,...
    'DrawMode', 'fast',...
    'box', 'on',...
    'xticklabel', '',...
    'yticklabel', '',...
    'XTick', [],...
    'YTick', []);
%坐标轴等比例
axis equal;
%创建3个扇形
hp1 = patch('faceColor','r','parent',hAxes);
hp2 = patch('faceColor','y','parent',hAxes);
hp3 = patch('faceColor','b','parent',hAxes);
%显示窗口
set(hFig, 'visible', 'on');
%采用while循环让扇形“转起来”
while(ishandle(hAxes))
    %重新获取弧度值
    t0 = (rad0:0.1:rad0+radian+0.1);
    t1 = t0+2*pi/3;
    t2 = t1+2*pi/3;
    %获取扇形弧边数据
    x0 = r0(1)+radius*cos(t0);
    y0 = r0(2)+radius*sin(t0);
    x1 = r0(1)+radius*cos(t1);
    y1 = r0(2)+radius*sin(t1);
    x2 = r0(1)+radius*cos(t2);
    y2 = r0(2)+radius*sin(t2);
     %绘制扇形patch对象
    set(hp1,'xdata',[r0(1),x0],'ydata',[r0(2),y0]);
    set(hp2,'xdata',[r0(1),x1],'ydata',[r0(2),y1]);
    set(hp3,'xdata',[r0(1),x2],'ydata',[r0(2),y2]);
    %暂停0.05秒
    pause(0.05);
    %扇形顺时针转0.1弧度
    rad0 = rad0+0.1;
end
