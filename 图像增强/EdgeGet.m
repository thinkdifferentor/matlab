%��Ե��Ϣ��ȡ
close all
clear
clc

i=imread('lena.jpg');
i2=im2double(i);
ihd=rgb2gray(i2);
[thr,sorh,keepapp]=ddencmp('den','wv',ihd);
ixc=wdencmp('gbl',ihd,'sym4',2,thr,sorh,keepapp);
imwrite(ixc,'�����ͼ��Ҷ�ͼ.jpg');
figure,imshow(ixc),title('�����ͼ�� ');
k2=medfilt2(ixc,[7 7]);
figure,imshow(k2),title('��ֵ�˲�')
isuo=imresize(k2,0.25,'bicubic');

%sobert��robert��prewitt���Ӽ��ͼ���Ե;
esobel=edge(isuo,'sobel');
erob=edge(isuo,'roberts');
eprew=edge(isuo,'prewitt');
elog=edge(isuo,'log'); %��log���ӽ��б�Ե���
ecanny=edge(isuo,'canny'); %��canny���ӽ��б�Ե���

subplot(2,3,1)
imshow(isuo);title('ǰ�ڴ���ͼ��')
subplot(2,3,2)
imshow(esobel);title('sobel������ȡ')
subplot(2,3,3)
imshow(erob);title('roberts������ȡ')
subplot(2,3,4)
imshow(eprew);title('prewitt������ȡ')
subplot(2,3,5)
imshow(elog);title('log������ȡ')
subplot(2,3,6)
imshow(ecanny);title('canny������ȡ')





