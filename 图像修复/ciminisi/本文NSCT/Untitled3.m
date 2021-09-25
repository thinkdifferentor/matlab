clear all;
clc;
%设定参数
pfilt = '9-7';            % choose LP decomposition filter
dfilt = 'pkva';           % choose DFB decomposition filter
% nlevs = [0, 0, 4, 4, 5];    % Number of levels for DFB at each pyramidal level
                            % nlevs: vector of numbers of directional filter bank decomposition levels 
                            %  at each pyramidal level (from coarse to fine scale).                            
th = 3;                     % lead to 3*sigma threshold denoising
rho=3;
nlevs = [1,1,1];
% 加载图像
% im = imread('d:\MATLAB701\work\LENA256_xiufu_xiao.bmp');
im =imread('barbi.png');
% ori_A = imread('d:\MATLAB701\work\LENA256_xiufu_xiao.bmp');
% im = imread('d:\MATLAB701\work\meinv1.bmp');
%  imshow(im)
im = double(im)/512 ;

sig = std(im(:));
sigma = sig / rho;
% Contourlet 变换
% 分解
% y = pdfbdec(im, pfilt, dfilt, nlevs);
y = nsctdec(im,nlevs, dfilt, pfilt);

cim = nsctrec(y, dfilt, pfilt);
%显示图像
 range = [0, 1];
colormap(gray);
% subplot(1,1,1),imagesc(cim(1:256, 1:256), range); axis image off
figure(3),imagesc(cim(1:512, 1:512), range); axis image off
colormap(gray);
set(gca, 'FontSize', 8);
title('Contourlets decomposition', 'FontSize', 10) 