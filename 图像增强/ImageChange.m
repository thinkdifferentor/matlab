%% ͼ��任(1)
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('fft.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% ����Ҷ�任
F=fft2(I1);
S=abs(F);
figure,imshow(S,[]);
%% �Ƶ�����
Fc=fftshift(F);
figure,imshow(abs(Fc),[]);
%% ��log��ǿ
S2=log(1+abs(Fc));
figure,imshow(S2,[]);
%% Ƶ��ͼ
figure,imshow(uint8(abs(Fc/256)));
%% ����Ҷ��任
f=real(ifft2(F)/255);
figure,imshow(f);




%% ͼ��任(2)
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% ��ɢ������任
Idouble=im2double(I1);
h1=size(I1,1);
h2=size(I1,2);
H1=hadamard(h1);%������任����
H2=hadamard(h2);
I2=H1*Idouble*H2/sqrt(h1*h2);
figure,imshow(I2);
%% ��ɢ���ұ任
I3=dct2(I1);
figure,imshow(log(abs(I3)),[]);
%% ��ɢ���ҷ��任
I4=idct2(I3);
figure,imshow(I4,[0 255]);