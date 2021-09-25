% 这个其实也算是圆柱体投影了，不过上一篇文章是从正面看，得到的是凸形的结果，而这个是从反面看，得到的是凹形的结果。 
% 计算公式就不写了，大致介绍一下，计算公式中关于x坐标求法和上篇一样，y坐标则正好是上篇公式的反变换，结合上篇公式代码和本篇的代码，应该都不是很难理解的。

clear all; close all;clc;

img=imread('lena.jpg');
[h,w]=size(img);

hfOV=pi/2;     %可取区间为(0,pi)
f=w/(2*tan(hfOV/2));

x1=0;
x2=floor(2*f*atan(w/(2*f)));
y1=floor(h/2-h*(sqrt((w/2)^2+f^2))/(2*f));
y2=floor(h/2+h*(sqrt((w/2)^2+f^2))/(2*f));

newh=y2-y1;       
neww=x2-x1;
imgn=zeros(newh,neww);
for i=1+y1:newh+y1
    for j=1:neww
       
       %反变换公式的应用
       x=floor(f*tan(j/f-atan(w/(2*f)))+w/2);          
       y=floor(h/2+f*(i-h/2)/sqrt(f^2+(w/2-x)^2)); 
            
        if x>=1 && x<=w && y>=1 && y<=h
            imgn(i-y1,j)=img(y,x);
        end       
        
    end
end

imshow(img);
figure;
imshow(imgn,[]);