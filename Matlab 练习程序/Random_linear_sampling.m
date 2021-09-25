% 我只是感觉好玩，写了这样一段程序。
% 
% 原理就是先随机生成两个点，然后根据这两个点画直线，最后在直线上的像素保留，没在直线上的像素丢弃就行了。
% 
% 最后生成了一幅含有很多空洞的图像。
% 
% 当然，对含有空洞的图像是可以用修复算法修复的。
% 
% 我也尝试修复了一下，用的算法我过去也写过，可以看这里。

clear all; close all;clc;

img=double(imread('lena.jpg'));
imshow(img,[]);

[h,w]=size(img);

n=200;
pix=rand(n,4);
pix(:,1:2)=round(pix(:,1:2)*(w-1))+1;
pix(:,3:4)=round(pix(:,3:4)*(h-1))+1;
mask=zeros(h,w);

for i=1:n
    x1=pix(i,1);x2=pix(i,2);   
    y1=pix(i,3);y2=pix(i,4);   
    mask=drawline(mask,x1,y1,x2,y2); 
end

ind=find(mask~=1);
img(ind)=0;
figure;imshow(img,[])