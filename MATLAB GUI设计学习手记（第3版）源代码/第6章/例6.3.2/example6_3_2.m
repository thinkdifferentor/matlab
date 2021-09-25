function varargout = example6_3_2(varargin)
% EXAMPLE6_3_2 MATLAB code for example6_3_2.fig
%      EXAMPLE6_3_2, by itself, creates a new EXAMPLE6_3_2 or raises the existing
%      singleton*.
%
%      H = EXAMPLE6_3_2 returns the handle to a new EXAMPLE6_3_2 or the handle to
%      the existing singleton*.
%
%      EXAMPLE6_3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE6_3_2.M with the given input arguments.
%
%      EXAMPLE6_3_2('Property','Value',...) creates a new EXAMPLE6_3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example6_3_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example6_3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example6_3_2

% Last Modified by GUIDE v2.5 18-Aug-2014 21:37:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_3_2_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_3_2_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before example6_3_2 is made visible.
function example6_3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example6_3_2 (see VARARGIN)

% Choose default command line output for example6_3_2
handles.output = hObject;

setappdata(hObject, 'isPressed', false);  %将“鼠标按下”标志变量isPressed存为应用数据
cData = imread('loading.jpg');                 %读取背景图片
image(cData);   %载入背景图片
set(handles.axes1, 'colororder', [0 0 1], 'units', 'normalized', 'position', [0 0 1 1]); %坐标轴铺满窗口

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example6_3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example6_3_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
if strcmp(get(gcf, 'selectiontype'), 'alt')      %若按鼠标右键
    delete(findobj('type', 'line', 'parent', handles.axes1));  %删除所有绘图
elseif strcmp(get(gcf, 'selectiontype'), 'open')  %若双击鼠标左键
    col = uisetcolor(get(handles.axes1, 'colororder'),'选择画笔颜色'); %弹出颜色设置对话框
    set(handles.axes1, 'colororder', col);    %设置画笔颜色
else   %若单击左键
    pos = get(handles.axes1, 'currentpoint'); %获取当前点坐标
    setappdata(hObject, 'isPressed', true);    %更新“鼠标按下”标志变量
    set(hObject, 'UserData', pos(1,[1,2]));      %更新用户数据，用户数据用来存储之前点的坐标
end


function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
isPressed = getappdata(hObject, 'isPressed');  %获取“鼠标按下”标志变量
pos = get(handles.axes1, 'currentpoint');  %获取用户数据
if isPressed   %若鼠标处于“按下”状态
    pos1 = get(hObject, 'UserData');  %得到当前点坐标
    line([pos1(1); pos(1, 1)], [pos1(2); pos(1, 2)], 'linewidth', 4);  %绘制曲线
    set(hObject, 'UserData', pos(1,[1 2]));  %更新用户数据
end


function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
setappdata(hObject, 'isPressed', false);  %更新应用数据