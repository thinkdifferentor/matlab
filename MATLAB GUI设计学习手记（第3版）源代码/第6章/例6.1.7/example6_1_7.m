function varargout = example6_1_7(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_7_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_7_OutputFcn, ...
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

function example6_1_7_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = example6_1_7_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function slid_permit_Callback(hObject, eventdata, handles)
if get(hObject, 'value')
    set(handles.slider1, 'enable', 'on')
else
    set(handles.slider1, 'enable', 'off')
end



