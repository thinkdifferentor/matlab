%绘制车队长度随时间变化曲线
m=4.5;
t=0:0.01:30;
y =0.00206*t.^5 - 0.053*t.^4 + 0.4913*t.^3 - 2.97955*t.^2 + 1.8636*t;
plot(t,y*m);
grid on;
title('车队排队长度随时间变化曲线');