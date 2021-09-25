% �����ͼ������ı任�ܸ���Ȥ��������ǽ�һ��ͼ��任ΪԲ�Ρ�
% 
% �任ԭ����ǰ��任ǰ�����ص�Բ�ĵľ��밴�������������ˡ�

clear all;close all;clc;

img=imread('lena.jpg');
[h w]=size(img);
imshow(img);

imgn=zeros(h,w);
cenX=w/2;
cenY=h/2;

newR=w/2;           %Բ�İ뾶
for y=1:h
    for x=1:w
   
        r=sqrt((x-cenX)^2+(y-cenY)^2);  %��ǰ���ص�ͼ�����ĵľ���
        ang=atan2(y-cenY,x-cenX);
     
        if ang>=pi/4 && ang<=3*pi/4 || ang<=-pi/4 && ang>=-3*pi/4
            R=sqrt(cenY^2+(x-cenX)^2);  %��ǰ���غ�ͼ�����������ϣ�ͼ���Ե���غ�ͼ�����ĵľ���
        else
            R=sqrt(cenX^2+(y-cenY)^2);
        end
       
        ss=r/R;         %����ϵ��
        xx=round((newR*ss*cos(ang)+cenX));
        yy=round((newR*ss*sin(ang)+cenY));
       
        if xx>=1 && xx<=w && yy>=1 && yy<=h
            imgn(yy,xx)=img(y,x);
        end
       
    end
end

figure;
imshow(imgn,[])