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
%mΪͼƬ��������������nΪͼƬ�ĺ�����������mapDataΪ�������ͼ������
global m n mapData
%��ȡͼƬ����������axes1
axes(handles.axes1);
cData = imread('pic1.jpg');
hImage = image(cData);
axis off;
%���õ�ǰ������Ϊ���Ͻǵ�С������axes2
axes(handles.axes2);
%��ʼ��ȫ�ֱ���m��n
m = size(cData, 1);
n = size(cData, 2);
%��չͼƬ���ݣ�ʹ�������ͼƬ��Ե����ʱ�������ڳ���
mapData = 255 * ones(m+40, n+40, size(cData, 3), 'uint8');
mapData(21:m+20, 21:n+20, :) = cData;
%��ͼƬ���ݴ浽handles�ṹ����
handles.hImage = hImage;
%����handles
guidata(hObject, handles);

function varargout = piczoom_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
global m n mapData
%��ȡ��굱ǰ���ڵĵ�
pos = get(handles.axes1, 'CurrentPoint');
posX = pos(1, 1);
posY = pos(1, 2);
%������������������ڣ�����С������axes2
if((posX >= 1) && (posX <= n) &&...
        (posY >= 1) && (posY <= m))
    x = floor(posY) + 20;
    y = floor(posX) + 20;
    cData = mapData(x-20: x+20, y-20:y+20, :);
    axes(handles.axes2);
    image(cData);
    axis off;
end
