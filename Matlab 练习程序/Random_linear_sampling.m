% ��ֻ�Ǹо����棬д������һ�γ���
% 
% ԭ�������������������㣬Ȼ������������㻭ֱ�ߣ������ֱ���ϵ����ر�����û��ֱ���ϵ����ض��������ˡ�
% 
% ���������һ�����кܶ�ն���ͼ��
% 
% ��Ȼ���Ժ��пն���ͼ���ǿ������޸��㷨�޸��ġ�
% 
% ��Ҳ�����޸���һ�£��õ��㷨�ҹ�ȥҲд�������Կ����

clear all; close all;clc;

img=double(imread('lena.jpg'));
imshow(img,[]);

[h,w]=size(img);

n=200;
pix=rand(n,4);
pix(:,1:2)=round(pix(:,1:2)*(w-1))+1;
pix(:,3:4)=round(pix(:,3:4)*(h-1))+1;
mask=zeros(h,w);

for i=1:n
    x1=pix(i,1);x2=pix(i,2);   
    y1=pix(i,3);y2=pix(i,4);   
    mask=drawline(mask,x1,y1,x2,y2); 
end

ind=find(mask~=1);
img(ind)=0;
figure;imshow(img,[])