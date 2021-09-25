function varargout = jisuanqi4(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @jisuanqi4_OpeningFcn, ...
    'gui_OutputFcn',  @jisuanqi4_OutputFcn, ...
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


% --- Executes just before jisuanqi4 is made visible.
function jisuanqi4_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%% �ر����о�����Ϣ
warning off all;
%% �޸�GUI���Ͻ�ͼ��
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('icon1.jpg'));
%% ��ʼ������
reset(hObject, eventdata, handles);

function reset(hObject, ~, handles)
%% ������ʽ�Ƿ�Ϊfun(a, b)��ֵΪfalseʱ��������ʽΪa��op��b
setappdata(hObject, 'isFun', false);
%% ָ����ǰ��ֵ�Ƿ�ΪС����ֻ��ʮ����ģʽʱ��ֵ�ſ���Ϊtrue
setappdata(hObject, 'isDecimal', false);
%% ָ����ǰ�Ƿ�������룻��ֵΪfalseʱ����Ҫ����
setappdata(hObject, 'showExpand', false);
%% ������ǰ�Ƿ�����2NDF����
setappdata(hObject, 'isSecFun', false);
%% �����Ƿ��Ѿ������������;�������������ʱ����ֵΪ��
setappdata(hObject, 'hasOperator', false);
%% ������ǰ�Ľ���ģʽ
setappdata(hObject, 'base', uint8(10));
%% ����������ʽ����ΪӦ�����ݴ���exp����
setappdata(hObject, 'exp', ' ');
handles.datas = [];
guidata(hObject, handles);

function varargout = jisuanqi4_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function valDec = oct2dec(valOct)
str = num2str(valOct);
val = str - '0';
twos = pow2(length(str)*3-3 : -3 : 0);
valDec = sum(val .* twos);

function number(~, ~, handles, numChar)
%% ��ȡ����
isDecimal = getappdata(gcf, 'isDecimal');
showExpand = getappdata(gcf, 'showExpand');
base = getappdata(gcf, 'base');
%% ����������ַ�numChar�Ͳ��������������ַ���
str = get(handles.display, 'string');
if ~showExpand || (str(1) == '0' && (~isDecimal))  %����Ҫ����
    if base == uint8(10) %����ǰΪʮ����
        set(handles.display, 'string', [numChar '.']);
    else %����ǰΪ��������
        set(handles.display, 'string', numChar);
    end
elseif base == uint8(10) %����ǰΪʮ����
    if length(str) < 15   %���ĳ���С��15
        if isDecimal   %С��
            set(handles.display, 'string', [str numChar])
        else
            set(handles.display, 'string', [str(1 : end-1) numChar '.']);
        end
    end
elseif base == uint8(8) && length(str) < 20 %����ǰΪ�˽���
    set(handles.display, 'string', [str numChar]);
elseif base == uint8(16) && length(str) < 20 %����ǰΪʮ������
    set(handles.display, 'string', [str numChar]);
elseif base == uint8(2) && length(str) < 28 %����ǰΪ������
    set(handles.display, 'string', [str numChar]);
end
setappdata(gcf, 'hasOperator', false);
setappdata(gcf, 'showExpand', true);

function num7_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '7');

function num8_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '8');

function num9_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '9');

function num4_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '4');

function num5_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '5');

function num6_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '6');

function num2_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '2');

function num3_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '3');

function num0_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '0');

function num1_Callback(hObject, eventdata, handles)
number(hObject, eventdata, handles, '1');

function num_fuhao_Callback(~, ~, handles)
str = get(handles.display, 'string');
if strcmp(str, '0.')
    return;
end
%% ��ȡ����
hasOperator = getappdata(gcf, 'hasOperator'); %�Ƿ�����������
%% �Բ������ķ���ȡ��
if ~hasOperator %����ǰδ���������
    if str(1) == '-'
        set(handles.display, 'string', str(2 : end));
    else
        set(handles.display, 'string', ['-' str]);
    end
else %���ڶ����������������°���ȡ����ť�����ü�����״̬
    setappdata(gcf, 'isFun', false);
    setappdata(gcf, 'isDecimal', false);
    setappdata(gcf, 'showExpand', false);
    setappdata(gcf, 'isSecFun', false);
    setappdata(gcf, 'hasOperator', false);
    setappdata(gcf, 'base', uint8(10));
    setappdata(gcf, 'exp', ' ');
    set(handles.display, 'String', '0.');
