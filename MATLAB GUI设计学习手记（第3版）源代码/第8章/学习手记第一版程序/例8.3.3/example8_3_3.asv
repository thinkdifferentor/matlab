function varargout = example8_3_3(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example8_3_3_OpeningFcn, ...
                   'gui_OutputFcn',  @example8_3_3_OutputFcn, ...
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

function example8_3_3_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
%% 创建定时器
t = timer('tag', 'timer1','ExecutionMode', 'fixedrate', 'timerfcn', {@t_update, handles});
%% 启动定时器
start(t);

guidata(hObject, handles);

function t_update(~, ~, handles)
if isfield(handles, 'figure1')  %若没有关闭窗口
    str1 = datestr(now, 'yyyy-mm-dd'); %获取年月日 
    str2 = datestr(now, 'HH:MM:SS'); %获取时分秒
    set(handles.activex1, 'AlphaNumeric', str2) %显示时分秒
    set(handles.activex2, 'AlphaNumeric', str1) %显示年月日
end

function varargout = example8_3_3_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function figure1_CloseRequestFcn(hObject, eventdata, handles)
t = timerfind; %查找定时器
stop(t);  %若定时器没有停止，停止定时器
delete(t); %删除定时器
delete(hObject); %关闭窗口


