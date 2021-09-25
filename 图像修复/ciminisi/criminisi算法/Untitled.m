clear all;
close all;
clc;

img=imread('C:\Users\Administrator\Desktop\zwg\barb.png');
fillRegion = img == 255;

% figure(1)
% imshow(fillRegion,[]);

[LL, LH, HL, HH]=dwt2(img,'db1');  
img=[LL ,LH;HL, HH];%Ò»²ã·Ö½â
figure(1)
imshow(img,[]);
imwrite(mat2gray(LL),'img2.bmp')
%imwrite(img,'img1.bmp');
[m, n]=size(img);
figure(1)
im=idwt2(LL, LH, HL, HH,'db1','sX');
imshow(im,[]);