function varargout = award(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @award_OpeningFcn, ...
                   'gui_OutputFcn',  @award_OutputFcn, ...
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

function award_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = award_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function nStart_Callback(hObject, eventdata, handles)

function nStart_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function remove_Callback(hObject, eventdata, handles)

function remove_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function start_Callback(hObject, ~, handles)
%% ��ȡ��ֵ��Χ����������ʱ��
valStart = str2double(get(handles.nStart, 'String')); %��ȡ���������ʼֵ
if isnan(valStart)  %������Ĳ�����Ч����ֵ���������򲢷���
    set(handles.nStart, 'String', '')
    return;
end
valEnd = str2double(get(handles.nEnd, 'String')); %��ȡ������Ľ���ֵ
if isnan(valEnd)  %������Ĳ�����Ч����ֵ���������򲢷���
    set(handles.nEnd, 'String', '')
    return;
end
strRemove = get(handles.remove, 'String'); %��ȡҪ�ų�����ֵ����Ϊ�ַ���
cellRemove = cellstr(strRemove); %��Ҫ�ų�����ֵת��Ϊ��Ԫ������ʽ
valRemove = []; %��Ҫ�ų�����ֵ�浽����valRemove��
%% ��ȡҪ�ų�����ֵ������valRemove��ȥ
if ~isempty(cellRemove)
    for i = 1 : length(valRemove)
        valRemove = [valRemove str2double(cellRemove{i})]; %#ok<*AGROW>
    end
end
%% �����ֵ��ȡֵ��Χ�޶�Ϊ����ֵ
valStart = floor(valStart);
valEnd =  floor(valEnd);
valRemove = floor(valRemove);
%% ����ʼֵ���ڽ���ֵ������ʼֵС�ڵ���0�������ʼֵ
if valStart > valEnd || valStart <= 0
    set(handles.nStart, 'String', '')
    return;
end
%% ���°�ť�Ϳɱ༭�ı��ļ���״̬
set([handles.nStart,handles.nEnd,handles.remove,hObject], 'enable', 'off');
set(handles.stop, 'enable', 'on')
%% ������ʱ��������
t = timer('BusyMode', 'queue', 'ExecutionMode', 'fixedSpacing', ...
    'Period', 0.02, 'TimerFcn', {@update, handles, valStart, valEnd, valRemove});
start(t); %������ʱ��

function stop_Callback(hObject, ~, handles)
%% ֹͣ��ɾ����ʱ������������ϲ���ڣ������н�¥��Ļ�Ա��ϵ��̳����Ա
t = timerfind; %���Ҷ�ʱ��
stop(t);       %ֹͣ��ʱ��
delete(t);     %ɾ����ʱ��
%% ���°�ť�Ϳɱ༭�ı��ļ���״̬
set([handles.nStart,handles.nEnd,handles.remove,handles.start], 'enable', 'on');
set(hObject, 'enable', 'off');
pause(0.4); %��ͣ0.4��
%% ������ϲ����
h = figure('MenuBar', 'none', 'Name', '��ϲ��', 'NumberTitle', 'off',...
    'units', 'pixels', 'position', [500 400 400 200], 'Windowstyle', 'modal');
uicontrol('style', 'text', 'units', 'pixels', 'position', [50 60 300 80], ...
    'string', sprintf('��ϲ��%s¥��Ļ�Ա�н����뼰ʱ��ϵ��̳����Ա��ȡ�鼮����',...
    get(handles.valDisp, 'string')), 'BackgroundColor', get(h, 'Color'),...
    'fontsize', 16, 'foregroundcolor', 'r', 'fontname', '����');
uicontrol('string', '�ر�', 'units', 'pixels', 'position', [160 30 70 40],...
    'fontsize', 16, 'fontweight', 'bold', 'foregroundcolor', 'r', 'callback',...
    'delete(gcbf);')

function update(obj, ~, handles, valStart, valEnd, valRemove)
%% ˢ�������ֵ
if ishandle(handles.figure1)              %��û�йرմ���
    val = randi([valStart valEnd], 1, 1); %�������һ��ָ����Χ�ڵ�����ֵ
    index = find(valRemove == val, 1);    %�Ƚ����������ֵ���ų��б����ֵ
    if isempty(index)  %�����������ֵ�����ų��б���
        set(handles.valDisp, 'string', num2str(val)); %�����������ʾ��ֵΪ���������ֵ
    end
else  %���رմ���
    stop(obj);   %ֹͣ��ʱ��
    delete(obj); %ɾ����ʱ��
end


function valDisp_Callback(hObject, eventdata, handles)


function valDisp_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
