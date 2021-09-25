clear all;
close all;
clc;
tic
Raw=imread('fengjing.png');
F_bmp=imread('fengjing_xihuanhen.png');
RR=zeros(size(Raw));
RR(F_bmp(:)==255) = 255;
imshow(F_bmp);
L_bmp=PorDiff(F_bmp,RR);
[ mun,F_Mse,L_Mse,F_Psnr,L_psnr] = assess( RR,double(Raw),double(F_bmp),double(L_bmp) )
toc
%这个图片是我自己找的，替换上来的，结果运行了程序根本就没有修复，你帮我看一下，好了的话，然后再帮我用这个运行fengjing_kuai.png这张图片，想要都可以运行起来 