%ע�⣺ �°湤�����а�ť��3�֣�uipushtool��uitoggletool��uitogglesplittool
hFigure = figure('numbertitle', 'off', 'name', '��4.4.4');     %����һ��GUI����
delete(findall(hFigure, 'type', 'uimenu'));   %ɾ����׼�˵�
hToolBar = findall(hFigure, 'type', 'uitoolbar');  %���ҹ�����
set(allchild(hToolBar), 'visible', 'off');   %���ع��������а�ť
hTools = findall(hToolBar, 'Tag', 'Exploration.ZoomIn', '-or', 'Tag', 'Exploration.ZoomOut',...
    '-or', 'Tag', 'Exploration.Pan', '-or', 'Tag', 'Exploration.DataCursor');  %�ڹ������������Ҫ��ʾ��4����ť
set(hTools,'visible','on','Separator','off')  %��ʾ��4����ť




