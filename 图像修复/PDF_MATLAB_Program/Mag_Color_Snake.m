% This program implement color image magnification by using bilinear
% interpolation ( call bilinear_interpolat2()) or bi_quadric 
% interpolation ( call mag_bic_new()), then use the color snake model
% to do the post_processing for remove the edge blurring and sawtooth
% effects

% 本程序实现彩色图像放大采用双线性插值（调用bilinear_interpolat2()函数）或bi_quadric插值（调用mag_bic_new()函数），
% 然后用彩色Snake模型做post_processing去除边缘模糊和锯齿效果

clear all;
close all;
clc;
Img = imread('lena2.jpg');
figure(1);
imshow(uint8(Img));

[ny, nx] = size(Img(:,:,1));
N=4; %magnification factor 放大系数

%% Magnify image by using bilinear interpolation 用双线性插值法放大图像
Mag_Img(:,:,1) = bilinear_interpolat2(Img(:,:,1),N);
Mag_Img(:,:,2) = bilinear_interpolat2(Img(:,:,2),N);
Mag_Img(:,:,3) = bilinear_interpolat2(Img(:,:,3),N);

%% Magnify image by using bi_quadric interpolation 放大图像利用bi_quadric插值
% Mag_Img(:,:,1) = biquad_interpolat(Img(:,:,1),N); %mag_biquadrate(Img(:,:,1),N); 
% Mag_Img(:,:,2) = biquad_interpolat(Img(:,:,2),N); 
% Mag_Img(:,:,3) = biquad_interpolat(Img(:,:,3),N);

Diff_Image = Mag_Img;
figure(2);imshow(uint8(Diff_Image));

[nrow, ncol] = size(Mag_Img(:,:,1) );
lambda=sqrt(2)-1;
timestep=0.05;
for n=1:100
   g11=zeros([nrow, ncol]); g12=zeros([nrow, ncol]);; g22=zeros([nrow, ncol]);;
   for k=1:3
     I_temp = Diff_Image(:,:,k);
     I_x = 0.5*lambda*(I_temp(:,[2:ncol,ncol])-I_temp(:,[1,1:ncol-1]))+...
        0.25*(1-lambda)*(I_temp([2:nrow,nrow],[2:ncol,ncol])-I_temp([2:nrow,nrow],[1,1:ncol-1])+...
        I_temp([1,1:nrow-1],[2:ncol,ncol])-I_temp([1,1:nrow-1],[1,1:ncol-1]));
     I_y = 0.5*lambda*(I_temp([2:nrow,nrow],:)-I_temp([1,1:nrow-1],:))+...
        0.25*(1-lambda)*(I_temp([2:nrow,nrow],[2:ncol,ncol])-I_temp([1,1:nrow-1],[2:ncol,ncol])+...
        I_temp([2:nrow,nrow],[1,1:ncol-1])-I_temp([1,1:nrow-1],[1,1:ncol-1]));
     g11 = g11 + I_x.^2 ;
     g12 = g12 + I_x.*I_y;
     g22 = g22 + I_y.^2 ;
   end
  
   % eigenvalues of the matrix g[];矩阵g[]的特征值
   lambda1 = 0.5 * (g11 + g22 + sqrt((g11-g22).^2 + 4*g12.^2));
   lambda2 = 0.5 * (g11 + g22 - sqrt((g11-g22).^2 + 4*g12.^2));
   g = 1./(1+(lambda1+lambda2)/5000);

   g_e = 0.5*(g(:,[2:ncol,ncol])+g);
   g_w = 0.5*(g(:,[1 1:ncol-1])+g);
   g_s = 0.5*(g([2:nrow,nrow],:)+g);
   g_n = 0.5*(g([1,1:nrow-1],:)+g);
   
   for k=1:3
       I_temp = Diff_Image(:,:,k);
          %% using I(i)_t=|grad(I(i))|*div[g*grad(I(i))/|grad(I(i))|]
       I_x_e = I_temp(:,[2:ncol,ncol])-I_temp;
       I_y_e = (I_temp([2:nrow,nrow],:)+I_temp([2:nrow,nrow],[2:ncol,ncol])-I_temp([1 1:nrow-1],:)-I_temp([1 1:nrow-1],[2:ncol ncol]))/4;
       I_G_e = sqrt(I_x_e .^2+I_y_e .^2);
       Term_e = g_e.*I_x_e./(I_G_e+0.0001);
    
       I_x_w  = I_temp-I_temp(:,[1 1:ncol-1]);
       I_y_w = (I_temp([2:nrow,nrow],:)+I_temp([2:nrow,nrow],[1 1:ncol-1])-I_temp([1,1:nrow-1],:)-I_temp([1,1:nrow-1],[1 1:ncol-1]))/4;
       I_G_w = sqrt(I_x_w.^2+I_y_w.^2);
       Term_w = g_w.*I_x_w./(I_G_w+0.0001);
    
       I_y_s = I_temp([2:nrow,nrow],:)-I_temp;
       I_x_s = (I_temp(:,[2:ncol,ncol])+I_temp([2:nrow,nrow],[2:ncol,ncol])-I_temp(:,[1 1:ncol-1])-I_temp([2:nrow,nrow],[1 1:ncol-1]))/4;
       I_G_s = sqrt(I_y_s.^2+ I_x_s.^2);
       Term_s = g_s.*I_y_s./(I_G_s+0.0001);
    
       I_y_n = I_temp-I_temp([1 1:nrow-1],:);
       I_x_n = (I_temp(:,[2:ncol,ncol])+I_temp([1 1:nrow-1],[2:ncol,ncol])-I_temp(:,[1 1:ncol-1])-I_temp([1 1:nrow-1],[1 1:ncol-1]))/4;
       I_G_n = sqrt(I_y_n.^2+I_x_n.^2);
       Term_n = g_n.*I_y_n./(I_G_n+0.0001);
       divgn = Term_e - Term_w + Term_s - Term_n;
       
       Delta_Plus = sqrt((max(I_x_w,0)).^2+(min(I_x_e,0)).^2+(max(I_y_n,0)).^2+(min(I_y_s,0)).^2);
       Delta_minus = sqrt((max(I_x_e,0)).^2+(min(I_x_w,0)).^2+(max(I_y_s,0)).^2+(min(I_y_n,0)).^2);
       I_temp=I_temp+timestep*(max(divgn,0).*Delta_minus+min(divgn,0).*Delta_Plus);

       Diff_Image(:,:,k)=I_temp;
       %% 锚点处理
       for i=1:nrow
            for j=1:ncol
                if mod(i-1,N)==0 & mod(j-1,N)==0
                    ii=floor(i/N)+1; jj=floor(j/N)+1;
                    Diff_Image(i,j,k) = Img(ii,jj,k);
                end
            end
        end
    end
end

figure(3);%subplot(141);imshow(uint8(Diff_Image(:,:,1))); subplot(142);imshow(uint8(Diff_Image(:,:,2))); 
% %subplot(143);imshow(uint8(Diff_Image(:,:,3)));subplot(144);
imshow(uint8(Diff_Image));

