% ����㷨�Ƕ�photoshop���˾�->���ػ�->��Ƭ������ܵ�ѧϰ��
% PS������ܺ��񲻴��������������������˲��뾶r���Խ��п��ơ�
% ��Ϊ���ǿ�Ч�����㷨�ģ�Ч���϶���������
% �ҵ��뷨�Ƕ�ͼ����rΪ���ȣ������������ĸ�������λ�ƣ�Ȼ����л�ϡ�
% ���뻹�Ǻܼ򵥣��Ͳ���ϸ�����ˡ�

clear all;close all;clc

img=double(imread('lena.jpg'));
[h w]=size(img);
imshow(img,[])

r=10;   %λ�ƾ���

%�����������ĸ�������λ��Ȼ���ٻ��
%psҲ���Ƕ����ϡ����ϡ����¡������ĸ��ǵķ�������λ��
left=zeros(h+2*r,w+2*r);
right=zeros(h+2*r,w+2*r);
top=zeros(h+2*r,w+2*r);
bottom=zeros(h+2*r,w+2*r);

%��������һ��ͼ��Ŵ�Ĵ�����ֹ���ͼ���Ե����ͻ��
left(r+1:h+r,1:w+r)=imresize(img,[h,w+r]);
right(r+1:h+r,r+1:w+2*r)=imresize(img,[h,w+r]);
top(1:h+r,r+1:w+r)=imresize(img,[h+r,w]);
bottom(r+1:h+2*r,r+1:w+r)=imresize(img,[h+r,w]);

imgn=0.25*(left+right+top+bottom);
imgn=imgn(r+1:h+r,r+1:w+r);

figure;imshow(imgn,[]);