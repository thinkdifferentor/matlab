%% ��������
hFigure = figure('Name', '������ʾ', 'menubar', 'none', 'position',...
    [500 300 400 200], 'DockControls', 'off', 'NumberTitle', 'off');
%% �����˵�
hMenu = uimenu(hFigure, 'label', '');
xingqi={'��','һ','��','��','��','��','��'}; %�����ַ���
while ishandle(hFigure)
    strDate = datestr(now, 29);  %��ȡ��ǰ������
    strTime = datestr(now, 13);  %��ȡ��ǰʱ����
    set(hMenu, 'Label', ['<html><b><font size=5 color="Red">' strDate ...%����Ϊ5�żӴ֣�����������Ϊ��ɫ
        '<font color="Blue"> ' strTime '<font color="Black"> ����' ...  %ʱ������ɫΪ��ɫ��������ɫΪ��ɫ
        xingqi{weekday(now)} '</font></font></font></html>']);
    drawnow;                              %���´�����ʾ
    pause(1);                               %��ͣ1��������ʾ
end
