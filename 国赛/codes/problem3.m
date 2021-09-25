d = 0.2778;
nhalf = 512/2;
xc = -33.5*d;       
yc = 20*d;        % rotation center on square pallet


phantom = load('5.dat');

%四周夹边框
phantom = [zeros(100,180); phantom; zeros(100,180)];



% imagesc(A) 将矩阵A中的元素数值按大小转化为不同颜色，并在坐标轴对应位置处以这种颜色染色
% imagesc(x,y,A) x,y决定坐标范围，x,y应是两个二维向量，即x=[x1 x2],y=[y1 y2],matlab会在[x1,x2]*[y1,,y2]的范围内染色。 

%附件五数据图
imagesc(phantom)

figure

%吸收率计算
img = iradon(phantom,[0:179]-90-150);

n = size(img,1);

[x, y] = meshgrid([-n/2:n/2]*d);%100/256

%轮廓图
imagesc(x(1,:), y(:,1), img)


hold on

%位置
plot(yc,xc,'or')

% 边界画图
xp = [-50  50 50 -50 -50]';
yp = [-50 -50 50  50 -50]';
[xp, yp] = rotxy(xp, yp, -yc, -xc, 0); 
plot(xp,yp,'-w')

axis image