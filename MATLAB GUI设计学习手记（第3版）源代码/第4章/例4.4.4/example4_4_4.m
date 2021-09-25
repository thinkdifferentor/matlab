%注意： 新版工具栏中按钮有3种：uipushtool、uitoggletool、uitogglesplittool
hFigure = figure('numbertitle', 'off', 'name', '例4.4.4');     %创建一个GUI窗口
delete(findall(hFigure, 'type', 'uimenu'));   %删除标准菜单
hToolBar = findall(hFigure, 'type', 'uitoolbar');  %查找工具栏
set(allchild(hToolBar), 'visible', 'off');   %隐藏工具栏所有按钮
hTools = findall(hToolBar, 'Tag', 'Exploration.ZoomIn', '-or', 'Tag', 'Exploration.ZoomOut',...
    '-or', 'Tag', 'Exploration.Pan', '-or', 'Tag', 'Exploration.DataCursor');  %在工具栏里查找需要显示的4个按钮
set(hTools,'visible','on','Separator','off')  %显示这4个按钮




