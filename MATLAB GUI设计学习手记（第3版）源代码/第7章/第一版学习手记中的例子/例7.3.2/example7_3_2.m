function varargout = example7_3_2(varargin)
% EXAMPLE7_3_2 M-file for example7_3_2.fig
%      EXAMPLE7_3_2, by itself, creates a new EXAMPLE7_3_2 or raises the existing
%      singleton*.
%
%      H = EXAMPLE7_3_2 returns the handle to a new EXAMPLE7_3_2 or the handle to
%      the existing singleton*.
%
%      EXAMPLE7_3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE7_3_2.M with the given input arguments.
%
%      EXAMPLE7_3_2('Property','Value',...) creates a new EXAMPLE7_3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example7_3_2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example7_3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example7_3_2

% Last Modified by GUIDE v2.5 20-Sep-2009 23:50:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example7_3_2_OpeningFcn, ...
                   'gui_OutputFcn',  @example7_3_2_OutputFcn, ...
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


% --- Executes just before example7_3_2 is made visible.
function example7_3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example7_3_2 (see VARARGIN)

% Choose default command line output for example7_3_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example7_3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example7_3_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
