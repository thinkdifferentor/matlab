function varargout = example6_1_10(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_10_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_10_OutputFcn, ...
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

function example6_1_10_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = example6_1_10_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function bin_dec_SelectionChangeFcn(hObject, ~, handles)
str = get(handles.num, 'string');
switch get(hObject, 'tag')
    case 'bin'
        val = floor(str2double(str));
        if (~isnan(val)) && (val >= 0)
            set(handles.num, 'string', dec2bin(val))
        else
            set(handles.num, 'string', 'ÊäÈë´íÎó')
        end
    case 'dec'
        if all(str == '0' | str == '1')
            set(handles.num, 'string', num2str(bin2dec(str)))
        else
            set(handles.num, 'string', 'ÊäÈë´íÎó')
        end
end
