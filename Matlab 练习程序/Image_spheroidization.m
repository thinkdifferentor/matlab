%图像球化

clear all;close all;clc;

img=imread('lena.jpg');
[h w]=size(img);
imshow(img);

imgn=zeros(h,w);
R=h/2;
cenX=w/2;
cenY=h/2;
theta=pi;
for y=1-cenY:h-cenY
    for x=1-cenX:w-cenX
        
        disX=1.3*x;     %系数为1则半径为h/2
        disY=1.3*y;
      
        dis=disX^2+disY^2;
        r=sqrt(disX^2+disY^2);
        if r<=R        
            xx=2*R*disX*acos(sqrt(R^2-dis)/R)/(theta*r)+cenX;
            yy=2*R*disY*acos(sqrt(R^2-dis)/R)/(theta*r)+cenY;
                      
            xx=round(xx);
            yy=round(yy);
            if xx>=1 && xx<=w && yy>=1 && yy<=h
                imgn(y+cenY,x+cenX)=img(yy,xx);
            end
        else
            imgn(y+cenY,x+cenX)=img(y+cenY,x+cenX);
        end
        
    end
end

figure;
imshow(imgn,[])