clc,clear
load data3.txt %把原始的x1,x2,x3,x4,y的数据保存在纯文本文件data3.txt中
[m,n]=size(data3);
num=3; %num为选取的主成分的个数
mu=mean(data3);%求x1,x2,x3,x4,y的数据平均值(按列)
sigma=std(data3);%求x1,x2,x3,x4,y的数据偏差计算
snb=zscore(data3); %数据标准化
b=snb(:,1:end-1); %x1,x2,x3,x4的数据赋给b
r=cov(b); %标准化数据的协方差阵就是相关系数阵
[x,y,z]=pcacov(r);
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;

%===================以下是普通的最小二乘法回归=======================
disp('最小二乘法回归');
r=[ones(m,1),b]\snb(:,end); %标准化数据的回归方程系数
bzh=mu./sigma;
ch10=mu(end)-bzh(1:end-1)*r(2:end)*sigma(end) %原始数据的常数项
fr=r(2:end);fr=fr';
ch1=fr./sigma(1:end-1)*sigma(end) %原始数据的x1,x2等等系数


%===================以下是主成分回归==================================
disp('主成分回归');
pval=b*x(:,1:num);
rp=[ones(m,1),pval]\snb(:,end); %主成分数据的回归方程系数
beta=x(:,1:num)*rp(2:num+1); %标准化数据的回归方程系数
ch20=mu(end)-bzh(1:end-1)*beta*sigma(end) %原始数据的常数项
fr=beta';
ch2=fr./sigma(1:end-1)*sigma(end) %原始数据的x1,x2等等系数


%数据检验
check1=sqrt(sum((data3(:,1:end-1)*ch1'+ch10-data3(:,end)).^2)/(m-n))
check2=sqrt(sum((data3(:,1:end-1)*ch2'+ch20-data3(:,end)).^2)/(m-num-1))