% ����ԭ����ǽ���������ƽ��ֵ���������е��������ء�
% ���ｫ��������Ϊ�˴������Ͳ����������������������Ӿ�Ч��Ҫ��Щ��

clear all; close all;clc;

img=imread('lena.jpg');
imshow(img,[]);

[h w]=size(img);
imgn=zeros(h,w);

n=12;
nw=floor(w/n)*n;
nh=floor(h/n)*n;

for y=1:n:nh
    for x=1:n:nw
        imgn(y:y+n-1,x:x+n-1)=mean(mean(img(y:y+n-1,x:x+n-1)));       
    end

    imgn(y:y+n-1,nw+1:w)=mean(mean(img(y:y+n-1,nw+1:w)));   %�������һ��
    imgn(y,1:w)=128; 
end

for x=1:n:nw
    imgn(nh+1:h,x:x+n-1)=mean(mean(img(nh+1:h,x:x+n-1)));   %�������һ��
    imgn(1:h,x)=128;    
end

imgn(nh+1:h,nw+1:w)=mean(mean(img(nh+1:h,nw+1:w)));     %�������һ����

imgn(1:h,nw)=128;
imgn(1:h,w)=128;

imgn(nh,1:w)=128;
imgn(h,1:w)=128;

figure;imshow(imgn,[])