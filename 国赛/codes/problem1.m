phantom = load('1.dat');    %附件一数据
Eabsorb = load('2.dat');    %附件二数据

width = sum(Eabsorb>0);  % Projection width对矩阵中每一列中非零的数据计数

[wmax, imax] = max(width);%最宽 wmax-值，imax最值下标
[wmin, imin] = min(width);%最窄
imagesc(Eabsorb)
hold on
plot([imax,imin; imax imin],[0 0; 512 512],'w')

set(gca,'xtick', imin-180:30:imin:30:180)
set(gca,'xticklabel', [imin-180:30:imin:30:180]-imin)

theta0 = -imin

d = 80/sum(Eabsorb(:,imax)>0)%测试单元的求解
 
idx = find(Eabsorb(:,imax)>0);%找到最大的那一列的通过光纤条数
y0 = (256-(max(idx)+min(idx))/2 )*d

idx = find(Eabsorb(:,imin)>0);
idx = idx(idx>100);
x0 = -(256-(max(idx)+min(idx))/2 )*d



xb = [-50  50 50 -50 -50]';
yb = [-50 -50 50  50 -50]';


%  ellipse & circle
t = linspace(0,2*pi,90);
xi = 15*cos(t);
yi = 40*sin(t);

xi2 = 4*cos(t)+45;
yi2 = 4*sin(t);

figure
fill(xb, yb,[0.6,0.6,0.6])
hold on
fill(xi,yi,'r', xi2, yi2,'r')
plot(x0,y0,'bx')
axis image
axis([-60 60 -60 60])
text(x0-5,y0-7,sprintf('(%6.4f,%6.4f)', x0, y0))
