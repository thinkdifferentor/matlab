% 气象站预报有无春旱的实际资料， x1 与 x2 都是综合预报因子（气
% 象含义从略），有春旱的是 6 个年份的资料，无春旱的是 8 个年份的资料，它们的先验
% 概率分别用 6 /14 和8 /14 来估计， 并设误判损失相等， 试建立 Anderson 线性判别函数。



clc,clear
a=[24.8 24.1 26.6 23.5 25.5 27.4
-2.0 -2.4 -3.0 -1.9 -2.1 -3.1]';

b=[22.1 21.6 22.0 22.8 22.7 21.5 22.1 21.4
-0.7 -1.4 -0.8 -1.6 -1.5 -1.0 -1.2 -1.3]';
n1=6;n2=8;
mu1=mean(a);mu2=mean(b);
mu1=mu1';
mu2=mu2';
s1=(n1-1)*cov(a);
s2=(n2-1)*cov(b);
sigma2=(s1+s2)/(n1+n2-2);
beta=log(8/6);
syms x1 x2
x=[x1;x2];
disp('Anderson 线性判别函数:');
wx=(x-0.5*(mu1+mu2)).'*inv(sigma2)*(mu1-mu2);
digits(6);
wx=vpa(wx);

%原始数据代入判别函数验证判别函数的准确度
ahat=subs(wx,{x1,x2},{a(:,1),a(:,2)})
bhat=subs(wx,{x1,x2},{b(:,1),b(:,2)})

% 历史资料的拟合率达 93%




% 下面我们编写Σ1 ≠ Σ2 情形下的 MATLAB 程序：
clc,clear
p1=6/14;p2=8/14;
a=[24.8 24.1 26.6 23.5 25.5 27.4
-2.0 -2.4 -3.0 -1.9 -2.1 -3.1]';
b=[22.1 21.6 22.0 22.8 22.7 21.5 22.1 21.4
-0.7 -1.4 -0.8 -1.6 -1.5 -1.0 -1.2 -1.3]';

n1=6;n2=8;

mu1=mean(a);mu2=mean(b);
mu1=mu1';
mu2=mu2';
cov1=cov(a);
cov2=cov(b);
k=log(p2/p1)+0.5*log(det(cov1)/det(cov2))+0.5*(mu1'*inv(cov1)*mu1-mu2'*inv(cov2)*mu2)
syms x1 x2
x=[x1;x2];
wx=-0.5*x.'*(inv(cov1)-inv(cov2))*x+(mu1'*inv(cov1)-mu2'*inv(cov2))*x;
digits(6);
wx=vpa(wx);
wx=simple(wx)

%原始数据代入判别函数验证判别函数的准确度
ahat=subs(wx,{x1,x2},{a(:,1),a(:,2)})
bhat=subs(wx,{x1,x2},{b(:,1),b(:,2)})

%数据比较--输出表示数据相等
ahat>=k
bhat<k

%历史资料的拟合率达 100％



clc 
clear

%训练数据
train=[9 7 8 8 9 8 7 4 3 6 2 1
8 6 7 5 9 9 5 4 6 3 4 2
7 6 8 5 3 7 6 4 6 3 5 2]';

%等判断的数据
sample=[6 4 5];
group=[ones(7,1);2*ones(5,1)];

%利用马氏距离分类
[x1,y1]=classify(sample,train,group,'mahalanobis');
x1
%线性分类方法
[x2,y2]=classify(sample,train,group,'linear');
x2
% 求得利用马氏距离和线性分类方法都把新厂家分在第一类。
