% ��Ƶ���������һ�㶼��������֡�л�����Ч���ҹ�ȥ�ù�vagas������кܶ��л���Ч��
% 
% �������Ҳ��������һ�ְɣ���Ȼ�Ҳ�ȷ��ʵ���е�����û�������л���

clear all;close all;clc;

img=imread('lena.jpg');
img2=imread('rice.png');%matlab ϵͳ�Դ�ͼƬ
[h w]=size(img);

imshow(img,[]);

flag=1;
k=0.0;
while 1
    imgn=zeros(h,w);
    for y=1:h
        for x=1:w

            dx=rand()*2*w*k-w*k;
            dy=rand()*2*h*k-h*k;

            xx=round(x+dx);
            yy=round(y+dy);

            if xx>=1 && xx<=w && yy>=1 && yy<=h
                imgn(yy,xx)=img(y,x);
            end
        end
    end
    if flag==1
        k=k+0.05;
    else
        k=k-0.05;
    end
   
    if k>=1
       flag=0;
       img=img2;
    end
    if k<=0
       flag=1;
       break;
    end

    figure(1)
    imshow(imgn,[]);

end

imshow(img,[])