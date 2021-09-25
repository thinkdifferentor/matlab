function varargout = example6_1_12(varargin)
% EXAMPLE6_1_12 MATLAB code for example6_1_12.fig
%      EXAMPLE6_1_12, by itself, creates a new EXAMPLE6_1_12 or raises the existing
%      singleton*.
%
%      H = EXAMPLE6_1_12 returns the handle to a new EXAMPLE6_1_12 or the handle to
%      the existing singleton*.
%
%      EXAMPLE6_1_12('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE6_1_12.M with the given input arguments.
%
%      EXAMPLE6_1_12('Property','Value',...) creates a new EXAMPLE6_1_12 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example6_1_12_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example6_1_12_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example6_1_12

% Last Modified by GUIDE v2.5 18-Aug-2014 20:54:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_12_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_12_OutputFcn, ...
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


% --- Executes just before example6_1_12 is made visible.
function example6_1_12_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example6_1_12 (see VARARGIN)

% Choose default command line output for example6_1_12
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example6_1_12 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example6_1_12_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function load_pic_Callback(hObject, eventdata, handles)
[fname, pname, index] = uigetfile({'*.jpg';'*.bmp'}, '选择图片');%创建图片选择对话框
if index%若选择了图片文件
    str = [pname fname];%获取所选图片的路径和文件名
    c = imread(str);%读取该图片的图像数据到矩阵c
    image(c, 'Parent', handles.axes1);%将图像数据显示到当前坐标轴
    axis off;%隐藏坐标轴
end