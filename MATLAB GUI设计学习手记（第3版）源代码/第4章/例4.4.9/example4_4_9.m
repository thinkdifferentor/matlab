clear;  %������б���
%% ��ʼ������������
delt = 10; %ÿ���ƶ��ĳ��ȣ���λΪpoints
a = 50;    %��������߽��봰����߽�ľ���
b = 50;    %�������ұ߽��봰���ұ߽�ľ���
width = 450;  %���ڵĿ��
height = 200;  %���ڵĸ߶�
strDisp = '��ʱ�����ᣬ�ޱ����ġ�';  %Ҫ������ʾ���ַ���
%% �������صĴ��ڣ����������Ƶ���Ļ�м�
hFigure = figure('Name', '���������ʵ��', 'MenuBar', 'none', 'ToolBar', 'none',...
   'NumberTitle', 'off',  'Units', 'points', 'Position', [0 0 width height],...
   'Visible', 'off');
movegui(hFigure, 'center');
%% �����������߿�ͱ���
axes('Box', 'on', 'DrawMode', 'fast', 'XTick', [], 'YTick', [], 'XTickLabel',...
    '', 'YTickLabel', '', 'XLim', [0 500], 'YLim', [0 10], 'Units', 'points',...
    'Position', [a height/2 width-a-b 30]);
%% �����ı��������ڹ�����ʾ�ַ�����ע��text�����Clipping����Ĭ��ֵΪoff��Ҫ����Ϊon
hText1 = text('String', strDisp, 'Position', [500 5], 'FontWeight', 'bold',...
     'Hor', 'left', 'vert', 'middle', 'Clipping', 'on'); %�����ı�����hText1��
hText2 = text('String', strDisp, 'Position', [-500 5], 'FontWeight', 'bold',...
    'Color', 'r', 'Hor', 'left', 'vert', 'middle', 'Clipping', 'on'); %�����ı��ؼ�hDown2
%% ��ʾ����
set(hFigure, 'Visible', 'on');
%% ѭ����ʾ
while ishandle(hFigure)
    pos1 = get(hText1, 'position'); %��ȡ��1���ı������λ��
    pos2 = get(hText2, 'position'); %��ȡ��2���ı������λ��
    pos1(1) = pos1(1) - delt;       %���µ�1���ı������λ�ñ���
    pos2(1) = pos2(1) - delt;       %���µ�2���ı������λ�ñ���
    %% ��hText1������hText2���ұߣ���hText1������߳��������ᣬ��hText2�Ƶ����������ұ�
    if pos1(1) > pos2(1) && pos1(1) < 0.2 
        pos2(1) = 500;
    elseif pos2(1) > pos1(1) && pos2(1) < 0.2
        pos1(1) = 500;
    end
    set(hText1, 'position', pos1);  %���µ�1���ı������λ��
    set(hText2, 'position', pos2);  %���µ�2���ı������λ��
    drawnow;  %�ػ洰��
    pause(0.1);  %��ͣ0.1������ִ��ѭ��
end
