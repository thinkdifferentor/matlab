%% ԭʼ����
x = -5 : 5;
y = -5 : 5;
%% �����ߵ�����
x1 = [x(1) x(end)]';
y1 = [y(1) y(end)]';
%% �����ߵ�xData
x2 = repmat(x1, 1, length(y)-2);
x3 = repmat(x(2) : x(end-1), 2, 1);
xData = [x2 x3];
%% �����ߵ�yData
y2 = repmat(y1, 1, length(x)-2);
y3 = repmat(y(2) : y(end-1), 2, 1);
yData = [y3 y2];
%% ��ͼ
h = line(xData, yData);
box on;
set(h, 'Color', 'k');   %line�������������Ŀǰ����Ҫ���ڵ�4�»���ϸ����
