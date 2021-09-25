function [B] = TV_a()
clear
figure(1);
img=imread('Image51.bmp'); 
subplot(1,2,1);imshow(img); title('Original image');
fillimg=img;
I=double(fillimg)/255;
sz=[size(fillimg,1),size(fillimg,2)];
fillregion=fillimg(:,:)==255;

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
subplot(1,2,2);imshow(I2); title('TV修复图像');

mse2=0;mse1=0;
Origimg=imread('Image50.bmp');  %原始无损图片
Origimg=double(Origimg);img=double(img);I=double(I2);
for i=1:sz(1)
    for j=1:sz(2)
        mse1=(Origimg(i,j)-img(i,j))^2+mse1;
        mse2=(Origimg(i,j)-I(i,j))^2+mse2;
    end
end
isnr=double(10*log(mse1/mse2));
disp(['TV模型信噪比ISNR：',num2str(isnr)]); 
disp('======================================') ;
