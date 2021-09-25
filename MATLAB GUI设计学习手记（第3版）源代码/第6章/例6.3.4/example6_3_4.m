function varargout = example6_3_4(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_3_4_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_3_4_OutputFcn, ...
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

function example6_3_4_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
set(handles.listbox1, 'UserData', true);  %�۵�Ϊ��
guidata(hObject, handles);

function varargout = example6_3_4_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function listbox1_Callback(hObject, ~, handles)
%% ��ȡ��ǰѡ�������ֵ
n = get(hObject, 'value');
%% ���ݵ�ǰѡ������Ҽ��˵���˫����ʾ������չ��/�۵�����
if n ~= 3  %��û��ѡ�С���ѧ��
    set(hObject, 'uicontextmenu', ''); %�Ҽ��˵�Ϊ��
    if isequal(get(gcf, 'SelectionType'), 'open') %��˫�����
        str = get(hObject, 'string'); %��ȡ�б����ı�
        if n < 3 %��ѡ�С����ġ���Ӣ�
            set(handles.text1, 'string', str{n})
        else     %��ѡ�С���ѧ������ѡ�ȥ���ı�ǰ�ġ��N��
            str1 = str{n}; 
            set(handles.text1, 'string', str1(2 : end));
        end
    end
else  %��ѡ�С���ѧ��
    set(hObject, 'uicontextmenu', handles.caidan1); %�����Ҽ��˵�
    if isequal(get(gcf, 'SelectionType'), 'normal') %���������
        isFold = get(hObject, 'UserData'); %��ȡ���۵���״̬
        isFold = ~isFold; %���۵���״̬ȡ��
        if ~isFold  %����Ҫ����Ϊ��չ����״̬
            set(hObject, 'String', {'����', 'Ӣ��', '��ѧ', '�N�ߵ���ѧ',...
                '�N���Դ���'});
        else        %����Ҫ����Ϊ���۵���״̬
            set(hObject, 'String', {'����', 'Ӣ��', '>>��ѧ'}, 'Value', 3);
        end
        set(hObject, 'UserData', isFold); %���¡��۵���״̬
    end
end

function caidan1_Callback(hObject, eventdata, handles)

function mathematic_Callback(~, ~, handles)
set(handles.text1, 'string', '�ߵ���ѧ');

function linear_Callback(~, ~, handles)
set(handles.text1, 'string', '���Դ���');
