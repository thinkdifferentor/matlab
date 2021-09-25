%便捷作图函数
clear,clc
disp('ezplot 函数:可作匿名函数的图形');
figure ('name','三角函数：cos(x)');
ezplot('cos(x)')


disp('作函数sin(3*t)*cos(t)和sin(3*t)*sin(t)的图像');
figure('name','sin(3*t)*cos(t)和sin(3*t)*sin(t)');
ezplot('sin(3*t)*cos(t)','sin(3*t)*sin(t)')


disp('ezpolar 函数：作极坐标图像');
figure('name','sin(t)/t 极坐标图像');
ezpolar('sin(t)/t',[-6*pi,6*pi]);


disp('ezplot3 函数：作空间立体图像');
figure('name','空间立体图像：cos(t) t*sin(t) sqrt(t)');
ezplot3('cos(t)','t*sin(t)','sqrt(t)',[0,6*pi])


%函数曲面图
disp('ezmesh 函数：作给定区间上的曲面图');
figure('name','曲面图：x*exp(-x^2-y^2)');
ezmesh('x*exp(-x^2-y^2)',[-2 2 -2 2]);

disp('ezcontour 函数:作等高线图');
figure('name','等高线图：x*exp(-x^2-y^2)')
subplot(1,2,1);
ezcontour('x*exp(-x^2-y^2)',[-2 2 -2 2]);
subplot(1,2,2);
ezcontourf('x*exp(-x^2-y^2)',[-2 2 -2 2]);


disp('ezmesh函数作含参变量函数图像：');
figure('name','含参变量函数：exp(-s)+cos(t) exp(-s)*sin(t)');
ezmesh('exp(-s)*cos(t)','exp(-s)*sin(t)','t',[0 8 0 4*pi])

pause();

close all;





