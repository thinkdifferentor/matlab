close all
clear
clc
%% ͼ����ǿ(3)
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('1.jpg');
figure,imshow(I);
I1=rgb2gray(I);
figure,imshow(I1);
% %% �ݶ������Ա�
% Igrad=I1;%���ô����ͼƬ
% for i=1:length(Igrad)-1%�������е�����������
%     for j=1:length(Igrad(2,:))-1
%         x=I1(i,j+1)-I1(i,j);
%         y=I1(i+1,j)-I1(i,j);
%         grad=max(abs(x),abs(y));
%         Igrad(i,j)=grad;%��ֵ
%     end
% end
% figure,imshow(Igrad);
%% Prewitt����
model=fspecial('prewitt');
Iprewitt=filter2(model,I1);
figure('name','Prewitt����'),imshow(Iprewitt,[]);
%% Sobel����
model=fspecial('sobel');
Isobel=filter2(model,I1);
figure('name','Sobel����'),imshow(Isobel,[]);
% %% �����������Ա�
% n=2;%����ģ���С
% modelx=[-1 0;0 1];%����ģ��x����
% modely=[0 -1;1 0];%����ģ��y����
% Iend=I1;%���ô����ͼƬ
% Idouble=double(I1);
% for i=1:length(Idouble)-5+n%�������е�����������
%     for j=1:length(Idouble(2,:))-5+n
%         area=Idouble(i:i+n-1,j:j+n-1);
%         x=area.*modelx;
%         y=area.*modely;
%         grad=max(abs(sum(x(:))),abs((sum(y(:)))));
%         Iend(i,j)=grad;%��ֵ
%     end
% end
% figure,imshow(Iend,[]);
%% Laplacian����
model=fspecial('laplacian');
Ilaplacian=filter2(model,I1);
figure('name','Laplacian����'),imshow(Ilaplacian);
% %% Laplacian�����Ա�
% n=3;%����ģ���С
% model=[0 -1 0;-1 5 -1;0 -1 0];%����ģ��
% Iend=I1;%���ô����ͼƬ
% Idouble=double(I1);
% for i=1:length(Idouble)-5+n%�������е�����������
%     for j=1:length(Idouble(2,:))-5+n
%         area=Idouble(i:i+n-1,j:j+n-1);
%         x=area.*model;
%         grad=sum(x(:));
%         Iend(i,j)=grad;%��ֵ
%     end
% end
% figure,imshow(Iend);
