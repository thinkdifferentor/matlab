function varargout = serial_communication(varargin)
%   ���ߣ��޻���
%   ���ܣ������շ�
%   �汾��20101103 V2.0
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @serial_communication_OpeningFcn, ...
                   'gui_OutputFcn',  @serial_communication_OutputFcn, ...
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

function serial_communication_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
warning off all;
%% �ı䴰�����Ͻǵ�ͼ��Ϊicon.jpg
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('icon.jpg'));
%% ��ʼ������
hasData = false; 	%���������Ƿ���յ�����
isShow = false;  	%�����Ƿ����ڽ���������ʾ�����Ƿ�����ִ�к���dataDisp
isStopDisp = false;  	%�����Ƿ����ˡ�ֹͣ��ʾ����ť
isHexDisp = false;   	%�����Ƿ�ѡ�ˡ�ʮ��������ʾ��
isHexSend = false;	%�����Ƿ�ѡ�ˡ�ʮ�����Ʒ��͡�
numRec = 0;    	%�����ַ�����
numSend = 0;   	%�����ַ�����
strRec = '';   		%�ѽ��յ��ַ���
%��ȡͼƬ���ݣ�ֻ�ڵ�һ������ʱ��ȡ
pathstr = fileparts(which(mfilename));
if exist([pathstr '\lamb.mat'], 'file') == 2
    load([pathstr '\lamb.mat']);
else
    openData = imread('green.jpg');
    closedData = imread('red.jpg');
    save lamb.mat openData closedData;
end
%% ������������ΪӦ�����ݣ����봰�ڶ�����
setappdata(hObject, 'hasData', hasData);
setappdata(hObject, 'strRec', strRec);
setappdata(hObject, 'numRec', numRec);
setappdata(hObject, 'numSend', numSend);
setappdata(hObject, 'isShow', isShow);
setappdata(hObject, 'isStopDisp', isStopDisp);
setappdata(hObject, 'isHexDisp', isHexDisp);
setappdata(hObject, 'isHexSend', isHexSend);
setappdata(hObject, 'openData', openData);
setappdata(hObject, 'closedData', closedData);
%��ʼ������״ָ̬ʾ�ƣ����ڵ�Ĭ��Ϊ�ر�״̬
set(handles.lamb, 'cdata', closedData); 

guidata(hObject, handles);

function varargout = serial_communication_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function com_Callback(hObject, ~, handles)

function com_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rate_Callback(hObject, eventdata, handles)

function rate_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function jiaoyan_Callback(hObject, eventdata, handles)

function jiaoyan_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function data_bits_Callback(hObject, eventdata, handles)

function data_bits_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function stop_bits_Callback(hObject, eventdata, handles)

function stop_bits_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function start_serial_Callback(hObject, eventdata, handles)
%   ����/�رմ��ڡ���ť�Ļص�����
%    �򿪴��ڣ�����ʼ����ز���
%% �����¡��򿪴��ڡ���ť���򿪴���
if get(hObject, 'value')
    %% ��ȡ���ڵĶ˿���
    com_n = sprintf('com%d', get(handles.com, 'value'));
    %% ��ȡ������
    rates = [300 600 1200 2400 4800 9600 19200 38400 43000 56000 57600 115200];
    baud_rate = rates(get(handles.rate, 'value'));
    %% ��ȡУ��λ����
    switch get(handles.jiaoyan, 'value')
        case 1
            jiaoyan = 'none';
        case 2
            jiaoyan = 'odd';
        case 3
            jiaoyan = 'even';
    end
    %% ��ȡ����λ����
    data_bits = 5 + get(handles.data_bits, 'value');
    %% ��ȡֹͣλ����
    stop_bits = get(handles.stop_bits, 'value');
    %% �������ڶ���
    scom = serial(com_n);
    %% ���ô������ԣ�ָ����ص�����
    set(scom, 'BaudRate', baud_rate, 'Parity', jiaoyan, 'DataBits',...
        data_bits, 'StopBits', stop_bits, 'BytesAvailableFcnCount', 10,...
        'BytesAvailableFcnMode', 'byte', 'BytesAvailableFcn', {@bytes, handles},...
        'TimerPeriod', 0.05, 'timerfcn', {@dataDisp, handles});
    %% �����ڶ���ľ����Ϊ�û����ݣ����봰�ڶ���
    set(handles.figure1, 'UserData', scom);
    %% ���Դ򿪴���
    try
        fopen(scom);  %�򿪴���
    catch   % �����ڴ�ʧ�ܣ���ʾ�����ڲ��ɻ�ã���
        msgbox('���ڲ��ɻ�ã�');
        set(hObject, 'value', 0);  %���𱾰�ť 
        return;
    end
    %% �򿪴��ں������ڷ������ݣ���ս�����ʾ������������״ָ̬ʾ�ƣ�
    %% �����ı���ť�ı�Ϊ���رմ��ڡ�
    set(handles.period_send, 'Enable', 'on');  	%���á��Զ����͡���ť
    set(handles.manual_send, 'Enable', 'on');  %���á��ֶ����͡���ť
    set(handles.xianshi, 'string', ''); 			%��ս�����ʾ��
    set(handles.lamb, 'cdata', getappdata('openData')); %��������״ָ̬ʾ��
    set(hObject, 'String', '�رմ���');  		%���ñ���ť�ı�Ϊ���رմ��ڡ�
