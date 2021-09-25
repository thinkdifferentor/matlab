% 算法有很多变种。不过主要就是以下三步。
% 
% 1.设计隶属度函数将图像从空间域变换到模糊集域。
% 
% 2.设计模糊增强算子，在模糊集域对图像进行处理。
% 
% 3.根据第1步的隶属度函数重新将图像从模糊集域变换到空间域。
% 
% 这和频域处理中的变换反变换不是很像么。


clear all; close all; clc;

img=double(imread('lena.jpg'));
[m ,n]=size(img);

Fe=1;   %控制参数
Fd=128;

xmax=max(max(img));
u=(1+(xmax-img)/Fd).^(-Fe);     %空间域变换到模糊域

%也可以多次迭代
for i=1:m                       %模糊域增强算子
   for j=1:n
      if u(i,j)<0.5
        u(i,j)=2*u(i,j)^2; 
      else
        u(i,j)=1-2*(1-u(i,j))^2;
      end
   end
end

img=xmax-Fd.*(u.^(-1/Fe)-1);    %模糊域变换回空间域

figure;
imshow(uint8(img));