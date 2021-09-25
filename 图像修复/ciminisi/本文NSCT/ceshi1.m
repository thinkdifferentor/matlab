clear all;
close all;
clc;
tic;
%设定参数
pfilt = '9-7';            % choose LP decomposition filter
dfilt = 'pkva';           % choose DFB decomposition filter
% nlevs = [0, 0, 4, 4, 5];    % Number of levels for DFB at each pyramidal level
                            % nlevs: vector of numbers of directional filter bank decomposition levels 
                            %  at each pyramidal level (from coarse to fine scale).                            
th = 3;                     % lead to 3*sigma threshold denoising
rho=3;
nlevs = [1,1];
% 加载图像
% Raw=imread('barb_ori.png');
Raw=imread('LENA256.BMP'); 
% im=imread('barbi.png');
im=imread('LENA_256.png');
F_bmp=im;
fillRegion = zeros(size(F_bmp));
mm=find(F_bmp(:)==255);%mm=mm+20;
fillRegion(mm)=255;
RR=Mod(size(fillRegion),fillRegion);
RR=RR+Mod(size(fillRegion'),fillRegion')';
im = double(im)/512 ;
sig = std(im(:));
sigma = sig / rho;
% Contourlet 变换
% 分解
% y = pdfbdec(im, pfilt, dfilt, nlevs);
y = nsctdec(im,nlevs, dfilt, pfilt);

L_bmp=Dwt_Ciminicis11(y,F_bmp);
cim = nsctrec(L_bmp, dfilt, pfilt);
figure()
imshow(cim,[]);
imwrite(cim,'L_barbi.png');
cim=imread('L_barbi.png');
L_bmp=PorDiff(cim,RR);
figure()
imshow(L_bmp);
[ mun,F_Mse,L_Mse,F_Psnr,L_psnr] = assess( fillRegion,double(Raw),double(F_bmp),double(L_bmp) )
toc

