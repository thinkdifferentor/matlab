% 我手机上有一个软件实现了很多图像滤镜，挺有意思，我打算都尝试一下。
% 这个滤镜主要是实现老照片效果。 
% 代码很短，我就不详细介绍了。

clear all;close all;clc;

img=imread('lena_ori_512.jpg');
[h w k]=size(img);
imshow(img);

R=double(img(:,:,1));
G=double(img(:,:,2));
B=double(img(:,:,3));

rR=R*0.393+G*0.769+B*0.198;
rG=R*0.349+G*0.686+B*0.168;
rB=R*0.272+G*0.534+B*0.131;

randR=rand()*0.5+0.5;
randG=rand()*0.5+0.5;
randB=rand()*0.5+0.5;

imgn=zeros(h,w,k);
imgn(:,:,1)=randR*rR+(1-randR)*R;
imgn(:,:,2)=randG*rG+(1-randG)*G;
imgn(:,:,3)=randB*rB+(1-randB)*B;

figure;imshow(uint8(imgn));