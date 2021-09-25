x=0:2:24;
y=[12   9   9   10   18  24   28   27   25   20  18  15  13];
a=13;
y1=interp1(x,y,a,'spline');

% 结果为：  27.8725
% 
% 若要得到一天24小时的温度曲线，则：

xi=0:1/3600:24;

yi=interp1(x,y,xi, 'spline');

plot(x,y,'o' ,xi,yi)