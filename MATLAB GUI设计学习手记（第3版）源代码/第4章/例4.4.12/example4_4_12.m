%% 创建窗口
hFigure = figure('Name', '日期显示', 'menubar', 'none', 'position',...
    [500 300 400 200], 'DockControls', 'off', 'NumberTitle', 'off');
%% 创建菜单
hMenu = uimenu(hFigure, 'label', '');
xingqi={'日','一','二','三','四','五','六'}; %星期字符串
while ishandle(hFigure)
    strDate = datestr(now, 29);  %获取当前年月日
    strTime = datestr(now, 13);  %获取当前时分秒
    set(hMenu, 'Label', ['<html><b><font size=5 color="Red">' strDate ...%字体为5号加粗，年月日字体为红色
        '<font color="Blue"> ' strTime '<font color="Black"> 星期' ...  %时分秒颜色为蓝色，星期颜色为黑色
        xingqi{weekday(now)} '</font></font></font></html>']);
    drawnow;                              %更新窗口显示
    pause(1);                               %暂停1秒后继续显示
end
