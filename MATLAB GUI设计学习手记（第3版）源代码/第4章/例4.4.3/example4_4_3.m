%% ����һ�����صĴ��ڣ�����������λ�õ���Ļ�м�
hFigure = figure('menubar', 'none', 'NumberTitle', 'off', 'position',...
    [1000 1000 720 450], 'name', '��¥�о�', 'Visible', 'off');
movegui(hFigure, 'center');
%% ���������ᣬ������ʾ����ͼƬ���ı�
hAxes = axes('visible', 'off', 'units', 'normalized', 'position', [0 0 1 1]);
axis off;
%% ��ʾͼƬ
cData = imread('pic.jpg');
image(cData);
%% Ҫ��ʾ���ı�����
strCell = {'���Ͻ�¥˼��Ȼ��', '�¹���ˮˮ���졣',...
    'ͬ�������˺��ڣ�', '�羰��ϡ��ȥ�ꡣ'};
%% ������ʾ�ı�
for i = 1 : numel(strCell)  %���ÿ��ʫ��
    strTemp = strCell{i};   %��ȡ��i��ʫ��
    str = [strTemp; 10*ones(1, length(strTemp))]; %ʫ���ÿ���ֺ����һ�����з�
    str = str(:)';  %��ȡ����˻��з���ʫ���ַ���
    text('string', str, 'position', [250-50*i 150], 'Horizontal', 'right',...
        'FontName', '���Ŀ���', 'FontSize', 18, 'FontWeight', 'bold', 'color', 'red');
end
%% ��ʾ����
set(hFigure, 'Visible', 'on');
