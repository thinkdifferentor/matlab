% 程序流程：
% 
% 1.定义穹顶图内圆和外圆的半径，变换后的像素就填充在这个内外半径的圆环中。
% 
% 2.遍历穹顶图，当所处理当前像素位于圆环内，则通过极坐标反变换去全景图中寻找相应位置的像素进行填充。
% 
% 3.遍历完图像就行了。

clear all;
close all;
clc;

img=imread('sample.jpg');
imshow(img);
[m,n]=size(img);

r1=100;     %内环半径
r2=r1+m;    %外环半径

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