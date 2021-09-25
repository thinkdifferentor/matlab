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
        st=[Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];   %�ṹ����
        K=det(st);                          %������ʽ
        H=trace(st);                        %��
       %���е��ж϶��ǽ��Ƶ�
       % if H<50                            %��Ϊ��ƽ̹����
       % if H>50 && abs(K)<0.01*10^(-9)     %��Ϊ�Ǳ�Ե����
        if  H>50 && abs(K)>0.01*10^(-9)     %��Ϊ�ǽǵ�����
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