%二阶微分方程的函数
function f=fun(t,x,flag,b,W)
f=[ x(2);                              %速度
   -2*b*x(2)-x(1)+cos(W*t)];           %加速度

   