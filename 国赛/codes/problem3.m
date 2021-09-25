d = 0.2778;
nhalf = 512/2;
xc = -33.5*d;       
yc = 20*d;        % rotation center on square pallet


phantom = load('5.dat');

%���ܼб߿�
phantom = [zeros(100,180); phantom; zeros(100,180)];



% imagesc(A) ������A�е�Ԫ����ֵ����Сת��Ϊ��ͬ��ɫ�������������Ӧλ�ô���������ɫȾɫ
% imagesc(x,y,A) x,y�������귶Χ��x,yӦ��������ά��������x=[x1 x2],y=[y1 y2],matlab����[x1,x2]*[y1,,y2]�ķ�Χ��Ⱦɫ�� 

%����������ͼ
imagesc(phantom)

figure

%�����ʼ���
img = iradon(phantom,[0:179]-90-150);

n = size(img,1);

[x, y] = meshgrid([-n/2:n/2]*d);%100/256

%����ͼ
imagesc(x(1,:), y(:,1), img)


hold on

%λ��
plot(yc,xc,'or')

% �߽续ͼ
xp = [-50  50 50 -50 -50]';
yp = [-50 -50 50  50 -50]';
[xp, yp] = rotxy(xp, yp, -yc, -xc, 0); 
plot(xp,yp,'-w')

axis image