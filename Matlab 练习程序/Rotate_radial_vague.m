clear all;close all;clc

img=imread('lena.jpg');
[h w]=size(img);
imshow(img)

imgn=zeros(h,w);
for y=1:h
   for x=1:w
       r=sqrt((y-h/2)^2+(x-w/2)^2); 
       ang=atan2(y-h/2,x-w/2);
             
       pix=0;
       pixNum=0;
       rot=0;       
       for i=0:0.1:10
           rot=rot-0.001;    %旋转系数
           
           %r-i是距离当前像素的距离为r-i的像素，在当前像素和中心像素同一条直线上
           yy=round(abs(r-i)*sin(ang+rot))+h/2; 
           xx=round(abs(r-i)*cos(ang+rot))+w/2;
           if yy>=1 && yy<=h && xx>=1 && xx<=w
                pix=pix+double(img(yy,xx));
                pixNum=pixNum+1;
           end
       end
       pix=pix/pixNum;
       imgn(y,x)=pix;
   end
end

figure;
imshow(imgn,[]);