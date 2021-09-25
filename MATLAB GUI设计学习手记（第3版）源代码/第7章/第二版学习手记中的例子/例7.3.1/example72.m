function varargout = example72(varargin)
% EXAMPLE72 MATLAB code for example72.fig
%      EXAMPLE72, by itself, creates a new EXAMPLE72 or raises the existing
%      singleton*.
%
%      H = EXAMPLE72 returns the handle to a new EXAMPLE72 or the handle to
%      the existing singleton*.
%
%      EXAMPLE72('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE72.M with the given input arguments.
%
%      EXAMPLE72('Property','Value',...) creates a new EXAMPLE72 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example72_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example72_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example72

% Last Modified by GUIDE v2.5 03-Jan-2011 08:20:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example72_OpeningFcn, ...
                   'gui_OutputFcn',  @example72_OutputFcn, ...
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


% --- Executes just before example72 is made visible.
function example72_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

h = example72_1('Visible', 'off');
hPal2 = copyobj(findobj(h, 'Type', 'uipanel', 'Tag', 'uipanel1'), hObject);
set(hPal2, 'Position', get(handles.uipanel1, 'Position'), 'Visible', 'off');
handles.hPal2 = hPal2;
delete(h);


hTabStrip = handles.activex1;
hFont = hTabStrip.Font;
hFont.set('Name', '¡• È', 'Size', 12, 'Bold', true);
hTabStrip.Font = hFont;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example72 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example72_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function textDisp_Callback(hObject, eventdata, handles)


function textDisp_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slider1_Callback(hObject, ~, handles)
set(handles.textDisp, 'String', num2str(get(hObject, 'Value')));

function slider1_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function exit_Callback(hObject, eventdata, handles)
delete(gcf);

function activex1_BeforeClick(hObject, eventdata, handles)
if hObject.SelectedItem.index == 1
    set(handles.uipanel1, 'Visible', 'off');
    set(handles.hPal2, 'Visible', 'on');
else
    set(handles.hPal2, 'Visible', 'off');
    set(handles.uipanel1, 'Visible', 'on');
end
