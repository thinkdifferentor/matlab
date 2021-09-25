%文件名为filebrowser.m
function filebrowser()
%   显示指定目录下的所有文件，双击文件名时打开
%   作者：罗华飞
%   版本：20101007V2.0
%% 创建一个隐藏的窗口
hFigure = figure('menubar', 'none', 'NumberTitle','off', 'name', '文件浏览器',...
    'position', [300 300 500 400], 'Visible', 'off');
%% 创建窗口控件对象
set(0, 'defaultuicontrolfontsize', 10); %设置uicontrol对象的默认字体大小
hPath = uicontrol('style', 'text', 'position', [70 262 280 25], 'horizontal',...
    'left', 'string', '', 'BackgroundColor', 'w'); %创建静态文本对象，用于显示路径
hList = uicontrol('style', 'listbox', 'string', '',  'position',...
    [20 20 350 230], 'Callback', {@fileOpen, hPath}); %创建列表框，用于显示指定目下所有文件
uicontrol('string', '选择路径', 'position', [20 260 40 25], 'callback',...
    {@fileSel, hPath, hList});  %创建【选择路径】按钮
%% 显示窗口
set(hFigure, 'Visible', 'on');
end
%% 【选择路径】按钮的回调函数
function fileSel(~, ~, hPath, hList)
%% 选择目录，并显示该目录下所有文件
str = uigetdir(pwd, '选择目录');
if str %若选择了目录
    set(hPath, 'string', str);
    str_all = dir(str); %也可写成str_all = dir([str '\*.*']);
    strNames = {str_all.name}; %获取所有文件和文件夹的名称
    strNames{1} = '当前目录';   %第1个文件名为当前文件夹的文件夹名
    strNames{2} = '上一级目录'; %第2个文件名为当前文件夹的文件夹名
    set(hList, 'string', strNames, 'Value', 1); %显示所有文件和文件夹
end
end
%% 列表框的回调函数
function fileOpen(hObject, ~, hPath)
%% 若双击鼠标，打开所选的文件或文件夹
    if strcmp(get(gcf, 'SelectionType'), 'open') %若双击鼠标左键
        strs = get(hObject, 'String');  %获取列表框所有文件或文件夹名列表
        index = get(hObject, 'Value');  %获取当前所选文件或文件夹的位置
        if index == 1     %若双击了第1个选项，则打开当前目录
            fName = '.';
        elseif index == 2 %若双击了第2个选项，则打开上一级目录
            fName = '..';
        else              %若选择了其它选项，直接打开
            fName = strs{index};
        end
        pName = get(hPath, 'String'); %获取当前路径
        winopen([pName '\' fName]);   %打开当前文件或文件夹
    end
end
