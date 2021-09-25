%% 图形数据的横坐标
t = 0 : 0.1 : 2*pi;
%% 创建第1个坐标轴
hAxes1 = subplot(221);
plot(sin(t));
set(hAxes1, 'tag', 'h1');
%% 创建第2个坐标轴
hAxes2 = subplot(222);
plot(cos(t));
set(hAxes2, 'tag', 'h2');
%% 创建第3个坐标轴
hAxes3 = subplot(223);
stem(sin(t));
set(hAxes3, 'tag', 'h3');
%% 创建第4个坐标轴
hAxes4 = subplot(224);
stem(cos(t));
set(hAxes4, 'tag', 'h4');
%% 弹出文件保存对话框
[fName, pName, index] = uiputfile({'*.bmp'; '*.jpg'}, '图片另存为', datestr(now, 30));
%% 若没有点击【取消】按钮或直接关闭对话框，保存图片
if index
    str = [pName fName];  %获取图片的全路径
    strBefore = str(1:end-4); %去掉后缀，便于为多张图片命名
    strEx = str(end-3 : end); %获取图片后缀
    hFigure = figure('visible', 'off'); %创建隐藏的窗口
    if strcmp(strEx, '.bmp')  %若保存为BMP图片
        for i = 1 : 4
            %% 第i章图片的图片名
            fullName = [strBefore '_' num2str(i) '.bmp'];
            %% 创建坐标轴，用于临时保存要输出的图像
            hAxes = copyobj(findobj('tag', ['h' num2str(i)]), hFigure);          %将坐标轴区域拷贝到隐藏窗口
            %% 坐标轴铺满窗口，从而图形铺满图片
            set(hAxes, 'Units', 'normalized', 'Position', [0.1 0.1 0.8 0.8]); 
            %% 输出图片
            print(hFigure, '-dbmp', fullName);       %输出到图片
            %% 删除临时坐标轴
            delete(gca);
        end
    elseif strcmp(strEx, '.jpg')  %若保存为JPG图片
        %% 注释同上，省略
        for i = 1 : 4
            fullName = [strBefore '_' num2str(i) '.jpg'];
            hAxes = copyobj(findobj('tag', ['h' num2str(i)]), hFigure);          %将坐标轴区域拷贝到隐藏窗口
            set(hAxes, 'Units', 'normalized', 'Position', [0.1 0.1 0.8 0.8]); 
            print(hFigure, '-djpeg', fullName);         %输出到图片
            delete(gca);
        end
    end
    delete(hFigure); %删除隐藏的窗口
end
