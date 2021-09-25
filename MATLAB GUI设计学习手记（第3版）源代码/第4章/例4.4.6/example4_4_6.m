%% 创建合适大小、隐藏的GUI窗口
hFigure = figure('menubar', 'none', 'NumberTitle', 'off', 'position',...
    [200 150 300 150], 'name', '简易时钟', 'Visible', 'off');
movegui(hFigure, 'center');  %窗口位置调整好屏幕中间
%% 设置UI控件缺省的背景色、位置单位和字体大小
set(0, 'DefaultuicontrolBackgroundColor', get(hFigure,'color'))
set(0, 'DefaultuicontrolUnits', 'points')
set(0, 'DefaultuicontrolFontsize', 12)
%% 获取当前时钟，用于初始化文本控件显示的时间
nowTime = floor(clock);
%% 创建所需要的UI控件
yearDisp = uicontrol('style', 'edit', 'enable', 'inactive', 'BackgroundColor',...
    'w', 'horizontal', 'right', 'position', [20 80 30 20], 'string',...
    num2str(nowTime(1)));
uicontrol('style', 'text', 'string', '年', 'fontsize', 14, 'position', [55 80 20 20]);
monDisp = uicontrol('style', 'edit', 'enable', 'inactive','BackgroundColor', 'w',...
    'horizontal', 'right', 'position', [80 80 30 20], 'string', num2str(nowTime(2)));
uicontrol('style', 'text',  'string',  '月',  'fontsize', 14,  'position', [115 80 20 20]);
dayDisp = uicontrol('style', 'edit', 'enable', 'inactive', 'BackgroundColor', 'w',...
    'horizontal', 'right', 'position', [140 80 30 20], 'string', num2str(nowTime(3)));
uicontrol('style', 'text', 'units', 'points', 'string', '日', 'fontsize',...
    14, 'position', [175 80 20 20]);
timeDisp = uicontrol('style', 'edit', 'enable', 'inactive', 'BackgroundColor',...
    'w', 'horizontal', 'right', 'position',[40 30 80 20], 'string',...
    [num2str(nowTime(4)) '：' num2str(nowTime(5)) '：' num2str(nowTime(6))]);
uicontrol('string', '关闭', 'position', [150 30 50 20], 'callback', 'isClosed = true;close');
%% 显示窗口
set(hFigure, 'Visible', 'on');
%% 设置全局标志
isClosed = false; %表征窗口是否执行关闭操作
%% 循环更新时间显示
while ishandle(hFigure)
    nowTime = floor(clock);  %更新当前时刻
    set(yearDisp, 'string', num2str(nowTime(1))); %设置年
    set(monDisp, 'string', num2str(nowTime(2)));  %设置月
    set(dayDisp, 'string', num2str(nowTime(3)));  %设置日
    set(timeDisp, 'string', [num2str(nowTime(4), '%2d'), '：', num2str(nowTime(5), '%2d'),...
        '：', num2str(nowTime(6), '%2d')]);       %设置时分秒
    pause(1);    %暂停1秒
    if isClosed  %检查isColosed标志，所点击了【关闭】按钮，跳出循环
        break;
    end
end