end

function dot_Callback(~, ~, handles)
%% ��ȡ����
isDecimal = getappdata(gcf, 'isDecimal'); %�Ƿ�ΪС��
showExpand = getappdata(gcf, 'showExpand');
if ~showExpand
    set(handles.display, 'string', '0.');
end
%% ��֮ǰ������С��ģʽ������ΪС��ģʽ����������ʾΪ��չģʽ
if ~isDecimal
    setappdata(gcf, 'isDecimal', true);
    setappdata(gcf, 'showExpand', true);
end

function num = str2val(b, base)
if base == uint8(2)
    num = bin2dec(b);
elseif base == uint8(16)
    num = hex2dec(b);
elseif base == uint8(8)
    num = oct2dec(eval(b));
else
    num = str2double(b);
end

function equal_Callback(hObject, ~, handles)
%% ��ȡ����
isFun = getappdata(gcf, 'isFun');  %�Ƿ�Ϊfun(a, b)
hasOperator = getappdata(gcf, 'hasOperator'); %�Ƿ�����������
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
exp = getappdata(gcf, 'exp');
b = get(handles.display, 'string');
num = str2val(b, base);
if ~isFun
    if hasOperator
        exp(end) = '';
    else
        exp = [exp sprintf('(%g)', num)];
    end
else
    exp = [exp sprintf('%g)', floor(num))];
    setappdata(gcf, 'isFun', false);
end
try
    res = eval(exp);
catch
    if base == uint8(10)
        set(handles.display, 'string', '0.')
    else
        set(handles.display, 'string', '0')
    end
    setappdata(gcf, 'showExpand', false);
    setappdata(gcf, 'exp', ' ');
    return;
end
c = val2str(res, base);
setappdata(gcf, 'showExpand', false);
set(handles.secndf, 'Visible', 'off');
setappdata(gcf, 'exp', ' ');
set(handles.display, 'string', c);

function xy_Callback(hObject, eventdata, handles)
%% ��ȡ����
isSecFun = getappdata(gcf, 'isSecFun'); %�Ƿ�Ϊ�ڶ�����
hasOperator = getappdata(gcf, 'hasOperator'); %�Ƿ�����������
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
exp = getappdata(gcf, 'exp');
if base == uint8(10)
    b = get(handles.display, 'string');
    num = str2val(b, base);
    if ~isSecFun
        if hasOperator
            exp(end) = '^';
        else
            setappdata(gcf, 'hasOperator', true);
            exp = [exp num2str(num) '^'];
        end
        setappdata(gcf, 'showExpand', false);
        setappdata(gcf, 'exp', exp);
    else
        funa_b(hObject, eventdata, handles, 'xyinv(%g,');
    end
end

function c = xyinv(a, b)
c = a^(b^(-1));

function c = val2str(res, base)
if base == uint8(10)
    c = sprintf('%g', res);
    if isempty(find(c == '.', 1))
        c = [c '.'];
    end
elseif base == uint8(2)
    c = dec2bin(abs(res));
elseif base == uint8(16)
    c = dec2hex(abs(res));
else
    c = dec2base(abs(res), 8);
end

function add_min_mul_div(hObject, eventdata, handles, operator)
%% ��ȡ����
hasOperator = getappdata(gcf, 'hasOperator'); %�Ƿ�����������
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
exp = getappdata(gcf, 'exp');
%% �Ӻ�����
b = get(handles.display, 'string');
num = str2val(b, base);
if hasOperator
    exp(end) = operator;
else
    exp = [exp num2str(num) operator];
    setappdata(gcf, 'hasOperator', true);
end
setappdata(gcf, 'showExpand', false);
setappdata(gcf, 'isFun', false);
setappdata(gcf, 'exp', exp);

function add_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
add_min_mul_div(hObject, eventdata, handles,  '+');

function minus_Callback(hObject, eventdata, handles)
add_min_mul_div(hObject, eventdata, handles,  '-');

function multiply_Callback(hObject, eventdata, handles)
add_min_mul_div(hObject, eventdata, handles,  '*');

function divide_Callback(hObject, eventdata, handles)
add_min_mul_div(hObject, eventdata, handles,  '/');

