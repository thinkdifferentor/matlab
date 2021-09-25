function analogclock()
%    采用坐标轴及其子对象制作模拟时钟
%    作者：罗华飞
%    版本：20101005 V1.0
%% 创建表盘面
hFigure = figure('Visible', 'off');  %创建一个隐藏的窗口，将窗口布局好后再显示
hAxes = axes('visible', 'off', 'DrawMode', 'fast'); %创建表盘坐标轴
rectangle('Curvature',[1, 1], 'FaceColor', 'w', 'Position', [-1 -1 2 2]);
axis equal;  %坐标轴的x轴和y轴刻度比例相等

%% 创建刻度线
for i = 0 : 6 : 354        %i为每个刻度线的角度
    thelt = i * pi / 180;  %角度转化为弧度值
    if ~rem(i, 30)         %刻度线3、6、9、12要粗些，颜色为红色
        x = 0.9 : 0.01 : 1;%刻度线的长度为0.1
        line(x*cos(thelt), x*sin(thelt), 'Color', 'r', 'LineWidth', 3);
    else                   %其它刻度线要细些，颜色为蓝色
        x = 0.95 : 0.01 : 1;%刻度线的长度为0.05
        line(x*cos(thelt), x*sin(thelt), 'Color', 'b', 'LineWidth', 1);
    end
end

%% 绘制刻度值
ang = pi / 3;    %刻度值1所对应的弧度值
for i = 1 : 12   %穷举每个刻度值
    if rem(i, 3) %刻度值为3、6、9、12时，字号为12
        text(0.8*cos(ang), 0.8*sin(ang), num2str(i), 'horizontalAlignment',...
            'center', 'FontSize', 12);
    else %刻度值为3、6、9、12时，字号为20，加粗，绿色
        text(0.7*cos(ang), 0.7*sin(ang), num2str(i), 'horizontalAlignment',...
            'center', 'FontSize', 20, 'FontWeight', 'bold', 'Color', 'g');
    end
    ang = ang - pi / 6; %每绘制一个刻度值，就更新弧度值
end

%% 绘制表盘中心点
hAxesDot = axes('Visible', 'off', 'DrawMode', 'fast'); %表盘中心点所在的坐标轴 
axis equal; %使中心点看起来是个圆点
%%%%%%%%%%%方法1：采用line函数创建%%%%%%%%%
line(0, 0, 'Parent', hAxesDot, 'Marker', 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 15); 
%%%%%%%%%%%方法2：采用patch函数创建%%%%%%%%%
% t = 0 : 0.01 : 2*pi;
% hPatch = patch('xData', 0.05*cos(t), 'yData', 0.05*sin(t), 'Parent', hAxesDot, 'FaceColor', 'b');

%% 显示窗口
set(hFigure, 'Visible', 'on');

%% 循环更新指针位置
try  %使用try结构可以避免关闭窗口时出现的错误提示
    while(1)
        %% 更新当前时间
        time = floor(clock);  %获取当前时刻，存入1×6的矩阵
        hour = time(4);       %获取当前的小时
        min = time(5);        %获取当前的分钟
        sec = time(6);        %获取当前的秒
        %% 更新指针位置
        argHour = (hour + min / 60) * pi / 6; %计算时针的弧度值
        hHour = arrow(hAxes, pi/2 - argHour, 'cyan', 0.5); %绘制时针
        argMin = (min + sec/60) * pi / 30;    %计算分针的弧度值
        hMin = arrow(hAxes, pi/2 - argMin, 'red', 0.8);    %绘制分针
        argSec = sec * pi / 30;               %计算秒针的弧度值
        hSec = arrow(hAxes, pi/2 - argSec);   %绘制秒针
        %% 更新窗口显示，暂停1秒后，删除指针
        drawnow;
        pause(1);
        delete([hHour hMin hSec]);   %删除3个指针，方便下次更新指针
    end
catch
    disp('It''s closed.');
end

%% 子函数，用于创建指针组对象
function varargout = arrow(varargin)
%   采用3个line对象制作指针
%   函数描述：
%   输入参数依次为：父对象h_axes、弧度值ang、指针颜色linecolor、指针长度length、
%                  箭头长度len2、指针线宽linewidth
%   作者：罗华飞
%   版本：20101005 V1.0
switch nargin %初始化输入参数
    case 0,
        h_axes = gca;
        ang = 0;
        lineColor = 'b';
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 1,
        h_axes = varargin{1};
        ang = 0;
        lineColor = 'b';
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 2,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = 'b';
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 3,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 4,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = varargin{4};
        len2 = 0.1;
        linewidth = 3;
    case 5,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = varargin{4};
        len2 = varargin{5};
        linewidth = 3;
    case 6,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = varargin{4};
        len2 = varargin{5};
        linewidth = varargin{6};
    otherwise
        error('So many input arguments!');
end

%% 创建组对象
hg = hggroup('Parent', h_axes); 
%% 绘制指针体
x = [0 length] * cos(ang);
y = [0 length] * sin(ang);
line(x, y, 'Parent', hg, 'LineWidth', linewidth, 'Color', lineColor);
%% 绘制指针箭头的一部分
ang1 = ang + pi / 6;
x1 = [x(2), x(2)-len2*cos(ang1)];
y1 = [y(2), y(2)-len2*sin(ang1)];
line(x1, y1, 'Parent', hg, 'LineWidth', linewidth, 'Color', lineColor);
%% 绘制指针箭头的另一部分
ang2 = ang - pi / 6;
x2 = [x(2), x(2)-len2*cos(ang2)];
y2 = [y(2), y(2)-len2*sin(ang2)];
line(x2, y2, 'Parent', hg, 'LineWidth', linewidth, 'Color', lineColor);
%% 设置输出参数
if nargout == 1
    varargout{1} = hg;
elseif nargargout > 1
    error('So many output arguments!');
end
