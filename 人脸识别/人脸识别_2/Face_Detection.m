%-------------------------------------------------------------------------------------------------------%
%���ļ����ܣ�����Imreads1()ʱ���ɶ���һ���ļ���������ͼƬ����PCA������
%����'\����ƥ�����\'�ļ����ڵ�10.pgm����ƥ��ʱ����ƥ�����˵��PCA
%����������ȫ�ɿ�������Imreads2()ʱ���ɶ������ļ����ڵ�����ͼƬ����
%PCA�������ֶ�����'\find_faces\'�ļ����ڵ�ͼƬ����ƥ�䡣
%-------------------------------------------------------------------------------------------------------%
clc,clear,close all
%% Ҫ��ͨ���������������½����¿ռ��ȥ��һ�µ����β�����load
P=0.99;  %PCA������
type='*.pgm';
Ipath='C:\Users\user\Desktop\��ҵ���\��+��ʶ��\����ʶ��_�� - ����\orl_faces\';  %ע��·�������һ��\
%lpath='C:\Users\user\Desktop\��ҵ���\��+��ʶ��\����ʶ��_��\����ƥ���������\s10\';  %����Imreads1()ʱ
Image=Imreads2(Ipath,type);     %�������ļ����µ�����ͼƬ
n=size(Image,1)*size(Image,2);     %����ͼƬ����
%Image=Imreads1(lpath,type);
%n=length(Image);  %����Imreads1()ʱ
for ii=1:n
    X(:,ii)=Image{ii}(:);  %��ÿ������ת����������
   % subplot(3,4,ii);imshow(Image{ii});title(ii);  %������ʾ����ͼƬ
end
averageface=1/n*sum(X')'; %ƽ����  ave_fac ��������
X=double(X);
for i=1:n
    A(:,i)=X(:,i)-averageface; %ÿ��ͼ��-ƽ��ͼ��ƽ������
end
[V,D]=eig(A'*A);  %V����ֵ��D��������
[V_over,D_over]=reorder_cart(P,V,D);    %������ֵ���������ҳ�ǰN���ĺ͸���
u=A*V_over;                                                 %����P������ֵ�����Ӧ����������
for jj=1:size(D_over,2)
    u(:,jj)=1./sqrt(D_over(jj))*u(:,jj);  %ԭ������������u(i)=1/sqrt(��(i))Av(i)
end                                                   %u�����¿ռ�ı任��
Y=u'*A;  %�¿ռ����������ݣ��������ռ䣩
Y_=zeros(n,n);
for ii=1:n
    for jj=1:n
        y_=Y(:,ii)-Y(:,jj);
        Y_(ii,jj)=norm(y_);   %��ģ
    end
end

[filename,filepath]=uigetfile('*.pgm','�������ͼ��','10');  %�ֶ����������ͼƬ
Image_in=imread([filepath,filename]);
%Image_in=imread('C:\Users\user\Desktop\��ҵ���\��+��ʶ��\����ʶ��2\find_faces\20.pgm');
figure;imshow(Image_in);title('Ҫ���ҵ�����');
Image_in=double(Image_in(:));  %ת��Ϊ������
Image_x=Image_in-averageface;
Y_in=u'*(Image_x);  %��������¿ռ��ͶӰ
n=size(Image,1)*size(Image,2);   %����ͼƬ����
for ii=1:n
distance(ii)=norm(Y(:,ii)-Y_in);  %��ȡ���������������ռ������������ľ���
end
[value,num]=min(distance);    
figure;imshow(Image{num});title('�ҵ�������');
disp([num2str(value)]);       %������������ҵ������Ĳ�ֵ���ҵ���ͼƬ���
disp([num2str(num)]);
