function sector2
%调用：直接在命令行输入sector2
%用途：采用定时器创建旋转的转盘
%作者：罗华飞 2014年4月21日
%版本：V1.0

%设置圆形的圆心和半径、扇形的弧角
r0 = [3,3];%圆心
radius = 2;
radian = 2*pi/3;
%创建窗口
hFig = figure('Name', '旋转的扇形BY罗华飞V1.1',...
    'visible', 'off',...
    'UserData', 0);
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
hp1 = patch('faceColor', 'r', 'parent', hAxes);
hp2 = patch('faceColor', 'y', 'parent', hAxes);
hp3 = patch('faceColor', 'b', 'parent', hAxes);
%显示窗口
set(hFig, 'visible', 'on');
%创建定时器并启动
t = timer('BusyMode', 'queue', 'ExecutionMode', 'fixedSpacing', ...
    'Period', 0.05, 'TimerFcn', {@update, hFig, hp1, hp2, hp3,radian,r0,radius});
start(t); %启动定时器

%% 定时器回调函数
function update(obj, ~, hFig, hp1, hp2, hp3,radian,r0,radius)
%若没有关闭窗口，刷新随机数值
if ishandle(hFig) 
    %重新获取弧度值
    rad0 = get(hFig, 'UserData');
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
    %扇形顺时针转0.1弧度
    set(hFig, 'UserData', rad0+0.1);
    drawnow;
else  %若关闭窗口
    stop(obj);   %停止定时器
    delete(obj); %删除定时器
end
