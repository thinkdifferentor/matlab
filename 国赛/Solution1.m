%绘制每一束光线180次的曲线

load Receive2

figure('name','每一条光线180次旋转的信息接收趋势图：')
for i=1:512
    plot(Receive2(i,:));
    hold on;
    grid on;
end

figure('name','一次旋转的每条光线的信息接收趋势图：')
for j=1:180
    plot(Receive2(:,j));
    hold on;
    grid on;
end