function num16(~, ~, handles, num16Char)
%% ��ȡ����
showExpand = getappdata(gcf, 'showExpand');
str = get(handles.display, 'string');
if ~showExpand %��ʼ״̬
    set(handles.display, 'string', num16Char)
    setappdata(gcf,'showExpand', true);
elseif length(str) < 20
    set(handles.display, 'string', [str num16Char])
end
setappdata(gcf, 'hasOperator', false);

function numa_Callback(hObject, eventdata, handles)
num16(hObject, eventdata, handles, 'A');

function numb_Callback(hObject, eventdata, handles)
num16(hObject, eventdata, handles, 'B');

function numc_Callback(hObject, eventdata, handles)
num16(hObject, eventdata, handles, 'C');

function numd_Callback(hObject, eventdata, handles)
num16(hObject, eventdata, handles, 'D');

function nume_Callback(hObject, eventdata, handles)
num16(hObject, eventdata, handles, 'E');

function numf_Callback(hObject, eventdata, handles)
num16(hObject, eventdata, handles, 'F');

function pi_val_Callback(hObject, eventdata, handles)
set(handles.display, 'string', '3.14159265')
setappdata(gcf, 'isDecimal', true);
setappdata(gcf, 'showExpand', false);
setappdata(gcf, 'showExpand', true);
setappdata(gcf, 'hasOperator', false);

function unaryFcn(hObject, eventdata, handles, op1, op2)
%% ��ȡ����
isSecFun = getappdata(gcf, 'isSecFun'); %�Ƿ�Ϊ�ڶ�����
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
if base == uint8(10)
    setappdata(gcf, 'showExpand', false);
    setappdata(gcf, 'isDecimal', false);
    setappdata(gcf, 'hasOperator', false);
    setappdata(gcf, 'exp', ' ');
    str = get(handles.display, 'string');
    if ~isSecFun
        try
            format short;
            res = eval(sprintf(op1, str));
            set(handles.display, 'string', num2str(res, '%7.3f'));
        catch
            set(handles.display, 'string', '�������')
        end
    else
        setappdata(gcf, 'isSecFun', false);
        set(handles.secndf, 'visible', 'off');
        set(handles.radiobutton1, 'enable', 'on');
        set(handles.radiobutton2, 'enable', 'on');
        set(handles.radiobutton3, 'enable', 'on');
        try
            format short;
            res = eval(sprintf(op2, str));
            set(handles.display, 'string', num2str(res, '%7.3f'));
        catch
            set(handles.display, 'string', '�������')
        end
    end
end



function lgx_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'log10(%s)', '10^(%s)');

function lnx_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'log(%s)', 'exp(%s)');

function log2x_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'log2(%s)', '2^(%s)(%s)');

function sqrtx_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'sqrt(%s)', '(%s)^(1/3)');

function tanx_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'tan(%s)', 'atan(%s)');

function sinx_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'sin(%s)', 'asin(%s)');

function cosx_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'cos(%s)', 'acos(%s)');

function x2_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, '(%s)^2', '1/(%s)');

function fac_Callback(hObject, eventdata, handles)
unaryFcn(hObject, eventdata, handles, 'factorial(%f)', 'sum([1:%f])');

function onc_Callback(~, ~, handles)
%% ��ȡ����
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
set(handles.secndf,'visible','off','string','2ndF')
set(handles.radiobutton1,'enable','on')
set(handles.radiobutton2,'enable','on')
set(handles.radiobutton3,'enable','on')
if base == uint8(10)
    set(handles.display, 'string', '0.')
else
    set(handles.display, 'string', '0')
end
setappdata(gcf, 'hasOperator', false);
setappdata(gcf, 'isSecFun', false);
setappdata(gcf, 'showExpand', false);
setappdata(gcf, 'isDecimal', false);
setappdata(gcf, 'isFun', false);
set(handles.secndf, 'visible', 'off', 'string', '2ndF')
setappdata(gcf, 'exp', ' ');

