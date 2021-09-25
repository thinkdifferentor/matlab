function varargout = mygui2017(varargin)
% MYGUI2017 M-file for mygui2017.fig
%      MYGUI2017, by itself, creates a new MYGUI2017 or raises the existing
%      singleton*.
%
%      H = MYGUI2017 returns the handle to a new MYGUI2017 or the handle to
%      the existing singleton*.
%
%      MYGUI2017('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI2017.M with the given input arguments.
%
%      MYGUI2017('Property','Value',...) creates a new MYGUI2017 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mygui2017_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mygui2017_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mygui2017

% Last Modified by GUIDE v2.5 05-Oct-2017 15:05:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mygui2017_OpeningFcn, ...
                   'gui_OutputFcn',  @mygui2017_OutputFcn, ...
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


% --- Executes just before mygui2017 is made visible.
function mygui2017_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mygui2017 (see VARARGIN)
handles.peaks=peaks(35);
handles.membrane=membrane;
[x,y]=meshgrid(-8:0.5:8);
r=sqrt(x.^2+y.^2)+eps;
sinc=sin(r)./r;
handles.sinc=sinc;
handles.current_data=handles.peaks;
surf(handles.current_data);
% Choose default command line output for mygui2017
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mygui2017 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mygui2017_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in surf_pushbutton.
function surf_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to surf_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
surf(handles.current_data);

% --- Executes on button press in Mesh_pushbutton.
function Mesh_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Mesh_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Mesh(handles.current_data);

% --- Executes on button press in contour_pushbotton.
function contour_pushbotton_Callback(hObject, eventdata, handles)
% hObject    handle to contour_pushbotton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contour(handles.current_data);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'value');
str=get(hObject,'string');
switch str{val};
case 'peaks'
    handles.current_data=handles.peaks;
    case  'membrane'
        handles.current_data=handles.membrane;
        case 'sinc'
        handles.current_data=handles.sinc;    
end
guidata(hObject,handles)
        
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Choose_menu_Callback(hObject, eventdata, handles)
% hObject    handle to Choose_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Surf_menu_Callback(hObject, eventdata, handles)
% hObject    handle to Surf_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
surf(handles.current_data);

% --------------------------------------------------------------------
function Mesh_menu_Callback(hObject, eventdata, handles)
% hObject    handle to Mesh_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mesh(handles.current_data);
% --------------------------------------------------------------------
function contour_menu_Callback(hObject, eventdata, handles)
% hObject    handle to contour_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contour(handles.current_data);
% --------------------------------------------------------------------
function closef_menu_Callback(hObject, eventdata, handles)
% hObject    handle to closef_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
% --------------------------------------------------------------------
function close_menu_Callback(hObject, eventdata, handles)
% hObject    handle to close_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function box_menu_Callback(hObject, eventdata, handles)
% hObject    handle to box_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(gcbo,'Checked'),'on')
    set(gcbo,'Checked','off');
else
    set(gcbo,'Checked','on');
end
box;

% --------------------------------------------------------------------
function grid_menu_Callback(hObject, eventdata, handles)
% hObject    handle to grid_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(gcbo,'Checked'),'on')
    set(gcbo,'Checked','off');
else
    set(gcbo,'Checked','on');
end
grid;
% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function context_menu_Callback(hObject, eventdata, handles)
% hObject    handle to context_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
