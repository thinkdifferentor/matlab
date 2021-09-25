function picprocess()
%   ��ͼƬ������ͼƬ�ϻ�ͼ
%   ���������ڽ���MATLABԤ����Ի�����÷����õ��ĶԻ����У�
%     �ļ��򿪶Ի����ļ�����Ի�����ɫ���öԻ�������Ի���
%     ���ʶԻ�����Ϣ�Ի���
%   setappdata��getappdata��������GUI����֮�䴫�����ݣ���ϸ�÷��Ȳ�Ҫ�����գ�
%     ֻ���˽⣬��6�»���ϸ�������÷�
%   ���ߣ��޻���
%   �汾��20140818V1.2
%% �������صĴ��ڣ����Ƶ���Ļ�м�
hFigure = figure('Visible', 'off', 'Position', [0 0 600 500], 'Resize', 'off',...
    'DockControls', 'off', 'Menubar', 'none', 'Name', 'Ԥ����Ի���ʾ��', ...
    'NumberTitle', 'off', 'WindowButtonDownFcn', @btnDown, 'WindowButtonMotionFcn',...
    @btnMotion, 'WindowButtonUpFcn', @btnUp, 'CloseRequestFcn', @closeQuest);
movegui(hFigure, 'center');
%% �������ص������ᣬ������ʾͼƬ�ͻ�������
hAxes = axes('Visible', 'off', 'Position', [0.01 0.2 0.98 0.79], 'Drawmode', 'fast');
imshow peppers.png;  %����Ĭ��ͼƬ
%% �洢���귶Χ�������ж�����Ƿ���ͼƬ��
setappdata(hFigure, 'xLim', get(hAxes, 'xLim'));  
setappdata(hFigure, 'yLim', get(hAxes, 'yLim'));
%% �洢Ĭ�ϵĻ��ʿ�Ⱥ�����
setappdata(hFigure, 'lineWidth', 4);
setappdata(hFigure, 'lineStyle', '-');
%% ����uicontrol����
set(0, 'DefaultUicontrolFontSize', 10);  %����uicontrol�ؼ���Ĭ�������С
uicontrol('String', '��  ��', 'Position', [50 20 60 30], 'Callback', @openPic);
uicontrol('String', '��������', 'Position', [150 20 60 30], 'Callback', @penStyle);
uicontrol('String', '��  ��', 'Position', [250 20 60 30], 'Callback', {@savePic, hAxes});
uicontrol('String', '��  ��', 'Position', [350 20 60 30], 'Callback', 'close(gcbf)');
%% ��ʾ����
set(hFigure, 'Visible', 'on');
end

function openPic(~, ~)
%   ���򿪡���ť�Ļص������������ļ��򿪶Ի���ѡ��Ҫ��ʾ�ı���ͼƬ
%   ~��ʾ�ò�������ʹ��
%   hAxesΪ���������ľ�� 
%% �����ļ��򿪶Ի���ѡ��Ҫ�򿪵�ͼƬ
[fName, pName, index] = uigetfile({'*.jpg'; '*.bmp'}, 'ѡ��Ҫ�򿪵�ͼƬ�ļ�');
if index   %���ѡ����ͼƬ
    str = [pName fName];  %��ȡͼƬ������·�����ļ���
    cla;  %����������ڵı���ͼƬ���û����Ƶ�����
    imshow(str);          %�ڵ�ǰ����������ʾѡ�е�ͼƬ
    %% �洢���귶Χ�������ж�����Ƿ���ͼƬ��
    setappdata(gcf, 'xLim', get(gca, 'xLim')); %�洢�������x�᷶ΧΪ���ڶ����Ӧ������
    setappdata(gcf, 'yLim', get(gca, 'yLim')); %�洢�������y�᷶ΧΪ���ڶ����Ӧ������
end
end

function penStyle(~, ~)
% ���������͡���ť�Ļص�����
%% ��������Ի������û��ʿ�Ⱥ�����
answer = inputdlg({'���ʿ��(pixels)��', sprintf('�������ͣ�\n(1--ʵ��,2--����,3--�㻭��')},...
    '��������', 1, {'4', '1'});
if ~isempty(answer)  %�����ˡ�OK����ť�����»����߿������
    lineWidth = floor(str2double(answer{1})); %��ȡ�û�������߿�ֵ����ȡ��
    if  ~isnan(lineWidth) && lineWidth > 0 && lineWidth < 30 %�������ֵ��(0,30)��Χ��
        setappdata(gcf, 'lineWidth', lineWidth); %���»����߿�
    end
    lineStyle = floor(str2double(answer{2})); %��ȡ�û������ֵ����ȡ��
    if ~isnan(lineWidth) && lineStyle > 0 && lineStyle < 4 %�������ֵ��(0,4)��Χ��
        strTemp = {'-', ':', '-.'};
        setappdata(gcf, 'lineStyle', strTemp{lineStyle}); %%���»�������
    end
end
end

