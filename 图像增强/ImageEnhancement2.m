clear
close all
clc
%% ͼ����ǿ(2)
%��ȡͼƬ��ת��Ϊ�Ҷ�ͼƬ
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% ��������
I2=imnoise(I1,'salt & pepper');
figure('name','��������'),imshow(I2);
%% ��˹����
I3=imnoise(I1,'gaussian');
figure('name','��˹����'),imshow(I3);
%% MATLAB�Դ�����
%% ��ֵ�˲�
avgModel=fspecial('average',3);%3*3��ģ��
Iavg=filter2(avgModel,I2)/255;
figure('name','��ֵ�˲�'),imshow(Iavg);
%% ��ֵ�˲�
Imid=medfilt2(I3,[3,3]);%3*3��ģ��
figure('name','��ֵ�˲�'),imshow(Imid);

% %% �Ա�ģ��--��ֵ�˲�
% n=3;%����Ϊ3
% model(1:n,1:n)=1;%����Ϊ3*3��ȫ��Ϊ1
% Iavg=I2;%���ô����ͼƬ
% for i=2:length(Iavg)-1%�������е�����������
%     for j=2:length(Iavg(2,:))-1
%         x=I2(i-(n-1)/2:i+(n-1)/2,j-(n-1)/2:j+(n-1)/2);%3*3
%         xuint=uint8(model).*uint8(x);
%         x_avg=mean(xuint(:));%������ĵ��ƽ��ֵ
%         Iavg(i,j)=x_avg;%��ֵ
%     end
% end
% figure('name','�Ա�ģ��--��ֵ�˲�'),imshow(Iavg);
% %%�Ա�ģ��--��ֵ�˲�
% n=3;%����Ϊ3
% Imid=I3;%���ô����ͼƬ
% for i=2:length(I1)-1
%     for j=2:length(I1(2,:))-1
%         x=I3(i-(n-1)/2:i+(n-1)/2,j-(n-1)/2:j+(n-1)/2);%3*3
%         x_mid=median(x(:));
%         Imid(i,j)=x_mid;
%     end
% end
% figure('name','�Ա�ģ��--��ֵ�˲�'),imshow(Imid);