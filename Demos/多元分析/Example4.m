clc,clear
load data3.txt %��ԭʼ��x1,x2,x3,x4,y�����ݱ����ڴ��ı��ļ�data3.txt��
[m,n]=size(data3);
num=3; %numΪѡȡ�����ɷֵĸ���
mu=mean(data3);%��x1,x2,x3,x4,y������ƽ��ֵ(����)
sigma=std(data3);%��x1,x2,x3,x4,y������ƫ�����
snb=zscore(data3); %���ݱ�׼��
b=snb(:,1:end-1); %x1,x2,x3,x4�����ݸ���b
r=cov(b); %��׼�����ݵ�Э������������ϵ����
[x,y,z]=pcacov(r);
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;

%===================��������ͨ����С���˷��ع�=======================
disp('��С���˷��ع�');
r=[ones(m,1),b]\snb(:,end); %��׼�����ݵĻع鷽��ϵ��
bzh=mu./sigma;
ch10=mu(end)-bzh(1:end-1)*r(2:end)*sigma(end) %ԭʼ���ݵĳ�����
fr=r(2:end);fr=fr';
ch1=fr./sigma(1:end-1)*sigma(end) %ԭʼ���ݵ�x1,x2�ȵ�ϵ��


%===================���������ɷֻع�==================================
disp('���ɷֻع�');
pval=b*x(:,1:num);
rp=[ones(m,1),pval]\snb(:,end); %���ɷ����ݵĻع鷽��ϵ��
beta=x(:,1:num)*rp(2:num+1); %��׼�����ݵĻع鷽��ϵ��
ch20=mu(end)-bzh(1:end-1)*beta*sigma(end) %ԭʼ���ݵĳ�����
fr=beta';
ch2=fr./sigma(1:end-1)*sigma(end) %ԭʼ���ݵ�x1,x2�ȵ�ϵ��


%���ݼ���
check1=sqrt(sum((data3(:,1:end-1)*ch1'+ch10-data3(:,end)).^2)/(m-n))
check2=sqrt(sum((data3(:,1:end-1)*ch2'+ch20-data3(:,end)).^2)/(m-num-1))