function secf_Callback(hObject, eventdata, handles)
%% ��ȡ����
isSecFun = getappdata(gcf, 'isSecFun'); %�Ƿ�Ϊ�ڶ�����
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
isSecFun = ~isSecFun;
setappdata(gcf, 'isSecFun', isSecFun);
if isSecFun
    set(handles.secndf, 'visible', 'on', 'string', '2ndF')
    set(handles.jinzhi, 'selectedobject', handles.radiobutton4)
    h_all = [handles.num0 handles.num1 handles.num2 handles.num3 handles.num4 ...
        handles.num5 handles.num6 handles.num7 handles.num8 handles.num9 ...
        handles.e_val handles.pi_val handles.dot];
    set(h_all, 'enable', 'on')
    a_f = [handles.numa handles.numb handles.numc handles.numd handles.nume handles.numf];
    set(a_f, 'enable', 'off')
    b = get(handles.display, 'string');
    if base == uint8(2)
        b = sprintf('%g.', bin2dec(b));
    elseif base == uint8(16)
        b = sprintf('%g.', hex2dec(b));
    elseif base == uint8(8)
        b = sprintf('%g.', oct2dec(eval(b)));
    end
    set(handles.display, 'string', b);
    set(handles.radiobutton1, 'enable', 'off');
    set(handles.radiobutton2, 'enable', 'off');
    set(handles.radiobutton3, 'enable', 'off');
else
    set(handles.secndf, 'visible', 'off');
    set(handles.radiobutton1, 'enable', 'on');
    set(handles.radiobutton2, 'enable', 'on');
    set(handles.radiobutton3, 'enable', 'on');
end

function backspace_Callback(~, ~, handles)
%% ��ȡ����
isDecimal = getappdata(gcf, 'isDecimal');
showExpand = getappdata(gcf, 'showExpand');
base = getappdata(gcf, 'base'); %��ֵ�Ļ���

str = get(handles.display, 'string');
if ~showExpand
    if base == uint8(10)
        set(handles.display, 'string', '0.')
    else
        set(handles.display,'string','0')
    end
else
    if base == uint8(10)
        if strcmp(str(end-1), '.')
            setappdata(gcf, 'isDecimal', true); %С��
            set(handles.display, 'string', str(1 : end-1))
        elseif strcmp(str(end), '.')
            if isDecimal
                setappdata(gcf, 'isDecimal', false);
            else
                if strcmp(str(1), '-')
                    n = 3;
                else
                    n = 2;
                end
                if length(str) > n
                    str(end - 1) = '';
                    set(handles.display, 'string', str);
                else
                    set(handles.display, 'string', '0.');
                    setappdata(gcf, 'isDecimal', false);
                end
            end
        else
            set(handles.display, 'string', str(1 : end-1));
        end
    else
        if length(str) > 1
            set(handles.display, 'string', str(1 : end-1));
        else
            set(handles.display, 'string', '0');
        end
    end
end

function mean1_Callback(hObject, eventdata, handles)
%% ��ȡ����
showExpand = getappdata(gcf, 'showExpand');
isSecFun = getappdata(gcf, 'isSecFun'); %�Ƿ�Ϊ�ڶ�����
if (~isfield(handles, 'datas')) || (isempty(handles.datas))
    return;
end
str = get(handles.display, 'string');
datas = handles.datas;
if showExpand %��չ��ʾ
    datas = [datas str2double(str)];
    setappdata(gcf, 'showExpand', false);
end
if ~isSecFun
    val = mean(datas);
else
    val = sum(datas.^2);
    setappdata(gcf, 'isSecFun', false);
end
set(handles.display, 'string', num2str(val, '%8.2f'));
set(handles.secndf, 'visible', 'off', 'string', '2ndF');
set(handles.radiobutton1, 'enable', 'on');
set(handles.radiobutton2, 'enable', 'on');
set(handles.radiobutton3, 'enable', 'on');
handles.datas = [];
guidata(hObject, handles);

function std1_Callback(hObject, eventdata, handles)
if (~isfield(handles, 'datas')) || (isempty(handles.datas))
    return;
end
%% ��ȡ����
showExpand = getappdata(gcf, 'showExpand');
isSecFun = getappdata(gcf, 'isSecFun'); %�Ƿ�Ϊ�ڶ�����

str = get(handles.display, 'string');
datas = handles.datas;
if showExpand %��չ��ʾ
    datas = [datas str2double(str)];
    setappdata(gcf, 'showExpand', false);
end
if ~isSecFun
    val = std(datas)^2;
