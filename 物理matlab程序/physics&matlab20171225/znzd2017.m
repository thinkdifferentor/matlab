%阻尼振动计算机仿真
% hold off
close all;
clc;
% clear;
rectangle('position',[12,8,2,0.3],'FaceColor',[0.1,0.3,0.4]);
axis([0,15,-1,10]);
hold on;
plot([13,13],[7,8],'r','linewidth',2);
y=2:0.2:7;
M=length(y);
x=12+mod(1:M,2)*2;
x(1)=13;
x(end-3:end)=13;
D=plot(x,y);
C=0:0.1:2*pi;
r=0.3;
t1=r*sin(C);
F1=fill(13+r*cos(C),2+t1,'r');
set(gca,'ytick',[0:2:9]);
set(gca,'yticklabel',num2str([-1:3]'));
plot([0,15],[2,2],'black');
H1=plot([0,13],[2,2],'g');
Q=plot(0,2.5,'color','r');
td=[];
yd=[];
T=0;
text(2,8,'阻尼振动','fontsize',24);
set(gcf,'doublebuffer','on');
while T<12
    pause(0.2);
    Dy=1-0.5*exp(-T/4)*cos(pi*T);
    Y=-(y-2)*Dy+7;
    Yf=Y(end)+t1;
    td=[td,T];
    yd=[yd,Y(end)];
    set(D,'ydata',Y);
    set(Q,'xdata',td,'ydata',yd);
    set(F1,'ydata',Yf,'facecolor',rand(1,3));
    set(H1,'xdata',[T,13],'ydata',[Y(end),Y(end)]);
    set(Q,'xdata',td,'ydata',yd);
    T=T+0.1;
end
Kd=find(diff(sign(diff(yd)))==-2)+1;
X=td(Kd);
Y=yd(Kd);
X=[0,X,td(end)];
Y=[yd(1),Y,yd(end)];
plot(X,Y,':');
Kx=find(diff(sign(diff(yd)))==2)+1;
X=td(Kx);
Y=yd(Kx);
X=[0,X,td(end)];
Y=[-(yd(1)-4),Y,-(yd(end)-4)];
    plot(X,Y,':')
    