%% ͼ����ǿ(1)
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
figure,imshow(I1);
figure,imhist(I1);
%% ֱ��ͼ���⻯
I2=histeq(I1);
figure,imshow(I2);
figure,imhist(I2);
%% �Ҷȱ任���������Ա任��
I3=imadjust(I1,[0.3 0.7],[0.1 0.9],1);
figure,imshow(I3);
figure,imhist(I3);