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
if get(hObject, 'Value')  %�����°�ť
    %% ���ð�ť���ı����ݺ��ı���ɫ
    set(hObject, 'string', 'ֹͣ', 'ForegroundColor', 'r')
    %% ������ʱ��������
    t = timer('startdelay', 1, 'TimerFcn', {@timer1, handles});  
    start(t);
end

function timer1(obj,~,handles)
%% ��ť���𣬲����°�ť�ı����ݺ��ı���ɫ
set(handles.start1, 'value', 0, 'string', '����', 'ForegroundColor', 'k')
stop(obj);   %ֹͣ��ʱ��
delete(obj); %ɾ����ʱ�����˳�������ʱ���������Զ���������Բ���Ҫclear




