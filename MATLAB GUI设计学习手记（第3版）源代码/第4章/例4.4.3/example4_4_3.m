%% 创建一个隐藏的窗口，并调整窗口位置到屏幕中间
hFigure = figure('menubar', 'none', 'NumberTitle', 'off', 'position',...
    [1000 1000 720 450], 'name', '江楼感旧', 'Visible', 'off');
movegui(hFigure, 'center');
%% 创建坐标轴，用于显示背景图片和文本
hAxes = axes('visible', 'off', 'units', 'normalized', 'position', [0 0 1 1]);
axis off;
%% 显示图片
cData = imread('pic.jpg');
image(cData);
%% 要显示的文本内容
strCell = {'独上江楼思渺然，', '月光如水水如天。',...
    '同来望月人何在？', '风景依稀似去年。'};
%% 逐列显示文本
for i = 1 : numel(strCell)  %穷举每条诗句
    strTemp = strCell{i};   %获取第i条诗句
    str = [strTemp; 10*ones(1, length(strTemp))]; %诗句的每个字后添加一个换行符
    str = str(:)';  %获取添加了换行符的诗句字符串
    text('string', str, 'position', [250-50*i 150], 'Horizontal', 'right',...
        'FontName', '华文楷体', 'FontSize', 18, 'FontWeight', 'bold', 'color', 'red');
end
%% 显示窗口
set(hFigure, 'Visible', 'on');
