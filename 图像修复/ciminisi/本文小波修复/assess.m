function [ mun,F_Mse,L_Mse,F_Psnr,L_psnr] = assess( fillRegion,Raw,F_bmp,L_bmp )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%mun��ʾȱ�����ظ���
%F_Mse��ʾ�޸�ǰ M SE
%L_Mse��ʾ�޸��� M SE
%F_Psnr�޸�ǰ P SNR
%L_psnr�޸��� P SNR
%Ram��ʾԭͼ
%F_bmp��ʾ�޸�ǰ��ͼ��
%L_bmp��ʾ�޸����ͼ��

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

