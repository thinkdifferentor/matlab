clear;  %清除所有变量
%% 初始化滚动条参数
delt = 10; %每次移动的长度，单位为points
a = 50;    %滚动条左边界与窗口左边界的距离
b = 50;    %滚动条右边界与窗口右边界的距离
width = 450;  %窗口的宽度
height = 200;  %窗口的高度
strDisp = '感时花溅泪，恨别鸟惊心。';  %要滚动显示的字符串
%% 创建隐藏的窗口，并将窗口移到屏幕中间
hFigure = figure('Name', '滚动条设计实例', 'MenuBar', 'none', 'ToolBar', 'none',...
   'NumberTitle', 'off',  'Units', 'points', 'Position', [0 0 width height],...
   'Visible', 'off');
movegui(hFigure, 'center');
%% 创建滚动条边框和背景
axes('Box', 'on', 'DrawMode', 'fast', 'XTick', [], 'YTick', [], 'XTickLabel',...
    '', 'YTickLabel', '', 'XLim', [0 500], 'YLim', [0 10], 'Units', 'points',...
    'Position', [a height/2 width-a-b 30]);
%% 创建文本对象，用于滚动显示字符串。注意text对象的Clipping属性默认值为off，要设置为on
hText1 = text('String', strDisp, 'Position', [500 5], 'FontWeight', 'bold',...
     'Hor', 'left', 'vert', 'middle', 'Clipping', 'on'); %创建文本对象hText1，
hText2 = text('String', strDisp, 'Position', [-500 5], 'FontWeight', 'bold',...
    'Color', 'r', 'Hor', 'left', 'vert', 'middle', 'Clipping', 'on'); %创建文本控件hDown2
%% 显示窗口
set(hFigure, 'Visible', 'on');
%% 循环显示
while ishandle(hFigure)
    pos1 = get(hText1, 'position'); %获取第1个文本对象的位置
    pos2 = get(hText2, 'position'); %获取第2个文本对象的位置
    pos1(1) = pos1(1) - delt;       %更新第1个文本对象的位置变量
    pos2(1) = pos2(1) - delt;       %更新第2个文本对象的位置变量
    %% 若hText1对象在hText2的右边，且hText1对象左边超出坐标轴，则将hText2移到坐标轴最右边
    if pos1(1) > pos2(1) && pos1(1) < 0.2 
        pos2(1) = 500;
    elseif pos2(1) > pos1(1) && pos2(1) < 0.2
        pos1(1) = 500;
    end
    set(hText1, 'position', pos1);  %更新第1个文本对象的位置
    set(hText2, 'position', pos2);  %更新第2个文本对象的位置
    drawnow;  %重绘窗口
    pause(0.1);  %暂停0.1秒后继续执行循环
end
