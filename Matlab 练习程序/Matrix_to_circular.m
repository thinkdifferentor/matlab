% 最近对图像坐标的变换很感兴趣啊，这次是将一张图像变换为圆形。
% 
% 变换原理就是按变换前后像素到圆心的距离按比例缩减就行了。

clear all;close all;clc;

img=imread('lena.jpg');
[h w]=size(img);
imshow(img);

imgn=zeros(h,w);
cenX=w/2;
cenY=h/2;

newR=w/2;           %圆的半径
for y=1:h
    for x=1:w
   
        r=sqrt((x-cenX)^2+(y-cenY)^2);  %当前像素到图像中心的距离
        ang=atan2(y-cenY,x-cenX);
     
        if ang>=pi/4 && ang<=3*pi/4 || ang<=-pi/4 && ang>=-3*pi/4
            R=sqrt(cenY^2+(x-cenX)^2);  %当前像素和图像中心连线上，图像边缘像素和图像中心的距离
        else
            R=sqrt(cenX^2+(y-cenY)^2);
        end
       
        ss=r/R;         %比例系数
        xx=round((newR*ss*cos(ang)+cenX));
        yy=round((newR*ss*sin(ang)+cenY));
       
        if xx>=1 && xx<=w && yy>=1 && yy<=h
            imgn(yy,xx)=img(y,x);
        end
       
    end
end

figure;
imshow(imgn,[])