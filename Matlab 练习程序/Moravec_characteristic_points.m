% 这个算子算是图像历史上第一个特征点提取算法了
clear all;close all;clc

img=double(imread('lena.jpg'));
[h w]=size(img);
imshow(img,[])

imgn=zeros(h,w);
n=4;
for y=1+n:h-n
   for x=1+n:w-n
       sq=img(y-n:y+n,x-n:x+n);
       V=zeros(1,4);
       for i=2:2*n+1        %垂直，水平，对角，反对角四个方向领域灰度差的平方和
            V(1)=V(1)+(sq(i,n+1)-sq(i-1,n+1))^2;
            V(2)=V(2)+(sq(n+1,i)-sq(n+1,i-1))^2;
            V(3)=V(3)+(sq(i,i)-sq(i-1,i-1))^2;
            V(4)=V(4)+(sq(i,(2*n+1)-(i-1))-sq(i-1,(2*n+1)-(i-2)))^2;
       end
       pix=min(V);          %四个方向中选最小值
       imgn(y,x)=pix;      
   end
end

T=mean(imgn(:));        %设阈值，小于均值置零
ind=find(imgn<T);
imgn(ind)=0;

for y=1+n:h-n           %选局部最大且非零值作为特征点
    for x=1+n:w-n
        sq=imgn(y-n:y+n,x-n:x+n);
        if max(sq(:))==imgn(y,x) && imgn(y,x)~=0
            img(y,x)=255;
        end
    end
end

figure;
imshow(img,[]);