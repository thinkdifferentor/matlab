function ydot=chuafun(t,y,flag,a1,b1,a,b)
ydot=[a1*(y(2)-y(1)-b*y(1)-1/2*(a-b)*(abs(y(1)+1)-abs(y(1)-1)));
      y(1)-y(2)+y(3);
      -b1*y(2)];
   