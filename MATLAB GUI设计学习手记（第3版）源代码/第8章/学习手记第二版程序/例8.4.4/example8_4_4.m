function varargout = example8_4_4(varargin)
% EXAMPLE8_4_4 MATLAB code for example8_4_4.fig
%      EXAMPLE8_4_4, by itself, creates a new EXAMPLE8_4_4 or raises the existing
%      singleton*.
%
%      H = EXAMPLE8_4_4 returns the handle to a new EXAMPLE8_4_4 or the handle to
%      the existing singleton*.
%
%      EXAMPLE8_4_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE8_4_4.M with the given input arguments.
%
%      EXAMPLE8_4_4('Property','Value',...) creates a new EXAMPLE8_4_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example8_4_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example8_4_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example8_4_4

% Last Modified by GUIDE v2.5 03-Jan-2011 12:04:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example8_4_4_OpeningFcn, ...
                   'gui_OutputFcn',  @example8_4_4_OutputFcn, ...
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


% --- Executes just before example8_4_4 is made visible.
function example8_4_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example8_4_4 (see VARARGIN)

% Choose default command line output for example8_4_4
handles.output = hObject;
global n %����ȫ�ֱ���n������LED�Ƶ�״ֵ̬
n = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example8_4_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example8_4_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function start1_Callback(hObject, eventdata, handles)
if get(hObject, 'Value') %�����¡���ʼ����ť��������ʱ��������
    t = timer('tag', 'timer1', 'ExecutionMode', 'fixedrate', 'timerfcn', {@tt, handles});
    start(t);
else  %�����𡾿�ʼ����ť��ֹͣ��ɾ����ʱ��
    ts = timerfind;
    stop(ts);
    delete(ts);
end

function tt(obj,eventdata,handles)
global n %����ȫ�ֱ���n
if isfield(handles,'activex1')
    if n == 8 %����һ�ε�״̬Ϊȫ��������nΪ��ֵ0
        n = 0;
    end
    n = n + 1; %��һ����
    if ~n      %��n=0����ʾһ���Ʋ���
        set(handles.activex1, 'Value', 0);
    elseif isequal(get(handles.activex1, 'Mode'), 'Bitwise') %��LED��λģʽ
        set(handles.activex1, 'Value', 2^(n - 1));
    else %��LED��ֵģʽ
        set(handles.activex1, 'Value', n);
    end
end

function rev_Callback(hObject, eventdata, handles)
global n  %����ȫ�ֱ���n
n = 8 - n;  %nֵ��8��ģ
tt(hObject,eventdata,handles); %ִ�ж�ʱ���ص�����
%% LED�Ƶķ���ȡ��
if isequal(get(handles.activex1, 'Direction'), 'DirectionForward')
    set(handles.activex1, 'Direction', 'DirectionBackward')
else
    set(handles.activex1, 'Direction', 'DirectionForward')
end


function modes_Callback(hObject, eventdata, handles)
%% �л�LED����ģʽ
if get(hObject, 'value') %�л�Ϊֵģʽ
    set(handles.activex1, 'Mode', 'LEDValue');
else  %�л�Ϊλģʽ
    set(handles.activex1, 'Mode', 'Bitwise');
end


function figure1_CloseRequestFcn(hObject, eventdata, handles)
t = timerfind;
stop(t);
delete(t);
delete(hObject);
