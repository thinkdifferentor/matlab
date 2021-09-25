function varargout = nextfig(varargin)
% NEXTFIG M-file for nextfig.fig
%      NEXTFIG, by itself, creates a new NEXTFIG or raises the existing
%      singleton*.
%
%      H = NEXTFIG returns the handle to a new NEXTFIG or the handle to
%      the existing singleton*.
%
%      NEXTFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEXTFIG.M with the given input arguments.
%
%      NEXTFIG('Property','Value',...) creates a new NEXTFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nextfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nextfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nextfig

% Last Modified by GUIDE v2.5 13-Oct-2010 01:07:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nextfig_OpeningFcn, ...
                   'gui_OutputFcn',  @nextfig_OutputFcn, ...
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


% --- Executes just before nextfig is made visible.
function nextfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nextfig (see VARARGIN)
%OpeningFcn�����������������Ϊ5ʱ��vararginΪ1��2�ĵ�Ԫ����
% if (nargin == 5) && (strcmp(varargin{1}, 'strInfo')) 
%     set(handles.edit1, 'String', varargin{2});
% end
% Choose default command line output for nextfig
handles.output = hObject;
%% ����Ϊ��ӵĴ���
[h, str] = mainfig;
delete(h);
set(handles.edit1, 'String', str);
%% ����Ϊ��ӵĴ���
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = nextfig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global n;
% set(hObject,'string',n)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
% %% ���شν��棬��ʾ������
% set(gcf, 'Visible', 'off');
% h = figure(mainfig);
% set(h, 'Visible', 'on');
%% ����ʾ�����棬����ʾ�ν���
set(gcf, 'Visible', 'off');
[h, str] = mainfig;
delete(h);
set(handles.edit1, 'String', str);
set(handles.figure1, 'Visible', 'on');
