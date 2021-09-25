%�ļ���Ϊfilebrowser.m
function filebrowser()
%   ��ʾָ��Ŀ¼�µ������ļ���˫���ļ���ʱ��
%   ���ߣ��޻���
%   �汾��20101007V2.0
%% ����һ�����صĴ���
hFigure = figure('menubar', 'none', 'NumberTitle','off', 'name', '�ļ������',...
    'position', [300 300 500 400], 'Visible', 'off');
%% �������ڿؼ�����
set(0, 'defaultuicontrolfontsize', 10); %����uicontrol�����Ĭ�������С
hPath = uicontrol('style', 'text', 'position', [70 262 280 25], 'horizontal',...
    'left', 'string', '', 'BackgroundColor', 'w'); %������̬�ı�����������ʾ·��
hList = uicontrol('style', 'listbox', 'string', '',  'position',...
    [20 20 350 230], 'Callback', {@fileOpen, hPath}); %�����б��������ʾָ��Ŀ�������ļ�
uicontrol('string', 'ѡ��·��', 'position', [20 260 40 25], 'callback',...
    {@fileSel, hPath, hList});  %������ѡ��·������ť
%% ��ʾ����
set(hFigure, 'Visible', 'on');
end
%% ��ѡ��·������ť�Ļص�����
function fileSel(~, ~, hPath, hList)
%% ѡ��Ŀ¼������ʾ��Ŀ¼�������ļ�
str = uigetdir(pwd, 'ѡ��Ŀ¼');
if str %��ѡ����Ŀ¼
    set(hPath, 'string', str);
    str_all = dir(str); %Ҳ��д��str_all = dir([str '\*.*']);
    strNames = {str_all.name}; %��ȡ�����ļ����ļ��е�����
    strNames{1} = '��ǰĿ¼';   %��1���ļ���Ϊ��ǰ�ļ��е��ļ�����
    strNames{2} = '��һ��Ŀ¼'; %��2���ļ���Ϊ��ǰ�ļ��е��ļ�����
    set(hList, 'string', strNames, 'Value', 1); %��ʾ�����ļ����ļ���
end
end
%% �б��Ļص�����
function fileOpen(hObject, ~, hPath)
%% ��˫����꣬����ѡ���ļ����ļ���
    if strcmp(get(gcf, 'SelectionType'), 'open') %��˫��������
        strs = get(hObject, 'String');  %��ȡ�б�������ļ����ļ������б�
        index = get(hObject, 'Value');  %��ȡ��ǰ��ѡ�ļ����ļ��е�λ��
        if index == 1     %��˫���˵�1��ѡ���򿪵�ǰĿ¼
            fName = '.';
        elseif index == 2 %��˫���˵�2��ѡ������һ��Ŀ¼
            fName = '..';
        else              %��ѡ��������ѡ�ֱ�Ӵ�
            fName = strs{index};
        end
        pName = get(hPath, 'String'); %��ȡ��ǰ·��
        winopen([pName '\' fName]);   %�򿪵�ǰ�ļ����ļ���
    end
end
