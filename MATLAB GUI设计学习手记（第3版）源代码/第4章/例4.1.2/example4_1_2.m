h = uicontextmenu;                          %创建一个GUI窗口和右键菜单h
uimenu(h, 'label', 'a1');                     %创建菜单项a1
uimenu(h, 'label', 'a2');                      %创建菜单项b1
uimenu(h, 'label', 'a3');                      %创建菜单项c1
set(gcf, 'uicontextmenu', h);              %设置GUI窗口的右键菜单为h
%生成回调函数执行字符串；获取当前左键单击的点，并将右键菜单显示在该点
btn_callback = ['pos = get(gcbf, ''CurrentPoint'');',...
                'set(h, ''Position'', pos);',...
                'set(h, ''Visible'', ''on'');'];
%设置窗口的WindowButtonDownFcn回调函数
set(gcf, 'WindowButtonDownFcn', btn_callback);
