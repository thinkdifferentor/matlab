%% 图像变换(1)
%读取图片并转换为灰度图片
I=imread('fft.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% 傅立叶变换
F=fft2(I1);
S=abs(F);
figure,imshow(S,[]);
%% 移到中心
Fc=fftshift(F);
figure,imshow(abs(Fc),[]);
%% 用log增强
S2=log(1+abs(Fc));
figure,imshow(S2,[]);
%% 频谱图
figure,imshow(uint8(abs(Fc/256)));
%% 傅立叶逆变换
f=real(ifft2(F)/255);
figure,imshow(f);




%% 图像变换(2)
%读取图片并转换为灰度图片
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% 离散哈达玛变换
Idouble=im2double(I1);
h1=size(I1,1);
h2=size(I1,2);
H1=hadamard(h1);%哈达玛变换矩阵
H2=hadamard(h2);
I2=H1*Idouble*H2/sqrt(h1*h2);
figure,imshow(I2);
%% 离散余弦变换
I3=dct2(I1);
figure,imshow(log(abs(I3)),[]);
%% 离散余弦反变换
I4=idct2(I3);
figure,imshow(I4,[0 255]);