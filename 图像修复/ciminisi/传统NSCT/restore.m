clear all;
close all;
clc;
tic
Raw=imread('barb_ori.png');
%Raw=imread('LENA256.BMP'); 
F_bmp=imread('barbi.png');
%F_bmp=imread('LENA_256.png');
fillRegion = zeros(size(F_bmp));
mm=find(F_bmp(:)==255);%mm=mm+20;
fillRegion(mm)=255;
RR=Mod(size(fillRegion),fillRegion);
RR=RR+Mod(size(fillRegion'),fillRegion')';
RR=RR(:,:)>=100;
pfilt = '9-7';            % choose LP decomposition filter
%dfilt = 'pkva';    
dfilt = 'pkva'; % choose DFB decomposition filter
th = 2;                     % lead to 3*sigma threshold denoising
rho=2;
nlevs = [1,1];
im = double(F_bmp)/256 ;

sig = std(im(:));
sigma = sig / rho;

y = nsctdec(im,nlevs, dfilt, pfilt);

%cim = nsctrec(y, dfilt, pfilt);

L_bmp=Dwt_Ciminicis11(y,F_bmp);
imwrite(L_bmp,'L_barbi.png');
L_bmp=imread('L_barbi.png');
L_bmp=double(L_bmp);
L_bmp=L_bmp./max(L_bmp(:));
L_bmp=L_bmp.*255;
L_bmp=uint8(L_bmp);
Q_bmp=F_bmp;%
Q_bmp(mm)=L_bmp(mm);figure();
imshow(Q_bmp);
L_bmp=PorDiff(Q_bmp,RR);
[ mun,F_Mse,L_Mse,F_Psnr,L_psnr,Snr,SSIM] = assess( fillRegion,double(Raw),double(F_bmp),double(L_bmp) )
toc
