x = 2 : 0.01 : 4;  %����x
y1 = x .^ 2;         %����y1
y2 = x .^ 3;         %����y2
line(x, y1);          %������x��y1��������
line(x, y2);          %������x��y2��������
%���������������ϵĵ�ΪxData��yData������patch����
patch('xdata', [x fliplr(x)], 'ydata', [y1 fliplr(y2)], 'FaceColor', 'r')
