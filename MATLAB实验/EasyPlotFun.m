%�����ͼ����
clear,clc
disp('ezplot ����:��������������ͼ��');
figure ('name','���Ǻ�����cos(x)');
ezplot('cos(x)')


disp('������sin(3*t)*cos(t)��sin(3*t)*sin(t)��ͼ��');
figure('name','sin(3*t)*cos(t)��sin(3*t)*sin(t)');
ezplot('sin(3*t)*cos(t)','sin(3*t)*sin(t)')


disp('ezpolar ��������������ͼ��');
figure('name','sin(t)/t ������ͼ��');
ezpolar('sin(t)/t',[-6*pi,6*pi]);


disp('ezplot3 ���������ռ�����ͼ��');
figure('name','�ռ�����ͼ��cos(t) t*sin(t) sqrt(t)');
ezplot3('cos(t)','t*sin(t)','sqrt(t)',[0,6*pi])


%��������ͼ
disp('ezmesh �����������������ϵ�����ͼ');
figure('name','����ͼ��x*exp(-x^2-y^2)');
ezmesh('x*exp(-x^2-y^2)',[-2 2 -2 2]);

disp('ezcontour ����:���ȸ���ͼ');
figure('name','�ȸ���ͼ��x*exp(-x^2-y^2)')
subplot(1,2,1);
ezcontour('x*exp(-x^2-y^2)',[-2 2 -2 2]);
subplot(1,2,2);
ezcontourf('x*exp(-x^2-y^2)',[-2 2 -2 2]);


disp('ezmesh���������α�������ͼ��');
figure('name','���α���������exp(-s)+cos(t) exp(-s)*sin(t)');
ezmesh('exp(-s)*cos(t)','exp(-s)*sin(t)','t',[0 8 0 4*pi])

pause();

close all;





