% 大部分的图像置乱都是如下图的置乱1所示，至于置乱2则是我不小心生成的。
% 
% 置乱1是先把原图按hilbert曲线进行赋值，拉成一条一维数组，再reshape成一副图像。
% 
% 置乱2是先把原图reshape成一维数组，然后再按hilbert曲线进行赋值，生成一副图像。
% 
% 我感觉都差不多，网上置乱1更常见些，置乱2好像就没见过，不过这都算置乱嘛。
% 
% 也可以先用置乱1生成一副图像，然后把生成的图用置乱2再生成一副图，那就更乱了，不过再乱也都是能够恢复原图的。

clear all;close all;clc;

h=256;
w=256;
n=8;   
img=imread('lena.jpg');
imshow(img,[])

imgn1=zeros(1,h*w);
imgn2=zeros(h,w);

[x,y]=hilbert(n);       
x=floor((x+0.5)*w)+1;
y=floor((y+0.5)*h)+1;

l=length(x);
img2=reshape(img,[1,h*w]);
for i=1:l
    imgn1(i)=img(y(i),x(i));
    imgn2(y(i),x(i))=img2(i);
end

imgn1=reshape(imgn1,[h,w]);

figure;
imshow(imgn1,[]);
figure
imshow(imgn2,[])