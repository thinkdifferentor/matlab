function ydot=dcx1fun(t,y,flag,p1,p2)   %p1,p2是参量，表示电量
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
 ydot=[p1*(y(1)+2)/(sqrt((y(1)+2).^2+y(2).^2).^3)+p2*(y(1)-2)/(sqrt((y(1)-2).^2+y(2).^2).^3);  %dx/dt=Ex 
p1*y(2)/(sqrt((y(1)+2).^2+y(2).^2).^3)+ p2*y(2)/(sqrt((y(1)-2).^2+y(2).^2).^3)];  %dy/dt=Ey

end

