% ë����ģ��
% ����һ����Чģ����ʽ�ɣ��㷨ԭ�����������������ش��浱ǰ����������ؾͿ����ˡ�


clear all; close all;clc;

img=imread('lena.jpg');
[h,w]=size(img);
imgn=img;
n=3;    %ģ��ֱ��

for i=1:h
    for j=1:w
        offsetX=n*rand()-n/2;   %�������ֵ���浱ǰ����
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