% �������̣�
% 
% 1.����񷶥ͼ��Բ����Բ�İ뾶���任������ؾ�������������뾶��Բ���С�
% 
% 2.����񷶥ͼ����������ǰ����λ��Բ���ڣ���ͨ�������귴�任ȥȫ��ͼ��Ѱ����Ӧλ�õ����ؽ�����䡣
% 
% 3.������ͼ������ˡ�

clear all;
close all;
clc;

img=imread('sample.jpg');
imshow(img);
[m,n]=size(img);

r1=100;     %�ڻ��뾶
r2=r1+m;    %�⻷�뾶

imgn=zeros(2*r2,2*r2);
[re_m,re_n]=size(imgn);
for y=1:re_m
    for x=1:re_n
        dis_x=x-re_n/2;
        dis_y=y-re_m/2;
        
        l=sqrt(dis_x^2+dis_y^2);
        if l<=r2 && l>=r1
            theta=0;
            if y>re_m/2
                theta=atan2(dis_y,dis_x);
            end
            if y<re_m/2
                theta=pi+atan2(-dis_y,-dis_x);
            end            
            if y==re_m/2
                theta=atan2(dis_y,dis_x)+0.0001;
            end
            
            xx=ceil(n*theta/(2*pi));
            yy=ceil(l-r1);
            if yy>=1 && yy<=m && xx>=1 && xx<=n
                imgn(y,x)=img(yy,xx);
            end
        end
    end
end

figure;
imshow(imgn,[])