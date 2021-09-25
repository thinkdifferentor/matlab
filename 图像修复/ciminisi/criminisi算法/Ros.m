clear all;
close all;
clc;
tic
%Raw=imread('LENA256.BMP');
Raw=imread('barb_ori.png');
Raw=double(Raw);
F_bmp=imread('barbi.png');
%F_bmp=double(imread('LENA_256.png'));
fillRegion = zeros(size(F_bmp));
mm=find(F_bmp(:)==255);%mm=mm+20;
fillRegion(mm)=255;
L_bmp=criminisi( F_bmp);
[ mun,F_Mse,L_Mse,F_Psnr,L_psnr,Snr,SSIM]  = assess( fillRegion,Raw,double(F_bmp),double(L_bmp) )
toc;