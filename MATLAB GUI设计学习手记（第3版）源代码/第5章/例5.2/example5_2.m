set(gcf, 'visible', 'on');              %设置当前坐标轴用于绘制曲线，注意：gcf、gca创建的figure默认是隐藏的
%% 创建置于屏幕前端的进度条，动态显示绘图进度
h = waitbar(0, '开始绘图...', 'WindowStyle', 'modal'); 
t = 0 : 0.01 : pi;%数据的横坐标
for i = 1 : 10
    plot(t, sin(2*pi*i*t));%绘制数据曲线
    waitbar(i/10, h, ['已完成' num2str(10*i) '%']);%更新进度条的进度和标题
    pause(1);     %延迟1秒
end
close(h);         %关闭进度条
