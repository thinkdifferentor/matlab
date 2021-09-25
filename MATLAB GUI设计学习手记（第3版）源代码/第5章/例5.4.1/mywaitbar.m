%文件名：mywaitbar.m
function h = mywaitbar(varargin)
%   创建一个窗口内嵌的进度条
%   输入参数含义如下：
%     第1个参数为进度，值在[0,1]范围内；
%     第2个参数有两种含义：
%       创建进度条时，第2个参数为进度条对象的标题；
%       更新进度值时，whichbar为mywaitbar返回的进度条句柄
%     第3个参数指定进度条所在窗口
%     第4、5个参数指定进度条在窗口中的位置,单位为像素
%   作者：罗华飞
%   版本：20101007V2.0
if nargin == 0
    %% 直接调用mywaitbar函数，创建默认的嵌入式进度条
    %如：mywaitbar
    hWaitbar = waitbar(0, '嵌入式进度条', 'visible', 'off'); %创建隐藏的进度条
    hAxes = findall(hWaitbar, 'type', 'axes'); %查找进度条内的坐标轴
    figure;
    h_axes = copyobj(hAxes, gcf);   %复制进度条到当前窗口
    set(h_axes, 'Units', 'pixels'); %进度条的坐标轴Units默认值为points，需要更改
    pos = get(h_axes, 'position');  %获取进度条坐标轴的位置和尺寸
    set(h_axes, 'position', [10, 10, pos(3:4)]); %更改坐标轴的位置，尺寸不变
elseif nargin > 1 %
    x = varargin{1};
    whichbar = varargin{2};
    if (nargin == 5) && (ischar(whichbar) || iscellstr(whichbar))  %此时创建进度条
        %% 此时调用格式为h = mywaitbar(p, 'title' , h_figure, x, y)
         %如：h1 = mywaitbar(0.5, 'title' , figure, 10, 10)
        hWaitbar = waitbar(x, whichbar, 'visible', 'off');
        hAxes = findall(hWaitbar, 'type', 'axes');
        h_figure = varargin{3};
        set(h_figure, 'visible', 'on');
        h_axes = copyobj(hAxes, h_figure);
        set(h_axes, 'Units', 'pixels');
        pos = get(h_axes, 'position');
        set(h_axes, 'position', [varargin{4}, varargin{5}, pos(3:4)])
    elseif isnumeric(whichbar)
        %% 此时调用格式为mywaitbar(p, h)或mywaitbar(p, h, 'title')
        h_axes = whichbar;
        hPatch = findobj(h_axes, 'Type', 'patch');
        set(hPatch,'XData',[0 100*x 100*x 0])
        if nargin == 3
            %% 调用格式为mywaitbar(p, h, 'title')
            hTitle = get(h_axes, 'title'); %获取标题对象的句柄（text对象）
            set(hTitle, 'string', varargin{3}); %设置标题对象的文本内容
        end
    end
else
    error('input arguments error...');
end
%% 设置输出参数
if nargout == 1
    h = h_axes;
end
