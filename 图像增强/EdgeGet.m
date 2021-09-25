%边缘信息提取
close all
clear
clc

i=imread('lena.jpg');
i2=im2double(i);
ihd=rgb2gray(i2);
[thr,sorh,keepapp]=ddencmp('den','wv',ihd);
ixc=wdencmp('gbl',ihd,'sym4',2,thr,sorh,keepapp);
imwrite(ixc,'消噪后图像灰度图.jpg');
figure,imshow(ixc),title('消噪后图像 ');
k2=medfilt2(ixc,[7 7]);
figure,imshow(k2),title('中值滤波')
isuo=imresize(k2,0.25,'bicubic');

%sobert、robert和prewitt算子检测图像边缘;
esobel=edge(isuo,'sobel');
erob=edge(isuo,'roberts');
eprew=edge(isuo,'prewitt');
elog=edge(isuo,'log'); %用log算子进行边缘检测
ecanny=edge(isuo,'canny'); %用canny算子进行边缘检测

subplot(2,3,1)
imshow(isuo);title('前期处理图像')
subplot(2,3,2)
imshow(esobel);title('sobel算子提取')
subplot(2,3,3)
imshow(erob);title('roberts算子提取')
subplot(2,3,4)
imshow(eprew);title('prewitt算子提取')
subplot(2,3,5)
imshow(elog);title('log算子提取')
subplot(2,3,6)
imshow(ecanny);title('canny算子提取')





