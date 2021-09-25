function varargout = award(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @award_OpeningFcn, ...
                   'gui_OutputFcn',  @award_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function award_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = award_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function nStart_Callback(hObject, eventdata, handles)

function nStart_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function remove_Callback(hObject, eventdata, handles)

function remove_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function start_Callback(hObject, ~, handles)
%% 获取数值范围，并启动定时器
valStart = str2double(get(handles.nStart, 'String')); %获取随机数的起始值
if isnan(valStart)  %若输入的不是有效的数值，清空输入框并返回
    set(handles.nStart, 'String', '')
    return;
end
valEnd = str2double(get(handles.nEnd, 'String')); %获取随机数的结束值
if isnan(valEnd)  %若输入的不是有效的数值，清空输入框并返回
    set(handles.nEnd, 'String', '')
    return;
end
strRemove = get(handles.remove, 'String'); %获取要排除的数值，存为字符串
cellRemove = cellstr(strRemove); %将要排除的数值转化为单元数组形式
valRemove = []; %将要排除的数值存到数组valRemove中
%% 提取要排除的数值到数组valRemove中去
if ~isempty(cellRemove)
    for i = 1 : length(valRemove)
        valRemove = [valRemove str2double(cellRemove{i})]; %#ok<*AGROW>
    end
end
%% 将随机值的取值范围限定为整数值
valStart = floor(valStart);
valEnd =  floor(valEnd);
valRemove = floor(valRemove);
%% 若起始值大于结束值，或起始值小于等于0，清空起始值
if valStart > valEnd || valStart <= 0
    set(handles.nStart, 'String', '')
    return;
end
%% 更新按钮和可编辑文本的激活状态
set([handles.nStart,handles.nEnd,handles.remove,hObject], 'enable', 'off');
set(handles.stop, 'enable', 'on')
%% 创建定时器并启动
t = timer('BusyMode', 'queue', 'ExecutionMode', 'fixedSpacing', ...
    'Period', 0.02, 'TimerFcn', {@update, handles, valStart, valEnd, valRemove});
start(t); %启动定时器

function stop_Callback(hObject, ~, handles)
%% 停止、删除定时器，并弹出恭喜窗口，提醒中奖楼层的会员联系论坛管理员
t = timerfind; %查找定时器
stop(t);       %停止定时器
delete(t);     %删除定时器
%% 更新按钮和可编辑文本的激活状态
set([handles.nStart,handles.nEnd,handles.remove,handles.start], 'enable', 'on');
set(hObject, 'enable', 'off');
pause(0.4); %暂停0.4秒
%% 创建恭喜窗口
h = figure('MenuBar', 'none', 'Name', '恭喜！', 'NumberTitle', 'off',...
    'units', 'pixels', 'position', [500 400 400 200], 'Windowstyle', 'modal');
uicontrol('style', 'text', 'units', 'pixels', 'position', [50 60 300 80], ...
    'string', sprintf('恭喜第%s楼层的会员中奖，请及时联系论坛管理员领取书籍！！',...
    get(handles.valDisp, 'string')), 'BackgroundColor', get(h, 'Color'),...
    'fontsize', 16, 'foregroundcolor', 'r', 'fontname', '黑体');
uicontrol('string', '关闭', 'units', 'pixels', 'position', [160 30 70 40],...
    'fontsize', 16, 'fontweight', 'bold', 'foregroundcolor', 'r', 'callback',...
    'delete(gcbf);')

function update(obj, ~, handles, valStart, valEnd, valRemove)
%% 刷新随机数值
if ishandle(handles.figure1)              %若没有关闭窗口
    val = randi([valStart valEnd], 1, 1); %随机产生一个指定范围内的整数值
    index = find(valRemove == val, 1);    %比较随机出来的值与排除列表里的值
    if isempty(index)  %若随机出来的值不在排除列表内
        set(handles.valDisp, 'string', num2str(val)); %设置数码管显示的值为随机出来的值
    end
else  %若关闭窗口
    stop(obj);   %停止定时器
    delete(obj); %删除定时器
end


function valDisp_Callback(hObject, eventdata, handles)


function valDisp_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
