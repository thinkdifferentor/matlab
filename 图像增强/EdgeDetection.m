%% ��Ե���
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% Sobel����
figure,imshow(edge(I1,'sobel'));
%% Prewitt����
figure,imshow(edge(I1,'prewitt'));
%% Roberts����
figure,imshow(edge(I1,'roberts'));
%% Canny����
figure,imshow(edge(I1,'canny'));