%% 创建窗口
clear all;
hFigure = figure('Name', '日期显示', 'menubar', 'none', 'position',...
    [500 300 300 100], 'DockControls', 'off', 'NumberTitle', 'off');
%% 创建菜单
hMenu = uimenu(hFigure, 'label', '', 'ForegroundColor', 'r');
xingqi={'日','一','二','三','四','五','六'}; %星期字符串
while ishandle(hFigure)
    set(hMenu, 'Label', [datestr(clock, 31) '  星期' xingqi{weekday(now)}]);
    drawnow;
    pause(1);
end
