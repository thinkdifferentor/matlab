function [ mun,F_Mse,L_Mse,F_Psnr,L_psnr,Snr,SSIM] = assess( fillRegion,Raw,F_bmp,L_bmp )
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
%Snr ����Ȳ��
%SSIM�ṹ������
K1=0.01; K2=0.03; L=255;
C1=(K1*L)^2;
C2=(K2*L)^2;
C3=C2/2;
b=size(Raw);
Ln=find(fillRegion(:)~=0);
mun=length(Ln);
sum2=0;sum1=0;
for i=1:mun
   sum2=sum2+( Raw(Ln(i))-F_bmp(Ln(i)))^2;
   
   sum1=sum1+( Raw(Ln(i))-L_bmp(Ln(i)))^2;
end
F_Mse=sum2/mun;
L_Mse=sum1/mun;
F_Psnr=10*log10(255^2/F_Mse);
L_psnr=10*log10(255^2/L_Mse);
AA=Raw.^2;
BB=(L_bmp-Raw).^2;
Snr=10*log10(sum(AA(:))/sum(BB(:)));
muX=mean(Raw(:));
muY=mean(L_bmp(:));
SgmX=std(Raw(:));
SgmY=std(L_bmp(:));
QQE=(Raw-muX).*(L_bmp-muY);
SgmXY=sum(QQE(:))/(b(1)*b(2)-1);
LXY=(2*muX*muY+C1)/(muX^2+muY^2+C1);
cXY=(2*SgmXY+C2)/(SgmX^2+SgmY^2+C2);
sXY=(SgmXY+C3)/(SgmX*SgmY+C3);
SSIM=LXY*cXY*sXY;
end

