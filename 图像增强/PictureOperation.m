%% ��ֵͼ����
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%��ͼ����ж�ֵ������,I3
level = graythresh(I1);
I2 = im2bw(I1,level);
imshow(I2);
%% ����
model=[0 1 0;1 1 1;0 1 0];
Idilate=imdilate(I2,model);
figure,imshow(Idilate);
%% ��ʴ
Ierode=imerode(I2,model);
figure,imshow(Ierode);
%% ������
Iopen=imopen(I2,model);
figure,imshow(Iopen);
%% ������
Iclose=imclose(I2,model);
figure,imshow(Iclose);