%%% 本程序实现矢量图像的方向扩散
%%% 如果启用程序中两条被注释掉的语句则表明带有边缘停止函数的方向扩散

clear all;
close all;
clc;

Img = imread('lena2.jpg');
figure(1); imshow(uint8(Img));

[nrow, ncol] = size(Img(:,:,1));

lambda=sqrt(2)-1;   % 计算“8-邻点梯度”所用的常数
%%- 初始化
Diff_Image(:,:,1)=double(Img(:,:,1)); 
Diff_Image(:,:,2)=double(Img(:,:,2)); 
Diff_Image(:,:,3)=double(Img(:,:,3));
timestep=0.05;
%%- 方向扩散
for n=1:200
    g11=zeros([nrow, ncol]); g12=zeros([nrow, ncol]); g22=zeros([nrow, ncol]);
    for i=1:3
        I_temp = Diff_Image(:,:,i);
        I_x = 0.5*lambda*(I_temp(:,[2:ncol,ncol])-I_temp(:,[1,1:ncol-1]))+...
               0.25*(1-lambda)*(I_temp([2:nrow,nrow],[2:ncol,ncol])-I_temp([2:nrow,nrow],[1,1:ncol-1])+...
               I_temp([1,1:nrow-1],[2:ncol,ncol])-I_temp([1,1:nrow-1],[1,1:ncol-1]));
        I_y = 0.5*lambda*(I_temp([2:nrow,nrow],:)-I_temp([1,1:nrow-1],:))+...
               0.25*(1-lambda)*(I_temp([2:nrow,nrow],[2:ncol,ncol])-I_temp([1,1:nrow-1],[2:ncol,ncol])+...
               I_temp([2:nrow,nrow],[1,1:ncol-1])-I_temp([1,1:nrow-1],[1,1:ncol-1]));
        
        g11 = g11+I_x.^2 ;
        g12 = g12+I_x.*I_y ;
        g22 = g22+I_y.^2 ;
    end
    lambda1 = 0.5 * (g11 + g22 + sqrt((g11-g22).^2 + 4*g12.^2));
    lambda2 = 0.5 * (g11 + g22 - sqrt((g11-g22).^2 + 4*g12.^2));
%     f=(lambda1-lambda2); g=1./(1+f/1600);
    theta1=0.5*atan2(2*g12,(g11-g22+0.01));
    v1x = cos(theta1); v1y = sin(theta1);
    v2x=-v1y; v2y=v1x;
    for i=1:3
        I_temp = Diff_Image(:,:,i);
        Ix_cos_e = 0.5*(I_temp(:,[2:ncol,ncol])-I_temp).*(v2x(:,[2:ncol,ncol])+v2x);
        Iy_sin_e = 0.125*(I_temp([2:nrow,nrow],[2:ncol,ncol])+I_temp([2:nrow,nrow],:)-...
            I_temp([1,1:nrow-1],[2:ncol,ncol])-I_temp([1,1:nrow-1],:)).*(v2y(:,[2:ncol,ncol])+v2y);
        Ix_cos_w = 0.5*(I_temp-I_temp(:,[1,1:ncol-1])).*(v2x(:,[1,1:ncol-1])+v2x);
        Iy_sin_w = 0.125*(I_temp([2:nrow,nrow],[1,1:ncol-1])+I_temp([2:nrow,nrow],:)-...
            I_temp([1,1:nrow-1],[1,1:ncol-1])-I_temp([1,1:nrow-1],:)).*(v2y(:,[1,1:ncol-1])+v2y);
        Iy_sin_n = 0.5*(I_temp([2:nrow,nrow],:)-I_temp).*(v2y([2:nrow,nrow],:)+v2y);
        Ix_cos_n = 0.125*(I_temp([2:nrow,nrow],[2:ncol,ncol])+I_temp(:,[2:ncol,ncol])-...
            I_temp([2:nrow,nrow],[1,1:ncol-1])-I_temp(:,[1,1:ncol-1])).*(v2x([2:nrow,nrow],:)+v2x);
        Iy_sin_s = 0.5*(I_temp-I_temp([1,1:nrow-1],:)).*(v2y([1,1:nrow-1],:)+v2y);
        Ix_cos_s = 0.125*(I_temp([1,1:nrow-1],[2:ncol,ncol])+I_temp([1,1:nrow-1],:)-...
            I_temp([1,1:nrow-1],[1,1:ncol-1])-I_temp(:,[1,1:ncol-1])).*(v2x([1,1:nrow-1],:)+v2x);
        Q=((Ix_cos_e+Iy_sin_e)-(Ix_cos_w+Iy_sin_w)).*v2x+((Ix_cos_n+Iy_sin_n)-(Ix_cos_s+Iy_sin_s)).*v2y;
%         Q=g.*Q;
        Diff_Image(:,:,i)=I_temp+timestep*Q;
        
    end
end
figure(2);
imshow(uint8(Diff_Image));

