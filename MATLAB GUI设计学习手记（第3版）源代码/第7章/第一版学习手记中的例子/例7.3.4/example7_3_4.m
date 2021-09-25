function varargout = example7_3_4(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example7_3_4_OpeningFcn, ...
                   'gui_OutputFcn',  @example7_3_4_OutputFcn, ...
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

function example7_3_4_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

global flag
flag = 0;

guidata(hObject, handles);

function varargout = example7_3_4_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function activex3_MouseDown(hObject, eventdata, handles)
global flag
flag = 1;

function activex3_MouseMove(hObject, eventdata, handles)
global flag
if flag
    val = get(hObject, 'value');
    set(handles.activex2, 'value', val)
    set(handles.activex1, 'NeedleValue', val)
end

function activex3_MouseUp(hObject, eventdata, handles)
global flag
flag = 0;



