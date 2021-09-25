% 某调查公司从一个大型零售公司随机调查了 784 人，测量了 5 个职业特性指标和 7
% 个职业满意变量，有关的变量见表 19。讨论两组指标之间是否相联系
% X 组
% x1 ? 用户反馈， x2 ? 任务重要性， x3 ? 任务多样性， x4 ? 任务特殊性
% ?
% x5 自主性
% Y 组
% y1 ? 主管满意度， y2 ? 事业前景满意度， y3 ? 财政满意度， y4 ? 工作强度满意度
% ?
% y5 公司地位满意度， y6 ? 工作满意度， y7 ? 总体满意度


clc,clear
load data4.txt %原始的相关系数矩阵保存在纯文本文件da.txt中
%r为相关系数矩阵
r=data4;
n1=5;n2=7;
num=min(n1,n2);
s1=r(1:n1,1:n1);
s12=r(1:n1,n1+1:end);
s21=s12';
s2=r(n1+1:end,n1+1:end);
m1=inv(s1)*s12*inv(s2)*s21;
m2=inv(s2)*s21*inv(s1)*s12;
[x1,y1]=eig(m1);
%以下是特征向量归一化，满足a's1a=1
gu1=x1'*s1*x1;
gu1=sqrt(diag(gu1)); %求典型相关系数
gu1=gu1'.*sign(sum(x1)); %每个特征向量的最大分量为正
gu1=repmat(gu1,length(gu1),1);
a=x1./gu1;
y1=diag(y1); %取出特征值
[y1,ind1]=sort(y1,'descend'); %特征值按照从大到小排列
a=a(:,ind1(1:num)) %取出X组的系数阵
y1=sqrt(y1(1:num)) %计算典型相关系数
flag=1;
% xlswrite('bk1.xls',a,'Sheet1','A1') %把计算结果写到Excel文件中去
flag=n1+2;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y1','Sheet1',str)
[x2,y2]=eig(m2);
%以下是特征向量归一化，满足b's2b=1
gu2=x2'*s2*x2;
gu2=sqrt(diag(gu2));
gu2=gu2'.*sign(sum(x2));
gu2=repmat(gu2,length(gu2),1);
b=x2./gu2;
y2=diag(y2);
[y2,ind2]=sort(y2,'descend');
b=b(:,ind2(1:num))
y2=sqrt(y2(1:num)) %计算典型相关系数
flag=flag+2;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',b,'Sheet1',str)
flag=flag+n2+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y2','Sheet1',str)
x_u_r=s1*a; %x,u的相关系数
x_u_r=x_u_r(:,1:num)
flag=flag+2;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',x_u_r,'Sheet1',str)
y_v_r=s2*b; %y,v的相关系数
y_v_r=y_v_r(:,1:num)
flag=flag+n1+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y_v_r,'Sheet1',str)
x_v_r=s12*b; %x,v的相关系数
x_v_r=x_v_r(:,1:num)
flag=flag+n2+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',x_v_r,'Sheet1',str)
y_u_r=s21*a; %y,u的相关系数
y_u_r=y_u_r(:,1:num)
flag=flag+n1+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y_u_r,'Sheet1',str)
mu=sum(x_u_r.^2)/n1 %x组原始变量被u_i解释的方差比例
mv=sum(x_v_r.^2)/n1 %x组原始变量被v_i解释的方差比例
nu=sum(y_u_r.^2)/n2 %y组原始变量被u_i解释的方差比例
nv=sum(y_v_r.^2)/n2 %y组原始变量被v_i解释的方差比例