else
    val = std(datas);
    setappdata(gcf, 'isSecFun', false);
end
set(handles.display, 'string', num2str(val, '%8.2f'));
set(handles.secndf, 'visible', 'off', 'string', '2ndF');
set(handles.radiobutton1, 'enable', 'on');
set(handles.radiobutton2, 'enable', 'on');
set(handles.radiobutton3, 'enable', 'on');
handles.datas = [];
guidata(hObject, handles);

function dc_Callback(hObject, eventdata, handles)
set(handles.secndf, 'visible', 'on', 'string', 'M-0');
set(handles.radiobutton1, 'enable', 'off');
set(handles.radiobutton2, 'enable', 'off');
set(handles.radiobutton3, 'enable', 'off');
set(handles.jinzhi, 'SelectedObject', handles.radiobutton4);
h_all = [handles.num0 handles.num1 handles.num2 handles.num3 handles.num4 ...
    handles.num5 handles.num6 handles.num7 handles.num8 handles.num9 ...
    handles.e_val handles.pi_val handles.dot];
set(h_all, 'enable', 'on');
a_f = [handles.numa handles.numb handles.numc handles.numd handles.nume handles.numf];
set(a_f, 'enable', 'off')
set(handles.display, 'string', '������һ����ֵ��');
reset(hObject, eventdata, handles);

function m_add_Callback(hObject, eventdata, handles)
%% ��ȡ����
showExpand = getappdata(gcf, 'showExpand');
str = get(handles.display,'string');
if showExpand
    handles.datas = [handles.datas str2double(str)];
    set(handles.secndf, 'string', ['M-' num2str(length(handles.datas))]);
    guidata(hObject, handles);
    setappdata(gcf, 'showExpand', false);
end

function funa_b(hObject, eventdata, handles, expStr)
%% ��ȡ����
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
setappdata(gcf, 'showExpand', false);
setappdata(gcf, 'isFun', true);
b = get(handles.display, 'string');
num = str2val(b, base);
setappdata(gcf, 'exp', sprintf(expStr, floor(num)));

function and1_Callback(hObject, eventdata, handles)
funa_b(hObject, eventdata, handles, 'bitand(%g,');

function or1_Callback(hObject, eventdata, handles)
funa_b(hObject, eventdata, handles, 'bitor(%g,');

function xor1_Callback(hObject, eventdata, handles)
funa_b(hObject, eventdata, handles, 'bitxor(%g,');

function not1_Callback(hObject, eventdata, handles)
funa_b(hObject, eventdata, handles, 'bitcmp(%g,');

function mod1_Callback(hObject, eventdata, handles)
funa_b(hObject, eventdata, handles, 'mod(%g,');

function e_val_Callback(hObject, eventdata, handles)
set(handles.display, 'string', '2.71828182');
setappdata(gcf, 'isDecimal', true);
setappdata(gcf, 'showExpand', false);
setappdata(gcf, 'showExpand', true);
setappdata(gcf, 'hasOperator', false);

function c = hexbindexoct(src, obj, strDisplay)
switch obj
    case uint8(10)
        if src == uint8(2) && all(ismember(strDisplay, '01'))
            c = [num2str(bin2dec(strDisplay)) '.'];
        elseif src == uint8(8) && all(ismember(strDisplay, '01234567'))
            c = [num2str(base2dec(strDisplay, 8)) '.'];
        elseif src == uint8(16) && all(isstrprop(strDisplay, 'xdigit'))
            c = [num2str(hex2dec(strDisplay)), '.'];
        end
    case uint8(2)
        if src == uint8(8) && all(ismember(strDisplay, '01234567'))
            c = dec2bin(oct2dec(str2double(strDisplay)));
        elseif src == uint8(10) && all(ismember(strDisplay, '0123456789.'))
            c = dec2bin(str2double(strDisplay));
        elseif src == uint8(16) && all(isstrprop(strDisplay, 'xdigit'))
            c = dec2bin(hex2dec(strDisplay));
        end
    case uint8(8)
        if src == uint8(2) && all(ismember(strDisplay, '01'))
            c = dec2base(bin2dec(strDisplay), 8);
        elseif src == uint8(10) && all(ismember(strDisplay, '0123456789.'))
            c = dec2base(floor(str2double(strDisplay)), 8);
        elseif src == uint8(16) && all(isstrprop(strDisplay, 'xdigit'))
            c = dec2base(hex2dec(strDisplay), 8);
        end
    case uint8(16)
        if src == uint8(2) && all(ismember(strDisplay, '01'))
            c = dec2hex(bin2dec(strDisplay));
        elseif src == uint8(8) && all(ismember(strDisplay, '01234567'))
            c = dec2hex(oct2dec(str2double(strDisplay)));
        elseif src == uint8(10) && all(ismember(strDisplay, '0123456789.'))
            c = dec2hex(floor(str2double(strDisplay)));
        end
