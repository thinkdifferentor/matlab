%% 以下为调用上面fork.m函数的脚本文件
btndownCallback = ['if strcmp(get(gcbf, ''SelectionType''), ''normal''),',...  %若点击鼠标左键
                    'pos = get(gcbo, ''CurrentPoint'');',...                      %获取所点击的点坐标
                    'fork(pos(1, 1), pos(1, 2), gcbo);',...                        %在该点出产生一个小叉，并显示小叉坐标
                    'elseif strcmp(get(gcbf, ''SelectionType''), ''alt''),',...%若点击鼠标右键
                    'delete(findobj(gcbo, ''Type'', ''hggroup''));',...         %删除小叉对象
                    'end'];  
%% 若单击左键，绘制小叉及其中心点坐标；若单击右键，清除所有小叉
axes('xlim', [0 100], 'ylim', [0 100], 'ButtonDownFcn', btndownCallback);
