%% �������ʴ�С�����ص�GUI����
hFigure = figure('menubar', 'none', 'NumberTitle', 'off', 'position',...
    [200 150 300 150], 'name', '����ʱ��', 'Visible', 'off');
movegui(hFigure, 'center');  %����λ�õ�������Ļ�м�
%% ����UI�ؼ�ȱʡ�ı���ɫ��λ�õ�λ�������С
set(0, 'DefaultuicontrolBackgroundColor', get(hFigure,'color'))
set(0, 'DefaultuicontrolUnits', 'points')
set(0, 'DefaultuicontrolFontsize', 12)
%% ��ȡ��ǰʱ�ӣ����ڳ�ʼ���ı��ؼ���ʾ��ʱ��
nowTime = floor(clock);
%% ��������Ҫ��UI�ؼ�
yearDisp = uicontrol('style', 'edit', 'enable', 'inactive', 'BackgroundColor',...
    'w', 'horizontal', 'right', 'position', [20 80 30 20], 'string',...
    num2str(nowTime(1)));
uicontrol('style', 'text', 'string', '��', 'fontsize', 14, 'position', [55 80 20 20]);
monDisp = uicontrol('style', 'edit', 'enable', 'inactive','BackgroundColor', 'w',...
    'horizontal', 'right', 'position', [80 80 30 20], 'string', num2str(nowTime(2)));
uicontrol('style', 'text',  'string',  '��',  'fontsize', 14,  'position', [115 80 20 20]);
dayDisp = uicontrol('style', 'edit', 'enable', 'inactive', 'BackgroundColor', 'w',...
    'horizontal', 'right', 'position', [140 80 30 20], 'string', num2str(nowTime(3)));
uicontrol('style', 'text', 'units', 'points', 'string', '��', 'fontsize',...
    14, 'position', [175 80 20 20]);
timeDisp = uicontrol('style', 'edit', 'enable', 'inactive', 'BackgroundColor',...
    'w', 'horizontal', 'right', 'position',[40 30 80 20], 'string',...
    [num2str(nowTime(4)) '��' num2str(nowTime(5)) '��' num2str(nowTime(6))]);
uicontrol('string', '�ر�', 'position', [150 30 50 20], 'callback', 'isClosed = true;close');
%% ��ʾ����
set(hFigure, 'Visible', 'on');
%% ����ȫ�ֱ�־
isClosed = false; %���������Ƿ�ִ�йرղ���
%% ѭ������ʱ����ʾ
while ishandle(hFigure)
    nowTime = floor(clock);  %���µ�ǰʱ��
    set(yearDisp, 'string', num2str(nowTime(1))); %������
    set(monDisp, 'string', num2str(nowTime(2)));  %������
    set(dayDisp, 'string', num2str(nowTime(3)));  %������
    set(timeDisp, 'string', [num2str(nowTime(4), '%2d'), '��', num2str(nowTime(5), '%2d'),...
        '��', num2str(nowTime(6), '%2d')]);       %����ʱ����
    pause(1);    %��ͣ1��
    if isClosed  %���isColosed��־��������ˡ��رա���ť������ѭ��
        break;
    end
end
