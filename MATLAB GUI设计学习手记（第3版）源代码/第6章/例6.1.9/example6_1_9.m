function varargout = example6_1_9(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_9_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_9_OutputFcn, ...
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

function example6_1_9_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = example6_1_9_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function province_Callback(hObject, eventdata, handles)
sel = get(hObject, 'value');
stra = {'¹þ¶û±õ'; '´óÇì'; '°¢³Ç'; 'ÆëÆë¹þ¶û'; 'ºÚºÓ'};
strb = {'Îäºº'; '»Æ¸Ô'; 'Ïå·®'; 'ÒË²ý'; '¾£ÖÝ'; 'Ð¢¸Ð'};
switch sel
    case 1
        set(handles.city, 'string', '', 'value', 1)
    case 2
        set(handles.city, 'string', stra, 'value', 1)
    case 3
        set(handles.city, 'string', strb, 'value', 1)
end
