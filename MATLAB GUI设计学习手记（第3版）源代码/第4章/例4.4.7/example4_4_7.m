%% ��������
clear all;
hFigure = figure('Name', '������ʾ', 'menubar', 'none', 'position',...
    [500 300 300 100], 'DockControls', 'off', 'NumberTitle', 'off');
%% �����˵�
hMenu = uimenu(hFigure, 'label', '', 'ForegroundColor', 'r');
xingqi={'��','һ','��','��','��','��','��'}; %�����ַ���
while ishandle(hFigure)
    set(hMenu, 'Label', [datestr(clock, 31) '  ����' xingqi{weekday(now)}]);
    drawnow;
    pause(1);
end
