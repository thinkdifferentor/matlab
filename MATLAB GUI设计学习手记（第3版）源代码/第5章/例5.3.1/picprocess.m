function picprocess()
%   打开图片，并在图片上绘图
%   本例子用于讲解MATLAB预定义对话框的用法，用到的对话框有：
%     文件打开对话框，文件保存对话框，颜色设置对话框，输入对话框，
%     提问对话框，信息对话框
%   setappdata和getappdata函数用于GUI对象之间传递数据，详细用法先不要求掌握，
%     只作了解，第6章会详细介绍其用法
%   作者：罗华飞
%   版本：20140818V1.2
%% 创建隐藏的窗口，并移到屏幕中间
hFigure = figure('Visible', 'off', 'Position', [0 0 600 500], 'Resize', 'off',...
    'DockControls', 'off', 'Menubar', 'none', 'Name', '预定义对话框示例', ...
    'NumberTitle', 'off', 'WindowButtonDownFcn', @btnDown, 'WindowButtonMotionFcn',...
    @btnMotion, 'WindowButtonUpFcn', @btnUp, 'CloseRequestFcn', @closeQuest);
movegui(hFigure, 'center');
%% 创建隐藏的坐标轴，用于显示图片和绘制曲线
hAxes = axes('Visible', 'off', 'Position', [0.01 0.2 0.98 0.79], 'Drawmode', 'fast');
imshow peppers.png;  %加载默认图片
%% 存储坐标范围，用于判断鼠标是否在图片上
setappdata(hFigure, 'xLim', get(hAxes, 'xLim'));  
setappdata(hFigure, 'yLim', get(hAxes, 'yLim'));
%% 存储默认的画笔宽度和线型
setappdata(hFigure, 'lineWidth', 4);
setappdata(hFigure, 'lineStyle', '-');
%% 创建uicontrol对象
set(0, 'DefaultUicontrolFontSize', 10);  %设置uicontrol控件的默认字体大小
uicontrol('String', '打  开', 'Position', [50 20 60 30], 'Callback', @openPic);
uicontrol('String', '画笔类型', 'Position', [150 20 60 30], 'Callback', @penStyle);
uicontrol('String', '保  存', 'Position', [250 20 60 30], 'Callback', {@savePic, hAxes});
uicontrol('String', '退  出', 'Position', [350 20 60 30], 'Callback', 'close(gcbf)');
%% 显示窗口
set(hFigure, 'Visible', 'on');
end

function openPic(~, ~)
%   【打开】按钮的回调函数，弹出文件打开对话框，选择要显示的背景图片
%   ~表示该参数不被使用
%   hAxes为坐标轴对象的句柄 
%% 采用文件打开对话框，选择要打开的图片
[fName, pName, index] = uigetfile({'*.jpg'; '*.bmp'}, '选择要打开的图片文件');
if index   %如果选择了图片
    str = [pName fName];  %获取图片的完整路径和文件名
    cla;  %清空坐标轴内的背景图片和用户绘制的曲线
    imshow(str);          %在当前坐标轴内显示选中的图片
    %% 存储坐标范围，用于判断鼠标是否在图片上
    setappdata(gcf, 'xLim', get(gca, 'xLim')); %存储坐标轴的x轴范围为窗口对象的应用数据
    setappdata(gcf, 'yLim', get(gca, 'yLim')); %存储坐标轴的y轴范围为窗口对象的应用数据
end
end

function penStyle(~, ~)
% 【画笔类型】按钮的回调函数
%% 采用输入对话框，设置画笔宽度和类型
answer = inputdlg({'画笔宽度(pixels)：', sprintf('画笔类型：\n(1--实线,2--点线,3--点画线')},...
    '画笔设置', 1, {'4', '1'});
if ~isempty(answer)  %或点击了【OK】按钮，更新画笔线宽和线型
    lineWidth = floor(str2double(answer{1})); %获取用户输入的线宽值，并取整
    if  ~isnan(lineWidth) && lineWidth > 0 && lineWidth < 30 %若输入的值在(0,30)范围内
        setappdata(gcf, 'lineWidth', lineWidth); %更新画笔线宽
    end
    lineStyle = floor(str2double(answer{2})); %获取用户输入的值，并取整
    if ~isnan(lineWidth) && lineStyle > 0 && lineStyle < 4 %若输入的值在(0,4)范围内
        strTemp = {'-', ':', '-.'};
        setappdata(gcf, 'lineStyle', strTemp{lineStyle}); %%更新画笔线型
    end
end
end

