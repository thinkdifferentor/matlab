clear;  %������б���
%% ��ʼ������������
isMoveFirst = true;  %ֵΪ��ʱ�ƶ��ı��ؼ�hDown��ֵΪ��ʱ�ƶ��ı��ؼ�hDown2
delt = 10; %ÿ���ƶ��ĳ��ȣ���λΪpoints
a = 50;    %��������߽��봰����߽�ľ���
b = 50;    %�������ұ߽��봰���ұ߽�ľ���
width = 450;  %���ڵĿ��
height = 200;  %���ڵĸ߶�
strDisp = '����Ҫ���������������������ڡ�';  %Ҫ������ʾ���ַ���
%% �������صĴ���,���������Ƶ���Ļ�м�
hFigure = figure('Name', '���������ʵ��', 'MenuBar', 'none', 'ToolBar', 'none',...
   'NumberTitle', 'off',  'Units', 'points', 'Position', [0 0 width height],...
   'Visible', 'off');
movegui(hFigure, 'center');
%% ����uicontrol�ؼ�Ĭ�ϵ������С�������ϸ�ͼ�����λ
set(0, 'DefaultuicontrolFontSize', 12);
set(0, 'DefaultuicontrolFontWeight', 'bold');
set(0, 'DefaultuicontrolUnits', 'point');
%% ����5���ؼ�������˳���ܵߵ�
uicontrol('Style', 'edit', 'Enable', 'inactive', 'BackgroundColor', 'w', 'Position',...
    [a-2 height/2 width-a-b+4 30], 'ForegroundColor', 'r'); %������ɫ����
hDown2 = uicontrol('Style', 'text', 'BackgroundColor', 'w', 'String', strDisp, 'Position',...
    [width-b height/2+1 300 24], 'ForegroundColor', 'r', 'Hor', 'left'); %�����ı��ؼ�hDown2
hDown = uicontrol('Style', 'text', 'BackgroundColor', 'w', 'String', strDisp,...
    'Position', [width-b height/2+1 300 24], 'Hor', 'left'); %�����ı��ؼ�hDown
hUpLeft = uicontrol('Style', 'text', 'Position', [a-202 height/2 200 30],...
    'BackgroundColor', get(hFigure, 'Color'));  %������߽��ڵ���
hUpRight = uicontrol('Style', 'text', 'Position', [width-b-2 height/2 200 30],...
    'BackgroundColor', get(hFigure, 'Color')); %�����ұ߽��ڵ���
%% ��ʾ����
set(hFigure, 'Visible', 'on');
%% ѭ����ʾ
while ishandle(hFigure)
if isMoveFirst  %isMoveFirstֵΪ��ʱ�ƶ��ı��ؼ�hDown
    pos = get(hDown, 'position');
    pos(1) = pos(1) - delt;
    if pos(1) + 300 > a %���ı��ؼ�hDown�����Ҷ���hUpLeft�ĸ��Ƿ�Χ֮��
        set(hDown, 'position', pos);
    else             %���ı��ؼ�hDown��hUpLeft��ȫ����
        isMoveFirst = false;
        pos(1) = width - b;
        set(hDown, 'Position', pos);
    end
    if pos(1) < a % ���ı��ؼ�hDown������˱�hUpLeft���ǣ���ʼ�ƶ��ı��ؼ�hDown2
        pos = get(hDown2, 'position');
        pos(1) = pos(1) - delt;
        set(hDown2, 'Position', pos);
    end
else              %isMoveFirstֵΪ��ʱ�ƶ��ı��ؼ�hDown2
    pos = get(hDown2, 'position');
    pos(1) = pos(1) - delt;
    if pos(1) > -300 %���ı��ؼ�hDown2�����Ҷ���hUpLeft�ĸ��Ƿ�Χ֮��
        set(hDown2, 'position', pos);
    else           %���ı��ؼ�hDown2��hUpLeft��ȫ����
        isMoveFirst = true;
        pos(1) = width - b;
        set(hDown2, 'Position', pos);
    end
    if pos(1) < a % ���ı��ؼ�hDown2������˱�hUpLeft���ǣ���ʼ�ƶ��ı��ؼ�hDown
        pos = get(hDown, 'position');
        pos(1) = pos(1) - delt;
        set(hDown, 'Position', pos);
    end
end
drawnow;  %�ػ洰��
pause(0.1);  %��ͣ0.1������ִ��ѭ��
end
