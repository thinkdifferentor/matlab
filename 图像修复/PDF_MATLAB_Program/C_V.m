%%% 本程序采用半隐式方案实现变分水平集图像分割方法中的
%%% “C-V”模型(Active contour without edge)
clear all;
close all;
clc;

Img=imread('lena2.jpg');
Img=double(rgb2gray(Img));
% Img=imresize(Img,[80,80]);
figure(1); imshow(uint8(Img));

[nx,ny]=size(Img);
%%- 将初始曲线C设置为圆
ic=floor(nx/2);         % 计算初始圆形曲线的圆心
jc=floor(ny/2);
r=ic/3;                 % 圆形曲线的半径

%%- 初始化u为距离函数
u = zeros([nx,ny]);     
for i=1:nx
    for j=1:ny
        u(i,j)= r-sqrt((i-ic).^2+(j-jc).^2);
    end
end
%%- 将初始圆形曲线叠加在原始图片上
figure(2);              
imshow(uint8(Img));
hold on;
[c,h] = contour(u,[0 0],'r');


%%- 初始化参数
epsilon=1.0;            % Heaviside函数参数设置
nu=250;                 
delta_t=0.1;

nn=0;
%%- 迭代计算开始
for n=1:1000
    %%- 计算正则化的Heavside函数
    H_u = 0.5*(1+(2/pi)*atan(u/epsilon));

    %%- 由当前u计算参数c1和c2
    c1=sum(sum(H_u.*Img))/sum(sum(H_u));
    c2=sum(sum((1-H_u).*Img))/sum(sum(1-H_u));

    %%- 由当前c1和c2更新u
    delta_H = (1/pi)*epsilon./(epsilon^2+u.^2);
    m=delta_t*delta_H;
    C_1 = 1./sqrt(eps+(u(:,[2:ny,ny])-u).^2+0.25*(u([2:nx,nx],:)-u([1,1:nx-1],:)).^2);
    C_2 = 1./sqrt(eps+(u-u(:,[1,1:ny-1])).^2+0.25*(u([2:nx,nx],[1,1:ny-1])-u([1,1:nx-1],[1,1:ny-1])).^2);
    C_3 = 1./sqrt(eps+(u([2:nx,nx],:)-u).^2+0.25*(u(:,[2:ny,ny])-u(:,[1,1:ny-1])).^2);
    C_4 = 1./sqrt(eps+(u-u([1,1:nx-1],:)).^2+0.25*(u([1,1:nx-1],[2:ny,ny])-u([1,1:nx-1],[1,1:ny-1])).^2);
    C = 1+nu*m.*(C_1+C_2+C_3+C_4);
    u = (u+nu*m.*(C_1.*u(:,[2:ny,ny])+C_2.*u(:,[1,1:ny-1])+C_3.*u([2:nx,nx],:)+C_4.*u([1,1:nx-1],:) )+...
        m.*((Img-c2).^2-(Img-c1).^2))./C;

    %%- 显示当前曲线和分片常数图像。
    if mod(n,200)==0    
        nn=nn+1
        f=Img;
        f(u>0)=c1;
        f(u<0)=c2;
        figure(2+nn); subplot(1,2,1);imshow(uint8(f));
        subplot(1,2,2); imshow(uint8(Img));
        hold on;
        [c,h] = contour(u,[0 0],'r');
        hold off;
    end
end
