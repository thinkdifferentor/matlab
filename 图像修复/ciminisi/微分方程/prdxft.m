clear all;
close all;
clc;
tic
Raw=imread('barb_ori.png');
F_bmp=imread('barbi.png');
RR=zeros(size(Raw));
RR(F_bmp(:)==255) = 255;
imshow(F_bmp);
L_bmp=PorDiff(F_bmp,RR);
[ mun,F_Mse,L_Mse,F_Psnr,L_psnr] = assess( RR,double(Raw),double(F_bmp),double(L_bmp) )
toc