else  %���رմ���
    %% ֹͣ��ɾ����ʱ��
    t = timerfind;
    if ~isempty(t)
        stop(t);
        delete(t);
    end
    %% ֹͣ��ɾ�����ڶ���
    scoms = instrfind;
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);
    %% ���á��Զ����͡��͡��ֶ����͡���ť��Ϩ�𴮿�״ָ̬ʾ��
    set(handles.period_send, 'Enable', 'off', 'value', 0); %���á��Զ����͡���ť
    set(handles.manual_send, 'Enable', 'off');  %���á��ֶ����͡���ť
    set(handles.lamb, 'cdata', getappdata('closedData')); %Ϩ�𴮿�״ָ̬ʾ��
    set(hObject, 'String', '�򿪴���');  		%���ñ���ť�ı�Ϊ���򿪴��ڡ�
end

function dataDisp(obj, event, handles)
%	���ڵ�TimerFcn�ص�����
%   ����������ʾ
%% ��ȡ����
hasData = getappdata(handles.figure1, 'hasData'); %�����Ƿ��յ�����
strRec = getappdata(handles.figure1, 'strRec');   %�������ݵ��ַ�����ʽ����ʱ��ʾ������
numRec = getappdata(handles.figure1, 'numRec');   %���ڽ��յ������ݸ���
%% ������û�н��յ����ݣ��ȳ��Խ��մ�������
if ~hasData
    bytes(obj, event, handles);
end
%% �����������ݣ���ʾ��������
if hasData
    %% ��������ʾģ��ӻ�����
    %% ��ִ����ʾ����ģ��ʱ�������ܴ������ݣ�����ִ��BytesAvailableFcn�ص�����
    setappdata(handles.figure1, 'isShow', true); 
    %% ��Ҫ��ʾ���ַ������ȳ���10000�������ʾ��
    if length(strRec) > 10000
        strRec = '';
        setappdata(handles.figure1, 'strRec', strRec);
    end
    %% ��ʾ����
    set(handles.xianshi, 'string', strRec);
    %% ���½��ռ���
    set(handles.rec,'string', numRec);
    %% ����hasData��־���������������Ѿ���ʾ
    setappdata(handles.figure1, 'hasData', false);
    %% ��������ʾģ�����
    setappdata(handles.figure1, 'isShow', false);
end
 
