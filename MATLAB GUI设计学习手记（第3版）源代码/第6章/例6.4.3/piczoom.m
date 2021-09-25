function varargout = piczoom(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @piczoom_OpeningFcn, ...
                   'gui_OutputFcn',  @piczoom_OutputFcn, ...
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

function piczoom_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%m为图片的纵向像素数，n为图片的横向像素数，mapData为修正后的图像数据
global m n mapData
%读取图片到主坐标轴axes1
axes(handles.axes1);
cData = imread('pic1.jpg');
hImage = image(cData);
axis off;
%设置当前坐标轴为右上角的小坐标轴axes2
axes(handles.axes2);
%初始化全局变量m和n
m = size(cData, 1);
n = size(cData, 2);
%扩展图片数据，使得鼠标在图片边缘附近时，不至于出错
mapData = 255 * ones(m+40, n+40, size(cData, 3), 'uint8');
mapData(21:m+20, 21:n+20, :) = cData;
%将图片数据存到handles结构体中
handles.hImage = hImage;
%更新handles
guidata(hObject, handles);

function varargout = piczoom_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
global m n mapData
%获取鼠标当前所在的点
pos = get(handles.axes1, 'CurrentPoint');
posX = pos(1, 1);
posY = pos(1, 2);
%若鼠标在坐标轴区域内，更新小坐标轴axes2
if((posX >= 1) && (posX <= n) &&...
        (posY >= 1) && (posY <= m))
    x = floor(posY) + 20;
    y = floor(posX) + 20;
    cData = mapData(x-20: x+20, y-20:y+20, :);
    axes(handles.axes2);
    image(cData);
    axis off;
end
