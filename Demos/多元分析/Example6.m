% ĳ���鹫˾��һ���������۹�˾��������� 784 �ˣ������� 5 ��ְҵ����ָ��� 7
% ��ְҵ����������йصı������� 19����������ָ��֮���Ƿ�����ϵ
% X ��
% x1 ? �û������� x2 ? ������Ҫ�ԣ� x3 ? ��������ԣ� x4 ? ����������
% ?
% x5 ������
% Y ��
% y1 ? ��������ȣ� y2 ? ��ҵǰ������ȣ� y3 ? ��������ȣ� y4 ? ����ǿ�������
% ?
% y5 ��˾��λ����ȣ� y6 ? ��������ȣ� y7 ? ���������


clc,clear
load data4.txt %ԭʼ�����ϵ�����󱣴��ڴ��ı��ļ�da.txt��
%rΪ���ϵ������
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
%����������������һ��������a's1a=1
gu1=x1'*s1*x1;
gu1=sqrt(diag(gu1)); %��������ϵ��
gu1=gu1'.*sign(sum(x1)); %ÿ������������������Ϊ��
gu1=repmat(gu1,length(gu1),1);
a=x1./gu1;
y1=diag(y1); %ȡ������ֵ
[y1,ind1]=sort(y1,'descend'); %����ֵ���մӴ�С����
a=a(:,ind1(1:num)) %ȡ��X���ϵ����
y1=sqrt(y1(1:num)) %����������ϵ��
flag=1;
% xlswrite('bk1.xls',a,'Sheet1','A1') %�Ѽ�����д��Excel�ļ���ȥ
flag=n1+2;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y1','Sheet1',str)
[x2,y2]=eig(m2);
%����������������һ��������b's2b=1
gu2=x2'*s2*x2;
gu2=sqrt(diag(gu2));
gu2=gu2'.*sign(sum(x2));
gu2=repmat(gu2,length(gu2),1);
b=x2./gu2;
y2=diag(y2);
[y2,ind2]=sort(y2,'descend');
b=b(:,ind2(1:num))
y2=sqrt(y2(1:num)) %����������ϵ��
flag=flag+2;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',b,'Sheet1',str)
flag=flag+n2+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y2','Sheet1',str)
x_u_r=s1*a; %x,u�����ϵ��
x_u_r=x_u_r(:,1:num)
flag=flag+2;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',x_u_r,'Sheet1',str)
y_v_r=s2*b; %y,v�����ϵ��
y_v_r=y_v_r(:,1:num)
flag=flag+n1+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y_v_r,'Sheet1',str)
x_v_r=s12*b; %x,v�����ϵ��
x_v_r=x_v_r(:,1:num)
flag=flag+n2+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',x_v_r,'Sheet1',str)
y_u_r=s21*a; %y,u�����ϵ��
y_u_r=y_u_r(:,1:num)
flag=flag+n1+1;
str=char(['A',int2str(flag)]);
% xlswrite('bk1.xls',y_u_r,'Sheet1',str)
mu=sum(x_u_r.^2)/n1 %x��ԭʼ������u_i���͵ķ������
mv=sum(x_v_r.^2)/n1 %x��ԭʼ������v_i���͵ķ������
nu=sum(y_u_r.^2)/n2 %y��ԭʼ������u_i���͵ķ������
nv=sum(y_v_r.^2)/n2 %y��ԭʼ������v_i���͵ķ������
