clear all;close all;clc;

img1=imread('lena.jpg');
[h1 w1]=size(img1);
mask=uint8(ones(h1,w1));    %二值模板，方便最后的合成

img2=imread('board.jpg');
[h2 w2]=size(img2);

imshow(img1);
figure;imshow(img2);

p1=[1,1;w1,1;1,h1;w1,h1];
p2=ginput();        %依次点击公告牌左上、右上、左下、右下

T=calc_homography(p1,p2);   %计算单应性矩阵
T=maketform('projective',T);   %投影矩阵

[imgn X Y]=imtransform(img1,T);     %投影
mask=imtransform(mask,T);

T2=eye(3);
if X(1)>0, T2(3,1)= X(1); end
if Y(1)>0, T2(3,2)= Y(1); end
T2=maketform('affine',T2);      %仿射矩阵

imgn=imtransform(imgn,T2,'XData',[1 w2],'YData',[1 h2]);    %仿射
mask=imtransform(mask,T2,'XData',[1 w2],'YData',[1 h2]);

img=img2.*(1-mask)+imgn.*mask;  %合成
figure;imshow(img,[])