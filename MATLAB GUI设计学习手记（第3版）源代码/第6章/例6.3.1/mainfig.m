function varargout = mainfig(varargin)
% MAINFIG M-file for mainfig.fig
%      MAINFIG, by itself, creates a new MAINFIG or raises the existing
%      singleton*.
%
%      H = MAINFIG returns the handle to a new MAINFIG or the handle to
%      the existing singleton*.
%
%      MAINFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFIG.M with the given input arguments.
%
%      MAINFIG('Property','Value',...) creates a new MAINFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainfig

% Last Modified by GUIDE v2.5 12-Oct-2010 20:37:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainfig_OpeningFcn, ...
                   'gui_OutputFcn',  @mainfig_OutputFcn, ...
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


% --- Executes just before mainfig is made visible.
function mainfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainfig (see VARARGIN)

% Choose default command line output for mainfig
handles.output = hObject;
guidata(hObject, handles);
%% 以下为添加的代码
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainfig_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
%以下为添加的代码
n = get(handles.listbox1, 'value'); %获取所选中选项的索引号
str_all = get(handles.listbox1, 'string'); %得到列表框的所有文本
varargout{2} = str_all{n};

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global n;
% %% 若双击左键，将所选中的选项文本传给次界面
% if isequal(get(gcf,'SelectionType'),'open')
%     n = get(hObject,'value'); %获取所选中选项的索引号
%     str_all = get(hObject,'string'); %得到列表框的所有文本
%     set(gcf, 'Visible', 'off'); %隐藏主界面
%     h = figure(nextfig);  %打开次界面并获取其窗口句柄；若次界面已经打开，获取其句柄
%     set(h, 'Visible', 'on'); %设置次界面窗口为可见
%     h_edit = findall(h, 'Tag', 'edit1'); %在次界面中查找可编辑文本框对象
%     set(h_edit, 'string', str_all{n}) %设置所选的选项文本给可编辑文本对象
% end
%% 若双击左键，将所选中的选项文本传给次界面
% global str;
% if isequal(get(gcf,'SelectionType'),'open')
%     n = get(hObject,'value'); %获取所选中选项的索引号
%     str_all = get(hObject,'string'); %得到列表框的所有文本
%     str = str_all{n};
%     set(gcf, 'Visible', 'off'); %隐藏主界面
%     nextfig('Visible', 'on');
% end
%% 若双击左键，将所选中的选项文本传给次界面
if isequal(get(gcf,'SelectionType'),'open')
    uiresume(gcf);
end

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
