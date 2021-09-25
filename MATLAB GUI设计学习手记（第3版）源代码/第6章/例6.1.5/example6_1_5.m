function varargout = example6_1_5(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_5_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_5_OutputFcn, ...
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

function example6_1_5_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = example6_1_5_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function save_data_Callback(hObject, eventdata, handles)
if get(hObject, 'value')   %若该对象Value值为真
    [filename, pathname, index] = uiputfile({'*.txt'; '*.xls'}, '数据另存为');
    if index               %若未选择【取消】
        set(handles.text1, 'string', [pathname filename])
    end
end



