clear all; close all; clc;

img=double(imread('lena.jpg'));
[m n]=size(img);
imshow(img,[])

[Ix Iy]=gradient(img);
Ix2=Ix.^2;
Iy2=Iy.^2;
Ixy=Ix.*Iy;

k=1;
lambda=zeros(m*n,2);
for i=1:m
   for j=1:n 
        st=[Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];   %结构张量
        K=det(st);                          %求行列式
        H=trace(st);                        %求迹
       %所有的判断都是近似的
       % if H<50                            %认为是平坦区域
       % if H>50 && abs(K)<0.01*10^(-9)     %认为是边缘区域
        if  H>50 && abs(K)>0.01*10^(-9)     %认为是角点区域
            img(i,j)=255;
        end

       lambda(k,:)=[K H];
       k=k+1;
   end
end

figure;
plot(lambda(:,1),lambda(:,2),'.');
ylabel('trace');xlabel('det');

figure;
imshow(img,[])