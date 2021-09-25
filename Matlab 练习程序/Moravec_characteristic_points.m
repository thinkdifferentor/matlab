% �����������ͼ����ʷ�ϵ�һ����������ȡ�㷨��
clear all;close all;clc

img=double(imread('lena.jpg'));
[h w]=size(img);
imshow(img,[])

imgn=zeros(h,w);
n=4;
for y=1+n:h-n
   for x=1+n:w-n
       sq=img(y-n:y+n,x-n:x+n);
       V=zeros(1,4);
       for i=2:2*n+1        %��ֱ��ˮƽ���Խǣ����Խ��ĸ���������ҶȲ��ƽ����
            V(1)=V(1)+(sq(i,n+1)-sq(i-1,n+1))^2;
            V(2)=V(2)+(sq(n+1,i)-sq(n+1,i-1))^2;
            V(3)=V(3)+(sq(i,i)-sq(i-1,i-1))^2;
            V(4)=V(4)+(sq(i,(2*n+1)-(i-1))-sq(i-1,(2*n+1)-(i-2)))^2;
       end
       pix=min(V);          %�ĸ�������ѡ��Сֵ
       imgn(y,x)=pix;      
   end
end

T=mean(imgn(:));        %����ֵ��С�ھ�ֵ����
ind=find(imgn<T);
imgn(ind)=0;

for y=1+n:h-n           %ѡ�ֲ�����ҷ���ֵ��Ϊ������
    for x=1+n:w-n
        sq=imgn(y-n:y+n,x-n:x+n);
        if max(sq(:))==imgn(y,x) && imgn(y,x)~=0
            img(y,x)=255;
        end
    end
end

figure;
imshow(img,[]);