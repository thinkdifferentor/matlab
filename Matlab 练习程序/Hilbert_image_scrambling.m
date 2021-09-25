% �󲿷ֵ�ͼ�����Ҷ�������ͼ������1��ʾ����������2�����Ҳ�С�����ɵġ�
% 
% ����1���Ȱ�ԭͼ��hilbert���߽��и�ֵ������һ��һά���飬��reshape��һ��ͼ��
% 
% ����2���Ȱ�ԭͼreshape��һά���飬Ȼ���ٰ�hilbert���߽��и�ֵ������һ��ͼ��
% 
% �Ҹо�����࣬��������1������Щ������2�����û�����������ⶼ�������
% 
% Ҳ������������1����һ��ͼ��Ȼ������ɵ�ͼ������2������һ��ͼ���Ǿ͸����ˣ���������Ҳ�����ܹ��ָ�ԭͼ�ġ�

clear all;close all;clc;

h=256;
w=256;
n=8;   
img=imread('lena.jpg');
imshow(img,[])

imgn1=zeros(1,h*w);
imgn2=zeros(h,w);

[x,y]=hilbert(n);       
x=floor((x+0.5)*w)+1;
y=floor((y+0.5)*h)+1;

l=length(x);
img2=reshape(img,[1,h*w]);
for i=1:l
    imgn1(i)=img(y(i),x(i));
    imgn2(y(i),x(i))=img2(i);
end

imgn1=reshape(imgn1,[h,w]);

figure;
imshow(imgn1,[]);
figure
imshow(imgn2,[])