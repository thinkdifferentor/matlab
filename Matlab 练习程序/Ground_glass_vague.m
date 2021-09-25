% 毛玻璃模糊
% 算是一种特效模糊方式吧，算法原理就是用邻域随机像素代替当前所处理的像素就可以了。


clear all; close all;clc;

img=imread('lena.jpg');
[h,w]=size(img);
imgn=img;
n=3;    %模糊直径

for i=1:h
    for j=1:w
        offsetX=n*rand()-n/2;   %邻域随机值代替当前像素
        offsetY=n*rand()-n/2;
        
        y=floor(i+offsetY);
        x=floor(j+offsetX);
        
        if x>=1 && x<=w && y>=1 && y<=h
            imgn(i,j)=img(y,x);
        end
    end
end

imshow(img);
figure;
imshow(imgn,[]);