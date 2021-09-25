clear all;
close all;
clc;

img=imread('bungee1.png');
%
%img=rgb2gray(img);
fillRegion = zeros(size(img));
mm=find(img(:)==255);%mm=mm+20;
fillRegion(mm)=255;
% figure(1)
% imshow(fillRegion,[]);
[cA, cH, cD, cV]=dwt2(img,'haar');  
[LL1, LH1, HL1, HH1]=dwt2(fillRegion,'haar'); 
img=[cA, cH; cD, cV];%一层分解
figure()
imshow(img,[]);
figure()
imshow(mat2gray(LL));
% figure()
% imshow(rgb2gray(LL));
% imwrite(mat2gray(LL),'img2.bmp')
%imwrite(img,'img1.bmp');
[m, n]=size(img);
figure()
im=idwt2(LL, LH, HL, HH,'haar','sX');
imshow(im,[]);

imgn=zeros(m,n);
for i=0:m/2:m/2
    for j=0:n/2:n/2
        [LL ,LH ,HL ,HH]=dwt2(img(i+1:i+m/2,j+1:j+n/2),'db1'); %对一层分解后的四个图像分别再分解
        imgn(i+1:i+m/2,j+1:j+n/2)=[LL LH;HL HH];  
    end
end
figure();
imshow(imgn,[]);
%inshow(ind2gray(imgn(1:m/4,1:n/4)))
imwrite(mat2gray(imgn(1:m/4,1:n/4)),'img1.bmp')
Dwt_Ciminicis(imgn,LL1);