end

function jinzhi_SelectionChangeFcn(hObject, eventdata, handles)
%% ��ȡ����
base = getappdata(gcf, 'base'); %��ֵ�Ļ���
b = get(handles.display, 'string');
switch get(hObject, 'tag')
    case 'radiobutton4'
        set(allchild(handles.uipanel7), 'Enable', 'on');
        h_all = [handles.num0 handles.num1 handles.num2 handles.num3 handles.num4 ...
            handles.num5 handles.num6 handles.num7 handles.num8 handles.num9 ...
            handles.e_val handles.pi_val handles.dot handles.num_fuhao];
        set(h_all, 'Enable', 'on');
        a_f = [handles.numa handles.numb handles.numc handles.numd handles.nume handles.numf];
        set(a_f, 'enable', 'off');
        set(handles.dc, 'Enable', 'on');
        set(handles.m_add, 'Enable', 'on');
        c = hexbindexoct(base, uint8(10), b);
        set(handles.display, 'string', c);
        setappdata(gcf, 'base', uint8(10));
    case 'radiobutton3'%ת��Ϊʮ������
        set(allchild(handles.uipanel7), 'Enable', 'off');
        h_all=[handles.num0 handles.num1 handles.num2 handles.num3 ...
            handles.num4 handles.num5 handles.num6 handles.num7 ...
            handles.num8 handles.num9];
        a_f=[handles.numa handles.numb handles.numc handles.numd ...
            handles.nume handles.numf];
        set([h_all a_f], 'enable', 'on');
        a_off=[handles.e_val handles.pi_val handles.dot handles.num_fuhao];
        set(a_off,'enable','off');
        set(handles.dc, 'Enable', 'off');
        set(handles.m_add, 'Enable', 'off');
        c = hexbindexoct(base, uint8(16), b);
        set(handles.display, 'string', c);
        setappdata(gcf, 'base', uint8(16));
    case 'radiobutton2'%ת��Ϊ�˽���
        set(allchild(handles.uipanel7), 'Enable', 'off');
        h_all=[handles.num0 handles.num1 handles.num2 handles.num3 ...
            handles.num4 handles.num5 handles.num6 handles.num7];
        set(h_all, 'enable', 'on');
        a_f=[handles.num8 handles.num9 handles.numa handles.numb ...
            handles.numc handles.numd handles.nume handles.numf ...
            handles.e_val handles.pi_val handles.dot handles.num_fuhao];
        set(a_f,'enable','off');
        set(handles.dc, 'Enable', 'off');
        set(handles.m_add, 'Enable', 'off');
        c = hexbindexoct(base, uint8(8), b);
        set(handles.display, 'string', c);
        setappdata(gcf, 'base', uint8(8));
    case 'radiobutton1'%ת��Ϊ������
        set(allchild(handles.uipanel7), 'Enable', 'off');
        h_all=[handles.num0 handles.num1];
        set(h_all,'enable','on')
        a_f = [handles.num2 handles.num3 handles.num4 handles.num5 handles.num6 handles.num7 ...
            handles.num8 handles.num9 handles.numa handles.numb handles.numc handles.numd ...
            handles.nume handles.numf handles.e_val handles.pi_val handles.dot handles.num_fuhao];
        set(a_f, 'Enable', 'off');
        set(handles.dc, 'Enable', 'off');
        set(handles.m_add, 'Enable', 'off');
        c = hexbindexoct(base, uint8(2), b);
        set(handles.display, 'string', c);
        setappdata(gcf, 'base', uint8(2));
end
setappdata(gcf, 'hasOperator', false);
setappdata(gcf, 'isDecimal', false);
setappdata(gcf, 'showExpand', false);
