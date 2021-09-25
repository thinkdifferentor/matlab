% 这个算法是对photoshop中滤镜->像素化->碎片这个功能的学习。
% PS这个功能好像不带参数，不过我这里有滤波半径r可以进行控制。
% 因为我是看效果猜算法的，效果肯定有所区别。
% 我的想法是对图像以r为长度，在上下左右四个方向做位移，然后进行混合。
% 代码还是很简单，就不详细介绍了。

clear all;close all;clc

img=double(imread('lena.jpg'));
[h w]=size(img);
imshow(img,[])

r=10;   %位移距离

%向上下左右四个方向移位，然后再混合
%ps也许是对左上、右上、左下、右下四个角的方向做的位移
left=zeros(h+2*r,w+2*r);
right=zeros(h+2*r,w+2*r);
top=zeros(h+2*r,w+2*r);
bottom=zeros(h+2*r,w+2*r);

%这里做了一个图像放大的处理，防止最后图像边缘产生突变
left(r+1:h+r,1:w+r)=imresize(img,[h,w+r]);
right(r+1:h+r,r+1:w+2*r)=imresize(img,[h,w+r]);
top(1:h+r,r+1:w+r)=imresize(img,[h+r,w]);
bottom(r+1:h+2*r,r+1:w+r)=imresize(img,[h+r,w]);

imgn=0.25*(left+right+top+bottom);
imgn=imgn(r+1:h+r,r+1:w+r);

figure;imshow(imgn,[]);