% 表 15 灰色模型精度检验等级
% 指 标 等 级
% 相对误差 Δ 绝对关联度 g 0 均方差比值 C0 小误差概率 p0
% 一 0.01 0.90 0.35 0.95
% 二 0.05 0.80 0.50 0.80
% 三 0.10 0.70 0.65 0.70
% 四 0.20 0.60 0.80 0.60



% Verhulst 灰色系统预测模型
clc,clear
x1=[4.93 5.33 5.87 6.35 6.63 7.15 7.37 7.39 7.81 8.35 9.39 10.59 10.94 10.44];
n=length(x1);
nian=1990:2003;
%绘制原始数据趋势图
plot(nian,x1,'o-');
x0=diff(x1);
x0=[x1(1),x0];
for i=2:n
    z1(i)=0.5*(x1(i)+x1(i-1));
end
z1;
B=[-z1(2:end)',z1(2:end)'.^2];
Y=x0(2:end)';
abhat=B\Y; %估计参数 a,b 的值
x=dsolve('Dx+a*x=b*x^2','x(0)=x0'); %求解常微分方程
x=subs(x,{'a','b','x0'},{abhat(1),abhat(2),x1(1)}); %代入参数值
yuce=subs(x,'t',0:14); %计算预测值
digits(6); x=vpa(x); %显示微分方程的解，为了提高计算精度，把该语句放在计算预测值之后，或者不使用该语句
yuce(16)=yuce(15);
x1_all=[x1,9.92,10.71];
epsilon=x1_all-yuce; %计算残差
delta=abs(epsilon./x1_all); %计算相对误差
delta_mean=mean(delta); %计算平均相对误差
x1_all_0=x1_all-x1_all(1); %数据列的始点零化像
yuce_0=yuce-yuce(1); %数据列的始点零化像
s0=abs(sum(x1_all_0(1:end-1))+0.5*x1_all_0(end));
s1=abs(sum(yuce_0(1:end-1))+0.5*yuce_0(end));
tt=yuce_0-x1_all_0;
s1_s0=abs(sum(tt(1:end-1))+0.5*tt(end));
absdegree=(1+s0+s1)/(1+s0+s1+s1_s0); %计算灰色绝对关联度
c=std(epsilon,1)/std(x1_all,1); %计算标准差比值


disp('预测值:');
yuce

disp('残差:');
epsilon

disp('相对误差:');
delta

disp('平均相对误差:');
delta_mean

disp('灰色绝对关联度:');
absdegree

disp('标准差比值:');
c







