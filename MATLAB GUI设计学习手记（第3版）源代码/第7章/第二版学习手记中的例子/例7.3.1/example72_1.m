function varargout = example72_1(varargin)
% EXAMPLE72_1 MATLAB code for example72_1.fig
%      EXAMPLE72_1, by itself, creates a new EXAMPLE72_1 or raises the existing
%      singleton*.
%
%      H = EXAMPLE72_1 returns the handle to a new EXAMPLE72_1 or the handle to
%      the existing singleton*.
%
%      EXAMPLE72_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE72_1.M with the given input arguments.
%
%      EXAMPLE72_1('Property','Value',...) creates a new EXAMPLE72_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example72_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example72_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example72_1

% Last Modified by GUIDE v2.5 19-Oct-2010 23:44:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example72_1_OpeningFcn, ...
                   'gui_OutputFcn',  @example72_1_OutputFcn, ...
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


% --- Executes just before example72_1 is made visible.
function example72_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example72_1 (see VARARGIN)

% Choose default command line output for example72_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example72_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example72_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function popMenu_Callback(hObject, eventdata, handles)
str = get(hObject, 'String');
val = get(hObject, 'Value');
hText = findobj(get(hObject, 'Parent'), 'Style', 'edit');
set(hText, 'String', str{val});

function popMenu_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)


function edit2_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function textDisp_Callback(hObject, eventdata, handles)


function textDisp_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
