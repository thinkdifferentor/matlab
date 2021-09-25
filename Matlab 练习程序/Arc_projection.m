% �����ʵҲ����Բ����ͶӰ�ˣ�������һƪ�����Ǵ����濴���õ�����͹�εĽ����������Ǵӷ��濴���õ����ǰ��εĽ���� 
% ���㹫ʽ�Ͳ�д�ˣ����½���һ�£����㹫ʽ�й���x�����󷨺���ƪһ����y��������������ƪ��ʽ�ķ��任�������ƪ��ʽ����ͱ�ƪ�Ĵ��룬Ӧ�ö����Ǻ������ġ�

clear all; close all;clc;

img=imread('lena.jpg');
[h,w]=size(img);

hfOV=pi/2;     %��ȡ����Ϊ(0,pi)
f=w/(2*tan(hfOV/2));

x1=0;
x2=floor(2*f*atan(w/(2*f)));
y1=floor(h/2-h*(sqrt((w/2)^2+f^2))/(2*f));
y2=floor(h/2+h*(sqrt((w/2)^2+f^2))/(2*f));

newh=y2-y1;       
neww=x2-x1;
imgn=zeros(newh,neww);
for i=1+y1:newh+y1
    for j=1:neww
       
       %���任��ʽ��Ӧ��
       x=floor(f*tan(j/f-atan(w/(2*f)))+w/2);          
       y=floor(h/2+f*(i-h/2)/sqrt(f^2+(w/2-x)^2)); 
            
        if x>=1 && x<=w && y>=1 && y<=h
            imgn(i-y1,j)=img(y,x);
        end       
        
    end
end

imshow(img);
figure;
imshow(imgn,[]);