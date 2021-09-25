function ydot=lorfun(t,y)
ydot=[-8/3*y(1)+y(2)*y(3);
   -10*y(2)+10*y(3);
   -y(2)*y(1)+35*y(2)-y(3)];
