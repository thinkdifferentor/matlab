% 能够使用这样一条线遍历图像中所有的像素，不过这里没有这样做，而只是生成了这样一条曲线。
% 
% 程序中h,w是最终图像的高和宽，n为希尔伯特曲线阶数。
% 
% 这里如果n等于log2(h)或log2(w)，则图像就全为白了，也算是正好遍历所有像素了。
% 
% 当然，n很大的话，图像也是全为白的，不过，那样不算正好遍历吧。

clear all;close all;clc;

h=256;
w=256;
n=5;   
imgn=zeros(h,w);
[x,y]=hilbert(n);       
x=floor((x+0.5)*w)+1;
y=floor((y+0.5)*h)+1;

l=length(x);
for i=1:l-1
    imgn=drawline(imgn,x(i),y(i),x(i+1),y(i+1));  
end

imshow(imgn)