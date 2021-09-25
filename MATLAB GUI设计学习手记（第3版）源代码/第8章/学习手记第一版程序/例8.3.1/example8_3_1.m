function varargout = example8_3_1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example8_3_1_OpeningFcn, ...
                   'gui_OutputFcn',  @example8_3_1_OutputFcn, ...
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

function example8_3_1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = example8_3_1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function start1_Callback(hObject, ~, handles)
if get(hObject, 'Value')  %若按下按钮
    %% 设置按钮的文本内容和文本颜色
    set(hObject, 'string', '停止', 'ForegroundColor', 'r')
    %% 创建定时器并启动
    t = timer('startdelay', 1, 'TimerFcn', {@timer1, handles});  
    start(t);
end

function timer1(obj,~,handles)
%% 按钮弹起，并更新按钮文本内容和文本颜色
set(handles.start1, 'value', 0, 'string', '启动', 'ForegroundColor', 'k')
stop(obj);   %停止定时器
delete(obj); %删除定时器；退出函数后定时器变量会自动清除，所以不需要clear




