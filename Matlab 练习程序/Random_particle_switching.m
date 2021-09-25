% 视频制作软件中一般都会有相邻帧切换的特效，我过去用过vagas好像就有很多切换特效。
% 
% 我想这个也算是其中一种吧，虽然我不确定实际中到底有没有这种切换。

clear all;close all;clc;

img=imread('lena.jpg');
img2=imread('rice.png');%matlab 系统自带图片
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