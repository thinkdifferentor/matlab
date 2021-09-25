%%% ��������ð���ʽ����ʵ�ֱ��ˮƽ��ͼ��ָ���е�
%%% ��C-V��ģ��(Active contour without edge)
clear all;
close all;
clc;

Img=imread('lena2.jpg');
Img=double(rgb2gray(Img));
% Img=imresize(Img,[80,80]);
figure(1); imshow(uint8(Img));

[nx,ny]=size(Img);
%%- ����ʼ����C����ΪԲ
ic=floor(nx/2);         % �����ʼԲ�����ߵ�Բ��
jc=floor(ny/2);
r=ic/3;                 % Բ�����ߵİ뾶

%%- ��ʼ��uΪ���뺯��
u = zeros([nx,ny]);     
for i=1:nx
    for j=1:ny
        u(i,j)= r-sqrt((i-ic).^2+(j-jc).^2);
    end
end
%%- ����ʼԲ�����ߵ�����ԭʼͼƬ��
figure(2);              
imshow(uint8(Img));
hold on;
[c,h] = contour(u,[0 0],'r');


%%- ��ʼ������
epsilon=1.0;            % Heaviside������������
nu=250;                 
delta_t=0.1;

nn=0;
%%- �������㿪ʼ
for n=1:1000
    %%- �������򻯵�Heavside����
    H_u = 0.5*(1+(2/pi)*atan(u/epsilon));

    %%- �ɵ�ǰu�������c1��c2
    c1=sum(sum(H_u.*Img))/sum(sum(H_u));
    c2=sum(sum((1-H_u).*Img))/sum(sum(1-H_u));

    %%- �ɵ�ǰc1��c2����u
    delta_H = (1/pi)*epsilon./(epsilon^2+u.^2);
    m=delta_t*delta_H;
    C_1 = 1./sqrt(eps+(u(:,[2:ny,ny])-u).^2+0.25*(u([2:nx,nx],:)-u([1,1:nx-1],:)).^2);
    C_2 = 1./sqrt(eps+(u-u(:,[1,1:ny-1])).^2+0.25*(u([2:nx,nx],[1,1:ny-1])-u([1,1:nx-1],[1,1:ny-1])).^2);
    C_3 = 1./sqrt(eps+(u([2:nx,nx],:)-u).^2+0.25*(u(:,[2:ny,ny])-u(:,[1,1:ny-1])).^2);
    C_4 = 1./sqrt(eps+(u-u([1,1:nx-1],:)).^2+0.25*(u([1,1:nx-1],[2:ny,ny])-u([1,1:nx-1],[1,1:ny-1])).^2);
    C = 1+nu*m.*(C_1+C_2+C_3+C_4);
    u = (u+nu*m.*(C_1.*u(:,[2:ny,ny])+C_2.*u(:,[1,1:ny-1])+C_3.*u([2:nx,nx],:)+C_4.*u([1,1:nx-1],:) )+...
        m.*((Img-c2).^2-(Img-c1).^2))./C;

    %%- ��ʾ��ǰ���ߺͷ�Ƭ����ͼ��
    if mod(n,200)==0    
        nn=nn+1
        f=Img;
        f(u>0)=c1;
        f(u<0)=c2;
        figure(2+nn); subplot(1,2,1);imshow(uint8(f));
        subplot(1,2,2); imshow(uint8(Img));
        hold on;
        [c,h] = contour(u,[0 0],'r');
        hold off;
    end
end
