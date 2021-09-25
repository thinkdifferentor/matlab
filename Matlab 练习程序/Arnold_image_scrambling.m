clear all;close all;clc;

img=imread('lena.jpg');
imshow(img,[])
[h w]=size(img);

%置乱与复原的共同参数
n=10;
a=3;b=5;
N=h;

%置乱
imgn=zeros(h,w);
for i=1:n
    for y=1:h
        for x=1:w           
            xx=mod((x-1)+b*(y-1),N)+1;
            yy=mod(a*(x-1)+(a*b+1)*(y-1),N)+1;        
            imgn(yy,xx)=img(y,x);                
        end
    end
    img=imgn;
end
figure;
imshow(imgn,[])

%复原
img=imgn;
for i=1:n
    for y=1:h
        for x=1:w            
            xx=mod((a*b+1)*(x-1)-b*(y-1),N)+1;
            yy=mod(-a*(x-1)+(y-1),N)+1  ;        
            imgn(yy,xx)=img(y,x);                   
        end
    end
    img=imgn;
end
figure
imshow(imgn,[])