function savePic(~, ~, hAxes)
% 【保  存】按钮的回调函数
%% 采用文件保存对话框，获取保存的图片路径和文件名
[fName, pName, index] = uiputfile({'*.jpg'; '*.bmp'}, '图片另存为');
if index == 1 || index == 2 %若保存文件类型为JPG或BMP
    %% 创建一个隐藏的窗口，将坐标轴复制进去，并保存为图片
    hFig = figure('Visible', 'off'); %创建一个隐藏窗口
    copyobj(hAxes, hFig); %将坐标轴及其子对象复制到新窗口内
    str = [pName fName];  %获取要保存的图片路径和文件名
    if index == 1
        print(hFig, '-djpeg', str); %保存为JPG图片
    else
        print(hFig, '-dbmp', str);  %保存为BMP图片
    end
    delete(hFig); %删除创建的隐藏窗口
    %% 创建一个信息对话框，提示文件保存成功
    hMsg = msgbox(['图片' fName '保存成功！'], '提示');
    %% 1秒后如果信息对话框没有关闭，自动关闭
    pause(1); 
    if ishandle(hMsg)  %信息对话框没有手动关闭
        delete(hmsg);  %自动关闭信息对话框
    end
end
end

function btnDown(hObject, ~)
% 窗口的WindowButtonDownFcn回调函数
% 应用数据isPressed用来表征鼠标是否按下
% 若鼠标在图片上按下，开始绘制曲线
%% 获取坐标轴范围和当前点坐标，判断鼠标当前是否在图片上
xLim = getappdata(hObject, 'xLim');
yLim = getappdata(hObject, 'yLim');
pos = get(gca, 'CurrentPoint');
if (pos(1, 1) > xLim(1)) && (pos(1, 1) < xLim(2)) && (pos(1, 2) > yLim(1))...
        && (pos(1, 2) < yLim(2))  % 若鼠标在图片上
    if strcmp(get(hObject, 'selectiontype'), 'alt') %单击鼠标右键
        delete(findobj(gca, 'type', 'line')); %删除所有绘制的曲线
    elseif strcmp(get(hObject, 'selectiontype'), 'open') %若双击左键
        %% 创建颜色设置对话框，用于设置画笔颜色
        col = uisetcolor(get(gca, 'colororder'), '选择画笔颜色'); 
        set(gca, 'colororder', col)
    else %若单击鼠标左键
        %% 获取鼠标当前点坐标，并存为用户数据
        pos = get(gca, 'currentpoint');  %获取当前点坐标
        set(hObject, 'userData', pos(1,[1,2])); %将当前坐标存为用户数据
        setappdata(hObject, 'isPressed', true); %设置应用数据isPressed的值
    end
end
end

function btnMotion(hObject, ~)
% 窗口的WindowButtonMotionFcn回调函数
%% 获取坐标轴范围和当前点坐标，判断鼠标当前是否在图片上
xLim = getappdata(hObject, 'xLim');
yLim = getappdata(hObject, 'yLim');
pos = get(gca, 'CurrentPoint');
if (pos(1, 1) > xLim(1)) && (pos(1, 1) < xLim(2)) && (pos(1, 2) > yLim(1))...
        && (pos(1, 2) < yLim(2))  % 若鼠标在图片上
    set(hObject, 'Pointer', 'hand'); %设置鼠标指针为手型
    isPressed = getappdata(hObject, 'isPressed'); %获取应用数据isPressed
    pos1 = get(hObject, 'UserData'); %获取鼠标之前点击的点的坐标
    pos = get(gca, 'currentpoint');  %获取当前点的坐标
    if isPressed  %若鼠标处于“按下”状态，绘制曲线
        lineWidth = getappdata(gcf, 'lineWidth'); %获取线宽
        lineStyle = getappdata(gcf, 'lineStyle'); %获取线型
        line([pos1(1); pos(1, 1)], [pos1(2); pos(1, 2)], 'linewidth',...
            lineWidth, 'LineStyle', lineStyle);   %绘制曲线
        set(hObject, 'UserData', pos(1, [1 2]));  %更新窗口对象的用户数据
    end
else   %若鼠标不在图片上
    set(hObject, 'Pointer', 'default'); %恢复鼠标指针形状为默认值
end
end

function btnUp(hObject, ~)
% 窗口的WindowButtonUpFcn回调函数
%% 鼠标释放时，更新标识变量isPressed的值为false
setappdata(hObject, 'isPressed', false);
end

function closeQuest(hObject, ~)
%% 创建一个提问对话框，进一步确认是否要关闭窗口
sel = questdlg('确认关闭当前窗口？', '关闭确认', 'Yes', 'No', 'No');
switch sel
    case 'Yes'  %用户点击了【Yes】按钮
        delete(hObject);
    case 'No'   %用户点击了【No】按钮
        return;
end
end