function savePic(~, ~, hAxes)
% ����  �桿��ť�Ļص�����
%% �����ļ�����Ի��򣬻�ȡ�����ͼƬ·�����ļ���
[fName, pName, index] = uiputfile({'*.jpg'; '*.bmp'}, 'ͼƬ���Ϊ');
if index == 1 || index == 2 %�������ļ�����ΪJPG��BMP
    %% ����һ�����صĴ��ڣ��������Ḵ�ƽ�ȥ��������ΪͼƬ
    hFig = figure('Visible', 'off'); %����һ�����ش���
    copyobj(hAxes, hFig); %�������ἰ���Ӷ����Ƶ��´�����
    str = [pName fName];  %��ȡҪ�����ͼƬ·�����ļ���
    if index == 1
        print(hFig, '-djpeg', str); %����ΪJPGͼƬ
    else
        print(hFig, '-dbmp', str);  %����ΪBMPͼƬ
    end
    delete(hFig); %ɾ�����������ش���
    %% ����һ����Ϣ�Ի�����ʾ�ļ�����ɹ�
    hMsg = msgbox(['ͼƬ' fName '����ɹ���'], '��ʾ');
    %% 1��������Ϣ�Ի���û�йرգ��Զ��ر�
    pause(1); 
    if ishandle(hMsg)  %��Ϣ�Ի���û���ֶ��ر�
        delete(hmsg);  %�Զ��ر���Ϣ�Ի���
    end
end
end

function btnDown(hObject, ~)
% ���ڵ�WindowButtonDownFcn�ص�����
% Ӧ������isPressed������������Ƿ���
% �������ͼƬ�ϰ��£���ʼ��������
%% ��ȡ�����᷶Χ�͵�ǰ�����꣬�ж���굱ǰ�Ƿ���ͼƬ��
xLim = getappdata(hObject, 'xLim');
yLim = getappdata(hObject, 'yLim');
pos = get(gca, 'CurrentPoint');
if (pos(1, 1) > xLim(1)) && (pos(1, 1) < xLim(2)) && (pos(1, 2) > yLim(1))...
        && (pos(1, 2) < yLim(2))  % �������ͼƬ��
    if strcmp(get(hObject, 'selectiontype'), 'alt') %��������Ҽ�
        delete(findobj(gca, 'type', 'line')); %ɾ�����л��Ƶ�����
    elseif strcmp(get(hObject, 'selectiontype'), 'open') %��˫�����
        %% ������ɫ���öԻ����������û�����ɫ
        col = uisetcolor(get(gca, 'colororder'), 'ѡ�񻭱���ɫ'); 
        set(gca, 'colororder', col)
    else %������������
        %% ��ȡ��굱ǰ�����꣬����Ϊ�û�����
        pos = get(gca, 'currentpoint');  %��ȡ��ǰ������
        set(hObject, 'userData', pos(1,[1,2])); %����ǰ�����Ϊ�û�����
        setappdata(hObject, 'isPressed', true); %����Ӧ������isPressed��ֵ
    end
end
end

function btnMotion(hObject, ~)
% ���ڵ�WindowButtonMotionFcn�ص�����
%% ��ȡ�����᷶Χ�͵�ǰ�����꣬�ж���굱ǰ�Ƿ���ͼƬ��
xLim = getappdata(hObject, 'xLim');
yLim = getappdata(hObject, 'yLim');
pos = get(gca, 'CurrentPoint');
if (pos(1, 1) > xLim(1)) && (pos(1, 1) < xLim(2)) && (pos(1, 2) > yLim(1))...
        && (pos(1, 2) < yLim(2))  % �������ͼƬ��
    set(hObject, 'Pointer', 'hand'); %�������ָ��Ϊ����
    isPressed = getappdata(hObject, 'isPressed'); %��ȡӦ������isPressed
    pos1 = get(hObject, 'UserData'); %��ȡ���֮ǰ����ĵ������
    pos = get(gca, 'currentpoint');  %��ȡ��ǰ�������
    if isPressed  %����괦�ڡ����¡�״̬����������
        lineWidth = getappdata(gcf, 'lineWidth'); %��ȡ�߿�
        lineStyle = getappdata(gcf, 'lineStyle'); %��ȡ����
        line([pos1(1); pos(1, 1)], [pos1(2); pos(1, 2)], 'linewidth',...
            lineWidth, 'LineStyle', lineStyle);   %��������
        set(hObject, 'UserData', pos(1, [1 2]));  %���´��ڶ�����û�����
    end
else   %����겻��ͼƬ��
    set(hObject, 'Pointer', 'default'); %�ָ����ָ����״ΪĬ��ֵ
end
end

function btnUp(hObject, ~)
% ���ڵ�WindowButtonUpFcn�ص�����
%% ����ͷ�ʱ�����±�ʶ����isPressed��ֵΪfalse
setappdata(hObject, 'isPressed', false);
end

function closeQuest(hObject, ~)
%% ����һ�����ʶԻ��򣬽�һ��ȷ���Ƿ�Ҫ�رմ���
sel = questdlg('ȷ�Ϲرյ�ǰ���ڣ�', '�ر�ȷ��', 'Yes', 'No', 'No');
switch sel
    case 'Yes'  %�û�����ˡ�Yes����ť
        delete(hObject);
    case 'No'   %�û�����ˡ�No����ť
        return;
end
end
