function [B] = TV_b()
clear,clc
figure(1);
img=imread('Image12.bmp'); 
figure(1);imshow(img); title('Original color image');
fillimg=imread('Image12.bmp'); 
figure(2);imshow(fillimg); title('Fill color region');
K=rgb2gray(fillimg);
imwrite(K,'Image120.bmp')
R=imread('Image120.bmp');
figure(3);imshow(R,255); title('Fill region');
I=double(R)/255;
sz=[size(R,1),size(R,2)];
fillregion=R(:,:,1)==255;

u=0.0001;  max=100; 

clc;tic;

for n=1:max         
  for i=3:sz(1)-2
   for j=3:sz(2)-2    
    if fillregion(i,j)==1   
        modIn=u+sqrt( (I(i,j+1)-I(i,j))^2+((I(i+1,j+1)-I(i-1,j+1)+I(i+1,j)-I(i-1,j))/4)^2); 
        wn=1/modIn;
        
        modIs=u+sqrt( (I(i,j-1)-I(i,j))^2+((I(i+1,j-1)-I(i-1,j-1)+I(i+1,j)-I(i-1,j))/4)^2); 
        ws=1/modIs;

        modIw=u+sqrt( (I(i,j)-I(i-1,j))^2+((I(i-1,j+1)-I(i-1,j-1)+I(i,j+1)-I(i,j-1))/4)^2); 
        ww=1/modIw;
        
        modIe=u+sqrt( (I(i+1,j)-I(i,j))^2+((I(i+1,j+1)-I(i+1,j-1)+I(i,j+1)-I(i,j-1))/4)^2); 
        we=1/modIe;
        
        wQ=we+ww+wn+ws;                               
        he=we/wQ;hw=ww/wQ;hn=wn/wQ;hs=ws/wQ;                 
        I(i,j)=he*I(i,j+1)+hw*I(i,j-1)+hn*I(i-1,j)+hs*I(i+1,j);
    end
   end
  end
end
disp(['TV模型从开始到最后运行的时间:',num2str(toc)]); 
disp('======================================') ;

I2=uint8(round(I*255));
figure(4);imshow(I2);title('TV修复图像');

mse2=0;mse1=0;
Origimg=imread('Image1.bmp');%原始无损图片
Origimg=double(Origimg);I1=double(K);I=double(I2);
for i=1:sz(1)
    for j=1:sz(2)
        mse1=(Origimg(i,j)-I1(i,j))^2+mse1;
        mse2=(Origimg(i,j)-I(i,j))^2+mse2;
    end
end
isnr=double(10*log(mse1/mse2));
disp(['TV模型信噪比ISNR：',num2str(isnr)]); 
disp('======================================') ;
subplot(1,2,1);M=imread('Image120.bmp');imshow(M);title('Original color image');
subplot(1,2,2);N=imread('Image1.bmp');imshow(N);title('TV修复图像');