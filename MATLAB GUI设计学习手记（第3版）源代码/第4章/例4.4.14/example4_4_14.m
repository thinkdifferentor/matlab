%ǰ�᣺3�Ŵ���ʾͼƬ�ڸýű�����Ŀ¼��
%���ܣ���3��ͼƬ��ʾ��ͬһ����������
%���ߣ��޻��� 2014��4��21��
%�汾��V1.0

%��������
hFig = figure('Name','�������ͼƬ��ʾBY�޻���V1.0',...
    'NumberTitle','off',...
    'Resize','off',...
    'Position',[0 0 800 400],...
    'ToolBar', 'none',...
    'visible', 'off');
%�������Ƶ���Ļ�м�
movegui(hFig, 'center');
%���������ᣬע��Y�᷽��Ҫ������
hAxes = axes('Units','Normalized',...
    'Position',[0.05 0.05 .9 .9],...
    'NextPlot','new',...
    'Box','on',...
    'YDir', 'reverse');
%��ȡ3��ͼƬ
if exist('pic001.jpg', 'file') ~= 2
    errordlg('ͼƬpic001.jpg�����ڣ�');
    return;
end
if exist('pic002.jpg', 'file') ~= 2
    errordlg('ͼƬpic002.jpg�����ڣ�');
    return;
end
if exist('pic003.jpg', 'file') ~= 2
    errordlg('ͼƬpic003.jpg�����ڣ�');
    return;
end
h1 = imread('pic001.jpg');
h2 = imread('pic002.jpg');
h3 = imread('pic003.jpg');
%��3��ͼƬ������ʾ��������hAxes
image([0 290],[0 390], h1);
image([290 580],[0 390], h2);
image([580 870],[0 390], h3);
%��������������귶Χ
set(hAxes,'Xlim',[0 870],...
    'Ylim',[0 390],...
    'XTickLabel', '',...
    'YTickLabel', '',...
    'XTick', [],...
    'YTick', []);
%������ɺ���ʾ�ô���
set(hFig, 'visible', 'on');
