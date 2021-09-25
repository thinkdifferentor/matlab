x = 2 : 0.01 : 4;  %数据x
y1 = x .^ 2;         %数据y1
y2 = x .^ 3;         %数据y2
line(x, y1);          %由数据x和y1绘制曲线
line(x, y2);          %由数据x和y2绘制曲线
%以上述两条曲线上的点为xData和yData，绘制patch对象
patch('xdata', [x fliplr(x)], 'ydata', [y1 fliplr(y2)], 'FaceColor', 'r')
