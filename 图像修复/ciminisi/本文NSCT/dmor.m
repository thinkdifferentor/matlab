
clc
clear;
im=imread('256.bmp');
pfilt = '9-7';            % choose LP decomposition filter
%dfilt = 'pkva';    
dfilt = 'haar'; % choose DFB decomposition filter
th = 3;                     % lead to 3*sigma threshold denoising
rho=3;
nlevs = [1,2,3];
im = double(im)/256 ;

sig = std(im(:));
sigma = sig / rho;

y = nsctdec(im,nlevs, dfilt, pfilt);
cA= nsctrec(y, dfilt, pfilt);
imshow(cA);