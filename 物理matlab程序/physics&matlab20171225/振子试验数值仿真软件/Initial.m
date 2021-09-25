R=2;
x0=40;
t=0:0.01:x0;
y=R*sin(t*10*pi/x0);
plot(t,y);
hold on
t=0:pi/100:2*pi;
x1=x0+R*cos(t);
y1=R*sin(t);
fill(x1,y1,'b');
set(gca,'unit','normalized','position',[0.03 0.54 0.64 0.35],...
    'xlim',[0 80],'ylim',[-2 2]);
axis equal
hold off
Myline;


