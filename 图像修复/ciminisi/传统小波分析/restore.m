clear all;
close all;
clc;
tic
%Raw=imread('LENA256.BMP'); 
Raw=imread('barb_ori.png');
Raw=double(Raw);

%F_bmp=double(imread('LENA_256.png'));
%F_bmp=double(imread('barbi.png'));
F_bmp=imread('LENA_256.png');
%a=rgb2bmp(F_bmp);
%
%img=rgb2gray(img);
fillRegion = zeros(size(F_bmp));
mm=find(F_bmp(:)==255);%mm=mm+20;
fillRegion(mm)=255;
% figure(1)
% imshow(fillRegion,[]);
[cA, cH, cD, cV]=dwt2(F_bmp,'haar');  
[LL1, LH1, HL1, HH1]=dwt2(fillRegion,'haar'); 
F_bmp1=[cA, cH; cD, cV];%Ò»²ã·Ö½â

L_bmp=Dwt_Ciminicis11( F_bmp1,LL1 );

[ mun,F_Mse,L_Mse,F_Psnr,L_psnr,Snr,SSIM] = assess( fillRegion,double(Raw),double(F_bmp),double(L_bmp) )
toc;