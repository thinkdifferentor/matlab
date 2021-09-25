function varargout = example6_1_1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_1_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_1_OutputFcn, ...
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

function example6_1_1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = example6_1_1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
c = get(hObject,'foreg');%foregroundcolorµÄ¼òÐ´
c_user = uisetcolor(c, 'Ñ¡ÔñÑÕÉ«');
set(hObject, 'foreg', c_user)



