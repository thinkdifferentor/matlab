function [ mun,F_Mse,L_Mse,F_Psnr,L_psnr] = assess( fillRegion,Raw,F_bmp,L_bmp )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%mun表示缺损象素个数
%F_Mse表示修复前 M SE
%L_Mse表示修复后 M SE
%F_Psnr修复前 P SNR
%L_psnr修复后 P SNR
%Ram表示原图
%F_bmp表示修复前的图；
%L_bmp表示修复后的图；

Ln=find(fillRegion(:)~=0);
mun=length(Ln);
sum=0;sum1=0;
for i=1:mun
   sum=sum+( Raw(Ln(i))-F_bmp(Ln(i)))^2;
   
   sum1=sum1+( Raw(Ln(i))-L_bmp(Ln(i)))^2;
end
F_Mse=sum/mun;
L_Mse=sum1/mun;
F_Psnr=10*log10(255^2/F_Mse);
L_psnr=10*log10(255^2/L_Mse);
end

