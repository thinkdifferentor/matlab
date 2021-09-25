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

setappdata(hObject, 'isPressed', false);  %������갴�¡���־����isPressed��ΪӦ������
cData = imread('loading.jpg');                 %��ȡ����ͼƬ
image(cData);   %���뱳��ͼƬ
set(handles.axes1, 'colororder', [0 0 1], 'units', 'normalized', 'position', [0 0 1 1]); %��������������

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
if strcmp(get(gcf, 'selectiontype'), 'alt')      %��������Ҽ�
    delete(findobj('type', 'line', 'parent', handles.axes1));  %ɾ�����л�ͼ
elseif strcmp(get(gcf, 'selectiontype'), 'open')  %��˫��������
    col = uisetcolor(get(handles.axes1, 'colororder'),'ѡ�񻭱���ɫ'); %������ɫ���öԻ���
    set(handles.axes1, 'colororder', col);    %���û�����ɫ
else   %���������
    pos = get(handles.axes1, 'currentpoint'); %��ȡ��ǰ������
    setappdata(hObject, 'isPressed', true);    %���¡���갴�¡���־����
    set(hObject, 'UserData', pos(1,[1,2]));      %�����û����ݣ��û����������洢֮ǰ�������
end


function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
isPressed = getappdata(hObject, 'isPressed');  %��ȡ����갴�¡���־����
pos = get(handles.axes1, 'currentpoint');  %��ȡ�û�����
if isPressed   %����괦�ڡ����¡�״̬
    pos1 = get(hObject, 'UserData');  %�õ���ǰ������
    line([pos1(1); pos(1, 1)], [pos1(2); pos(1, 2)], 'linewidth', 4);  %��������
    set(hObject, 'UserData', pos(1,[1 2]));  %�����û�����
end


function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
setappdata(hObject, 'isPressed', false);  %����Ӧ������