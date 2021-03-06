function varargout = table1(varargin)
% TABLE1 MATLAB code for table1.fig
%      TABLE1, by itself, creates a new TABLE1 or raises the existing
%      singleton*.
%
%      H = TABLE1 returns the handle to a new TABLE1 or the handle to
%      the existing singleton*.
%
%      TABLE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLE1.M with the given input arguments.
%
%      TABLE1('Property','Value',...) creates a new TABLE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before table1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to table1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help table1

% Last Modified by GUIDE v2.5 01-Nov-2010 21:07:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @table1_OpeningFcn, ...
                   'gui_OutputFcn',  @table1_OutputFcn, ...
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


% --- Executes just before table1 is made visible.
function table1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to table1 (see VARARGIN)

% Choose default command line output for table1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes table1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = table1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
data = get(handles.uitable1, 'Data');
data(end, :) = [];
rowName = get(handles.uitable1, 'RowName');
rowName(end, :) = [];
set(handles.uitable1, 'RowName', rowName, 'Data', data);
