clear;  %清除所有变量
%% 初始化滚动条参数
isMoveFirst = true;  %值为真时移动文本控件hDown，值为假时移动文本控件hDown2
delt = 10; %每次移动的长度，单位为points
a = 50;    %滚动条左边界与窗口左边界的距离
b = 50;    %滚动条右边界与窗口右边界的距离
width = 450;  %窗口的宽度
height = 200;  %窗口的高度
strDisp = '试玉要烧三日满，辨材须待七年期。';  %要滚动显示的字符串
%% 创建隐藏的窗口,并将窗口移到屏幕中间
hFigure = figure('Name', '滚动条设计实例', 'MenuBar', 'none', 'ToolBar', 'none',...
   'NumberTitle', 'off',  'Units', 'points', 'Position', [0 0 width height],...
   'Visible', 'off');
movegui(hFigure, 'center');
%% 设置uicontrol控件默认的字体大小、字体粗细和计量单位
set(0, 'DefaultuicontrolFontSize', 12);
set(0, 'DefaultuicontrolFontWeight', 'bold');
set(0, 'DefaultuicontrolUnits', 'point');
%% 以下5个控件创建的顺序不能颠倒
uicontrol('Style', 'edit', 'Enable', 'inactive', 'BackgroundColor', 'w', 'Position',...
    [a-2 height/2 width-a-b+4 30], 'ForegroundColor', 'r'); %创建白色背景
hDown2 = uicontrol('Style', 'text', 'BackgroundColor', 'w', 'String', strDisp, 'Position',...
    [width-b height/2+1 300 24], 'ForegroundColor', 'r', 'Hor', 'left'); %创建文本控件hDown2
hDown = uicontrol('Style', 'text', 'BackgroundColor', 'w', 'String', strDisp,...
    'Position', [width-b height/2+1 300 24], 'Hor', 'left'); %创建文本控件hDown
hUpLeft = uicontrol('Style', 'text', 'Position', [a-202 height/2 200 30],...
    'BackgroundColor', get(hFigure, 'Color'));  %创建左边界遮挡条
hUpRight = uicontrol('Style', 'text', 'Position', [width-b-2 height/2 200 30],...
    'BackgroundColor', get(hFigure, 'Color')); %创建右边界遮挡条
%% 显示窗口
set(hFigure, 'Visible', 'on');
%% 循环显示
while ishandle(hFigure)
if isMoveFirst  %isMoveFirst值为真时移动文本控件hDown
    pos = get(hDown, 'position');
    pos(1) = pos(1) - delt;
    if pos(1) + 300 > a %若文本控件hDown的最右端在hUpLeft的覆盖范围之外
        set(hDown, 'position', pos);
    else             %若文本控件hDown被hUpLeft完全覆盖
        isMoveFirst = false;
        pos(1) = width - b;
        set(hDown, 'Position', pos);
    end
    if pos(1) < a % 若文本控件hDown的最左端被hUpLeft覆盖，开始移动文本控件hDown2
        pos = get(hDown2, 'position');
        pos(1) = pos(1) - delt;
        set(hDown2, 'Position', pos);
    end
else              %isMoveFirst值为假时移动文本控件hDown2
    pos = get(hDown2, 'position');
    pos(1) = pos(1) - delt;
    if pos(1) > -300 %若文本控件hDown2的最右端在hUpLeft的覆盖范围之外
        set(hDown2, 'position', pos);
    else           %若文本控件hDown2被hUpLeft完全覆盖
        isMoveFirst = true;
        pos(1) = width - b;
        set(hDown2, 'Position', pos);
    end
    if pos(1) < a % 若文本控件hDown2的最左端被hUpLeft覆盖，开始移动文本控件hDown
        pos = get(hDown, 'position');
        pos(1) = pos(1) - delt;
        set(hDown, 'Position', pos);
    end
end
drawnow;  %重绘窗口
pause(0.1);  %暂停0.1秒后继续执行循环
end
