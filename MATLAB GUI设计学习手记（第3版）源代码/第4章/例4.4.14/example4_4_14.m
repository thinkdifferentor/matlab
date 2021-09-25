%前提：3张待显示图片在该脚本所在目录下
%功能：将3张图片显示到同一个坐标轴内
%作者：罗华飞 2014年4月21日
%版本：V1.0

%创建窗口
hFig = figure('Name','坐标轴多图片显示BY罗华飞V1.0',...
    'NumberTitle','off',...
    'Resize','off',...
    'Position',[0 0 800 400],...
    'ToolBar', 'none',...
    'visible', 'off');
%将窗口移到屏幕中间
movegui(hFig, 'center');
%创建坐标轴，注意Y轴方向要反过来
hAxes = axes('Units','Normalized',...
    'Position',[0.05 0.05 .9 .9],...
    'NextPlot','new',...
    'Box','on',...
    'YDir', 'reverse');
%读取3张图片
if exist('pic001.jpg', 'file') ~= 2
    errordlg('图片pic001.jpg不存在！');
    return;
end
if exist('pic002.jpg', 'file') ~= 2
    errordlg('图片pic002.jpg不存在！');
    return;
end
if exist('pic003.jpg', 'file') ~= 2
    errordlg('图片pic003.jpg不存在！');
    return;
end
h1 = imread('pic001.jpg');
h2 = imread('pic002.jpg');
h3 = imread('pic003.jpg');
%将3张图片依次显示到坐标轴hAxes
image([0 290],[0 390], h1);
image([290 580],[0 390], h2);
image([580 870],[0 390], h3);
%设置坐标轴的坐标范围
set(hAxes,'Xlim',[0 870],...
    'Ylim',[0 390],...
    'XTickLabel', '',...
    'YTickLabel', '',...
    'XTick', [],...
    'YTick', []);
%处理完成后，显示该窗口
set(hFig, 'visible', 'on');
