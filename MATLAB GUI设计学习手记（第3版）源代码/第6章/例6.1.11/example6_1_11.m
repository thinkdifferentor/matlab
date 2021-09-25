function varargout = example6_1_11(varargin)
% EXAMPLE6_1_11 MATLAB code for example6_1_11.fig
%      EXAMPLE6_1_11, by itself, creates a new EXAMPLE6_1_11 or raises the existing
%      singleton*.
%
%      H = EXAMPLE6_1_11 returns the handle to a new EXAMPLE6_1_11 or the handle to
%      the existing singleton*.
%
%      EXAMPLE6_1_11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE6_1_11.M with the given input arguments.
%
%      EXAMPLE6_1_11('Property','Value',...) creates a new EXAMPLE6_1_11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example6_1_11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example6_1_11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help example6_1_11

% Last Modified by GUIDE v2.5 18-Aug-2014 20:44:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_1_11_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_1_11_OutputFcn, ...
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


% --- Executes just before example6_1_11 is made visible.
function example6_1_11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example6_1_11 (see VARARGIN)

% Choose default command line output for example6_1_11
handles.output = hObject;
%% ��ȡExcel�ļ�data.xls
[~, ~, raw] = xlsread('data.xls');
%% ����NaN�����ʾ
for i = 1 : numel(raw)  %������Ԫ����raw
    if isnan(raw{i})    %����ԪֵΪNaN�����øõ�ԪֵΪ���ַ���
        raw{i} = '';
    end
end
%% ��������ʾ�����table�У���ʹ����ڡ��ɱ༭��״̬
set(handles.table, 'ColumnName', raw(1, :), 'data', raw(2:end, :),...
    'ColumnEditable', true);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes example6_1_11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = example6_1_11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function mLine_Callback(hObject, eventdata, handles)


function mLine_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function nColumn_Callback(hObject, eventdata, handles)


function nColumn_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function iVal_Callback(hObject, eventdata, handles)


function iVal_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function btn_save_Callback(hObject, eventdata, handles)
%% �����ļ�����Ի���
[fName, pName, index] = uiputfile('*.xls', '���Ϊ', 'data_1.xls');
%% ��û�е����ȡ������ť�����ļ���Ϊ�Ϸ���EXCEL�ļ��������������д����ļ���
if index && strcmp(fName(end-3 : end), '.xls') 
    str = [pName fName];  %��ȡ�ļ�������·�����ļ���
    cloumnName = get(handles.table, 'ColumnName'); %��ȡ��������
    data = get(handles.table, 'data');  %��ȡ��������
    dataExcel = cell(size(data, 1)+1, size(data, 2)); %����һ���µ�Ԫ���飬׼������д��EXCEL�ļ�
    dataExcel(1, :) = cloumnName; %��ȡ�������
    dataExcel(2:end, :) = data;   %��ȡ�������
    xlswrite(str, dataExcel);     %���µ�Ԫ����д��ָ����EXCEL�ļ���
end


function table_CellSelectionCallback(hObject, eventdata, handles)
%% ��ȡ��������ʾ
mLine = eventdata.Indices(1);
set(handles.mLine, 'String', num2str(mLine));
%% ��ȡ��������ʾ
nColumn = eventdata.Indices(2);
set(handles.nColumn, 'String', num2str(nColumn));
%% ��ȡ��Ԫ������ݲ���ʾ
data = get(hObject, 'data');  %��ȡ�������
iVal = data{mLine, nColumn};  %��ȡ��ǰ��Ԫ�������
set(handles.iVal, 'String', num2str(iVal)); %��ʾ��ǰ��Ԫ�������
