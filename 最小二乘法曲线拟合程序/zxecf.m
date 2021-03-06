
% 最小二乘法拟合程序说明

% 这是一个集交互式和命令式于一体的一个程序。

% 首先程序提示你输入数据，如果你输入的数据正确，则程序继续进行。

% 如果你输入的x,y的大小不一致，程序会提示你输入数据有误，然后程序返回再次让你输入数据。

%待你输入数据正确后，程序会给你一段提示信息，

    % 通过下面的交互式图形，你可以事先估计一下你要拟合的多项式的阶数，方便下面的计算

    % polytool()是交互式函数,在图形上方[Degree]框中输入阶数,右击左下角的[Export]输出图形

    % 回车打开polytool交互式界面

% 待你回车后，交互式图形界面打开，你可以在图形上方[Degree]框中输入阶数观察多项式拟合的图形,

% 选择置信区间最小的多项式阶数，以便在下面使用。

% 待你选择好所要拟合的多项式阶数后，程序提示你回车继续进行拟合。

% 待你回车后，程序提示你输入拟合的阶数，

% 待你输入拟合的阶数后，回车后会显示拟合多项式相关的数据。

% 最后程序提示你输入所需拟合的数据点，输入所需拟合的数据点，就会得到相应的结果。

% 如果没有所需要拟合的数据点，直接回车跳过。

% 程序结束。
% 最小二乘法多项式拟合

% (1)-----选择拟合多项式拟合的阶数
disp('请以向量的形式输入x,y.')
x=input('x=');
y=input('y=');
nx = length(x);
ny = length(y);
n  = length(x); 
if nx == ny
x1 = x(1); xn = x(n);
% n个数据可以拟合(n-1)阶多项式,高阶多项式多次求导,数值特性变差

disp('通过下面的交互式图形，你可以事先估计一下你要拟合的多项式的阶数，方便下面的计算.')

disp('polytool()是交互式函数,在图形上方[Degree]框中输入阶数,右击左下角的[Export]输出图形')

disp('回车打开polytool交互式界面')

pause;

polytool(x,y,1)

% 观察多项式拟合的图形,选择置信区间最小的多项式阶数

disp('回车继续进行拟合')

pause;

% (2)-----计算多项式的各项系数和拟合值
m=input('    输入多项式拟合的阶数   m = ');
[p,S]=polyfit(x,y,m);
disp '      输出多项式的各项系数'
fprintf (1,'         a = %3.16f \n',p)
disp '      输出多项式的有关信息 S'
disp (S)
[yh,delta]=polyconf(p,x,S);
disp '         观测数据     拟合数据'
disp '       x         y       yh'
for i = 1 : n
   xy = [x(i) y(i) yh(i)];
   disp (xy)
end
% (3)-----绘制观测数据离散点图和多项式曲线

plot(x,y,'r.')

title('\bf 实验数据离散点图  /  多项式曲线 \it y = a0+a1x+a2x^2+a3x^3+...')
grid
hold on; 
xi=[x1:0.1:xn];
yi=polyval(p,xi);
plot(xi,yi,'k-')
% (4)-----拟合效果和精度检验
Q=sum((y-yh).^2);
SGM = sqrt(Q / (n - 2));
RR = sum((yh-mean(y)).^2)/sum((y-mean(y)).^2);
fprintf (1,'      剩余平方和            Q = %3.6f \n',Q)
fprintf ('\n')
fprintf (1,'        标准误差        Sigma = %3.6f \n',SGM)
fprintf ('\n')
fprintf (1,'        相关指数           RR = %3.6f \n',RR)
fprintf ('\n')
disp('请输入你所需要拟合的数据点，若没有请按回车键结束程序.')
fprintf ('\n')
x0=input('    输入插值点             x0 = ');
y0=polyval(p,x0);
fprintf (1,'    输出插值点拟合函数值   y0 = %3.4f \n',y0)
else
disp('输入的数据有误，请重新运行程序并输入正确的数据。')
clear
zxecf
end




