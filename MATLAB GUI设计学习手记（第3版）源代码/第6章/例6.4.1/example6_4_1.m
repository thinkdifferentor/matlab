function varargout = example6_4_1(varargin)
% EXAMPLE6_4_1 MATLAB code for example6_4_1.fig
%      EXAMPLE6_4_1, by itself, creates a new EXAMPLE6_4_1 or raises the existing
%      singleton*.
%
%      H = EXAMPLE6_4_1 returns the handle to a new EXAMPLE6_4_1 or the handle to
%      the existing singleton*.
%
%      EXAMPLE6_4_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE6_4_1.M with the given input arguments.
%
%      EXAMPLE6_4_1('Property','Value',...) creates a new EXAMPLE6_4_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example6_4_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example6_4_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example6_4_1

% Last Modified by GUIDE v2.5 02-Jan-2011 03:18:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_4_1_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_4_1_OutputFcn, ...
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


% --- Executes just before example6_4_1 is made visible.
function example6_4_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example6_4_1 (see VARARGIN)

% Choose default command line output for example6_4_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example6_4_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example6_4_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function listbox1_Callback(hObject, eventdata, handles)
%% 若双击左键，且双击的选项不在右边列表框中，在右边列表框中添加该选项
if isequal(get(gcf, 'SelectionType'), 'open')
    str = get(hObject, 'string'); %获取左边列表框的选项
    n = get(hObject, 'value');    %获取左边列表框当前选项的索引值
    strs = get(handles.listbox2, 'string'); %获取右边列表框的选项
    n2 = get(handles.listbox2, 'value');   %获取右边列表框当前选项的索引值
    if isempty(strs) || (~any(strcmp(str(n), strs))) %若当前选项不在右边列表框中
        set(handles.listbox2, 'string', [get(handles.listbox2, 'string');...
            str(n)], 'value', max(n2, 1)); %添加当前选项到右边的列表框
    end
end


function listbox1_CreateFcn(hObject, eventdata, handles)

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function listbox2_Callback(hObject, eventdata, handles)
str = get(gcf, 'SelectionType');
if strcmp(str, 'open')
    index = get(hObject, 'Value');
    strDisp = get(hObject, 'String');
    strDisp(index) = [];
    set(hObject, 'String', strDisp, 'Value', size(strDisp, 1));
end

function listbox2_CreateFcn(hObject, eventdata, handles)

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
