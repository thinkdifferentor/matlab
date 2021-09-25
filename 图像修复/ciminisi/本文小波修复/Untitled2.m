clear;
close;
clc
im=(imread('C:\Users\Administrator\Desktop\zwg\barb.png'));
figure(1);
imshow(im);
[m,n]=size(im);
[LL, LH, HL, HH]=dwt2(im,'haar');
im=[LL, LH; HL, HH];
img=idwt2(LL, LH, HL, HH,'haar','per');
imshow(LL);
imgn=zeros(m,n);

for i=0:m/2:m/2
    for j=0:n/2:n/2
       [LL, LH, HL, HH]= dwt2(im(i+1:i+m/2,j+1:j+n/2),'haar');
       imgn(i+1:i+m/2,j+1:j+n/2)=[LL, LH; HL, HH];
    end
end

figure(2);
   imshow(uint8(imgn));

