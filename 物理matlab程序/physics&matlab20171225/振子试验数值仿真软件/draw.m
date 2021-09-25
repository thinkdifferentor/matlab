R=2;
global t x;
for i=1:length(t)/3.858
    xx=0:0.1:100*x(i,1);
    yy=R*sin(xx*10*pi/100/x(i,1));  
    plot(xx,yy);
    hold on;
    t3=0:pi/100:2*pi;
    x1=100*x(i,1)+R*cos(t3);
    y1=R*sin(t3);
    fill(x1,y1,'b');
    set(gca,'unit','normalized','position',[0.03 0.54 0.64 0.35],...
    'xlim',[0 80],'ylim',[-2 2]);
    hold off;
    Myline;
    axis equal
    drawnow;
end
 