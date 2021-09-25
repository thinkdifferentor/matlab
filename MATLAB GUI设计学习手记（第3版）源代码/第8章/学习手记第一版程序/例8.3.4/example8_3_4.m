function varargout = example8_3_4(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example8_3_4_OpeningFcn, ...
                   'gui_OutputFcn',  @example8_3_4_OutputFcn, ...
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

function example8_3_4_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

global n
n = 0;

guidata(hObject, handles);

function varargout = example8_3_4_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function start1_Callback(hObject, eventdata, handles)
if get(hObject,'value')
    t = timer('tag', 'timer1', 'ExecutionMode', 'fixedrate', 'timerfcn', {@tt, handles});
    start(t);
else
    ts = timerfind;
    stop(ts);
    delete(ts);
end

function tt(obj,eventdata,handles)
if ~isfield(handles, 'activex1')
    return
end
global n
if n == 8
    n = 0;
end
n = n + 1;
if ~n
    set(handles.activex1, 'Value', 0)
elseif isequal(get(handles.activex1, 'Mode'), 'Bitwise')
    set(handles.activex1, 'Value', 2^(n - 1))
else
    set(handles.activex1, 'Value', n)
end

function rev_Callback(hObject, eventdata, handles)
global n
n = 8 - n;
tt(hObject,eventdata,handles);
if isequal(get(handles.activex1, 'Direction'), 'DirectionForward')
    set(handles.activex1, 'Direction', 'DirectionBackward')
else
    set(handles.activex1, 'Direction', 'DirectionForward')
end

function modes_Callback(hObject, eventdata, handles)
if get(hObject, 'value')
    set(handles.activex1, 'Mode', 'LEDValue')
else
    set(handles.activex1, 'Mode', 'Bitwise')
end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
t = timerfind;
if ~isempty(t)
    stop(t);
    delete(t);
end
delete(hObject);