function bytes(obj, ~, handles)
%   ���ڵ�BytesAvailableFcn�ص�����
%   ���ڽ�������
%% ��ȡ����
strRec = getappdata(handles.figure1, 'strRec'); %��ȡ����Ҫ��ʾ������
numRec = getappdata(handles.figure1, 'numRec'); %��ȡ�����ѽ������ݵĸ���
isStopDisp = getappdata(handles.figure1, 'isStopDisp'); %�Ƿ����ˡ�ֹͣ��ʾ����ť
isHexDisp = getappdata(handles.figure1, 'isHexDisp'); %�Ƿ�ʮ��������ʾ
isShow = getappdata(handles.figure1, 'isShow');  %�Ƿ�����ִ����ʾ���ݲ���
%% ������ִ��������ʾ�������ݲ����մ�������
if isShow
    return;
end
%% ��ȡ���ڿɻ�ȡ�����ݸ���
n = get(obj, 'BytesAvailable');
%% �����������ݣ�������������
if n
    %% ����hasData����������������������Ҫ��ʾ
    setappdata(handles.figure1, 'hasData', true);
    %% ��ȡ��������
    a = fread(obj, n, 'uchar');
    %% ��û��ֹͣ��ʾ�������յ������ݽ��������׼����ʾ
    if ~isStopDisp 
        %% ���ݽ�����ʾ��״̬����������ΪҪ��ʾ���ַ���
        if ~isHexDisp 
            c = char(a');
        else
            strHex = dec2hex(a')';
            strHex2 = [strHex; blanks(size(a, 1))];
            c = strHex2(:)';
        end
        %% �����ѽ��յ����ݸ���
        numRec = numRec + size(a, 1);
        %% ����Ҫ��ʾ���ַ���
        strRec = [strRec c];
    end
    %% ���²���
    setappdata(handles.figure1, 'numRec', numRec); %�����ѽ��յ����ݸ���
    setappdata(handles.figure1, 'strRec', strRec); %����Ҫ��ʾ���ַ���
end


function qingkong_Callback(hObject, eventdata, handles)
%% ���Ҫ��ʾ���ַ���
setappdata(handles.figure1, 'strRec', '');
%% �����ʾ
set(handles.xianshi, 'String', '');

function stop_disp_Callback(hObject, eventdata, handles)
%% ���ݡ�ֹͣ��ʾ����ť��״̬������isStopDisp����
if get(hObject, 'Value')
    isStopDisp = true;
else
    isStopDisp = false;
end
setappdata(handles.figure1, 'isStopDisp', isStopDisp);

function radiobutton1_Callback(hObject, eventdata, handles)

function radiobutton2_Callback(hObject, eventdata, handles)

function togglebutton4_Callback(hObject, eventdata, handles)

function hex_disp_Callback(hObject, eventdata, handles)
%% ���ݡ�ʮ��������ʾ����ѡ���״̬������isHexDisp����
if get(hObject, 'Value')
    isHexDisp = true;
else
    isHexDisp = false;
end
setappdata(handles.figure1, 'isHexDisp', isHexDisp);

function manual_send_Callback(hObject, eventdata, handles)
scom = get(handles.figure1, 'UserData');
numSend = getappdata(handles.figure1, 'numSend');
val = get(handles.sends, 'UserData');
numSend = numSend + length(val);
set(handles.trans, 'string', num2str(numSend));
setappdata(handles.figure1, 'numSend', numSend);
%% ��Ҫ���͵����ݲ�Ϊ�գ���������
if ~isempty(val)
    %% ���õ������ĳ�ֵ
    n = 1000;
    while n
        %% ��ȡ���ڵĴ���״̬��������û������д���ݣ�д������
        str = get(scom, 'TransferStatus');
        if ~(strcmp(str, 'write') || strcmp(str, 'read&write'))
            fwrite(scom, val, 'uint8', 'async'); %����д�봮��
            break;
        end
        n = n - 1; %������
    end
end


function clear_send_Callback(hObject, eventdata, handles)
%% ��շ�����
set(handles.sends, 'string', '')
%% ����Ҫ���͵�����
set(handles.sends, 'UserData', []);

function checkbox2_Callback(hObject, eventdata, handles)


function period_send_Callback(hObject, eventdata, handles)
%   ���Զ����͡���ť��Callback�ص�����
%% �����¡��Զ����͡���ť��������ʱ��������ֹͣ��ɾ����ʱ��
if get(hObject, 'value')
    t1 = 0.001 * str2double(get(handles.period1, 'string'));%��ȡ��ʱ������
    t = timer('ExecutionMode','fixedrate', 'Period', t1, 'TimerFcn',...
        {@manual_send_Callback, handles}); %������ʱ��
    set(handles.period1, 'Enable', 'off'); %�������ö�ʱ�����ڵ�Edit Text����
    set(handles.sends, 'Enable', 'inactive'); %�������ݷ��ͱ༭��
    start(t);  %������ʱ��
else
    set(handles.period1, 'Enable', 'on'); %�������ö�ʱ�����ڵ�Edit Text����
    set(handles.sends, 'Enable', 'on');   %�������ݷ��ͱ༭��
    t = timerfind; %���Ҷ�ʱ��
    stop(t); %ֹͣ��ʱ��
    delete(t); %ɾ����ʱ��
end

function period1_Callback(hObject, eventdata, handles)

function period1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function clear_count_Callback(hObject, eventdata, handles)
%% �������㣬�����²���numRec��numSend
set([handles.rec, handles.trans], 'string', '0')
setappdata(handles.figure1, 'numRec', 0);
setappdata(handles.figure1, 'numSend', 0);

function copy_data_Callback(hObject, eventdata, handles)
%% �����Ƿ������ƽ���������ʾ���ڵ�����
if get(hObject,'value')
    set(handles.xianshi, 'enable', 'on');
else
    set(handles.xianshi, 'enable', 'inactive');
end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
%   �رմ���ʱ����鶨ʱ���ʹ����Ƿ��ѹر�
%   ��û�йرգ����ȹر�
%% ���Ҷ�ʱ��
t = timerfind;
%% �����ڶ�ʱ������ֹͣ���ر�
if ~isempty(t)
    stop(t);  %����ʱ��û��ֹͣ����ֹͣ��ʱ��
    delete(t);
end
%% ���Ҵ��ڶ���
scoms = instrfind;
%% ����ֹͣ���ر�ɾ�����ڶ���
try
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);
end
%% �رմ���
delete(hObject);

function hex_send_Callback(hObject, eventdata, handles)
%% ���ݡ�ʮ�����Ʒ��͡���ѡ���״̬������isHexSend����
if get(hObject,'value')
    isHexSend = true;
else
    isHexSend = false;
end
setappdata(handles.figure1, 'isHexSend', isHexSend);
%% ����Ҫ���͵�����
sends_Callback(handles.sends, eventdata, handles);


function sends_Callback(hObject, eventdata, handles)
%   ���ݷ��ͱ༭����Callback�ص�����
%   ����Ҫ���͵�����
%% ��ȡ���ݷ��ͱ༭�����ַ���
str = get(hObject, 'string');
%% ��ȡ����isHexSend��ֵ
isHexSend = getappdata(handles.figure1, 'isHexSend');
if ~isHexSend %��ΪASCIIֵ��ʽ���ͣ�ֱ�ӽ��ַ���ת��Ϊ��Ӧ����ֵ
    val = double(str);
else  %��Ϊʮ�����Ʒ��ͣ���ȡҪ���͵�����
    n = find(str == ' ');   %���ҿո�
    n =[0 n length(str)+1]; %�ո������ֵ
    %% ÿ�������ڿո�֮����ַ���Ϊ��ֵ��ʮ��������ʽ������ת��Ϊ��ֵ
    for i = 1 : length(n)-1 
        temp = str(n(i)+1 : n(i+1)-1);  %���ÿ�����ݵĳ��ȣ�Ϊ����ת��Ϊʮ������׼��
        if ~rem(length(temp), 2)
            b{i} = reshape(temp, 2, [])'; %��ÿ��ʮ�������ַ���ת��Ϊ��Ԫ����
        else
            break;
        end
    end
    val = hex2dec(b)';     %��ʮ�������ַ���ת��Ϊʮ���������ȴ�д�봮��
end
%% ����Ҫ��ʾ������
set(hObject, 'UserData', val); 


function lamb_Callback(hObject, eventdata, handles)
