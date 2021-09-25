%% arimaʱ��ģ��
clear;

% ������ʼ��
discfile = '../data/arima_data.xls';
forecastnum = 5;
%% ��ȡ����
[num,txt] = xlsread(discfile);
xdata = num; 

%% ʱ��ͼ
figure;plot(xdata);
xx =1:8:length(xdata);
set(gca,'xtick',xx);
set(gca,'xticklabel',txt(xx+1,1));
title('ԭʼ��������ʱ��ͼ');
xlabel('ʱ��');
ylabel('������Ԫ');

%% �����ͼ
figure;autocorr(xdata,12);

%% ƽ���Լ��
data =xdata;
[h,pvalue ,stat,cValue,reg]= adftest(data); 
fprintf('ԭʼ���ݵ�ƽ���Լ���pֵ��%s,stat��%s,cValue:%s,reg:\n',...
    num2str(pvalue),num2str(stat),num2str(cValue));
disp(reg);
disp('reg.tStats��reg.FStat');
disp(reg.tStats);
disp(reg.FStat);

[~,pvalue,stat,cValue ]= lbqtest(data,'lags',6); 
fprintf('ԭʼ���ݵİ���������pֵ��%s,stat��%s,cValue:%s\n',...
    num2str(pvalue),num2str(stat),num2str(cValue));
diffnum = 0; % ��ֵĴ���
while h~=1
    data = diff(data);
   [h,pvalue,stat,cValue,reg] =  adftest(data);
   diffnum=diffnum+1;
end
% ��ӡ���
disp(['ƽ���Լ��pֵΪ��' num2str(pvalue) ',' ...
    num2str(diffnum) '�β�ֺ����й���ƽ��']);
fprintf(',stat��%s,cValue:%s,reg:\n',...
    num2str(stat),num2str(cValue));
disp(reg);
disp('reg.tStats��reg.FStat');
disp(reg.tStats);
disp(reg.FStat);
%% ���������
[~,pvalue ,stat,cValue]= lbqtest(data,'lags',6); 

%% ��ӡ���
fprintf('һ�ײ�ֺ���������pֵΪ��%s,stat��%s,cValue:%s,reg:\n',...
    num2str(pvalue),num2str(stat),num2str(cValue));

if pvalue<0.05
    fprintf('��ʱ������Ϊ�ǰ���������\n');
else
    fprintf('��ʱ������Ϊ����������\n');
end
%% ��ֺ�ʱ��ͼ
figure;plot(data);
xx =1:8:length(data);
set(gca,'xtick',xx);
set(gca,'xticklabel',txt(xx+1,1));
title('�����������ʱ��ͼ');
xlabel('ʱ��');
ylabel('�����вԪ');
%% �����ͼ
figure;autocorr(data,12);
%% ƫ���ͼ
figure;parcorr(data,12);

D=diffnum;
%% ȷ�����p��d,qֵ
% ȷ��p��q����߽״�
length_=length(xdata);
pmin=0;
qmin=0;

pmax=round(length_/10); % һ�����������length/10
qmax=round(length_/10); % һ�����������length/10

%% p��q����
LOGL = zeros(pmax+1,qmax+1); %Initialize
PQ = zeros(pmax+1,qmax+1);

for p = pmin:pmax
    for q = qmin:qmax
        mod = arima(p,D,q);
        fprintf('��ǰp:%d,q:%d',p,q);
        try
            [~,~,logL] = estimate(mod,xdata,'print',false);
        catch
            logL = -realmax;
            fprintf(',*************����!');
        end
        fprintf('\n');
        LOGL(p+1,q+1) = logL;
        PQ(p+1,q+1) = p+q;
     end
end
% ����BIC��ֵ
fprintf('�������');
LOGL = reshape(LOGL,(qmax+1)*(pmax+1),1);
PQ = reshape(PQ,(qmax+1)*(pmax+1),1);
[~,bic] = aicbic(LOGL,PQ+1,length_);
bic=reshape(bic,pmax+1,qmax+1);
disp('bic�����ǣ�');
disp(bic);
% Ѱ����СBICֵ�±�
[bic_min,bic_index]=min(bic);
[bic_min,bic_index_]=min(bic_min);
index = [bic_index(bic_index_)-1,bic_index_-1];
p = index(1,1);
q= index(1,2);
disp(['pֵΪ��' num2str(p) ',qֵΪ��' num2str(q),...
    '��СBICֵΪ:' num2str(bic_min)]);
disp('p��q������ɣ�');

%% ģ�Ͳ�����ӡ���Լ��в�
 mod = arima(p,D,q);
[EstMdl,~,logL] = estimate(mod,xdata,'print',true);
% ����в�
[res,v] = infer(EstMdl,xdata);
stdRes = res./sqrt(v); % ��׼���в�
% �в����������
[h,pvalue ]= lbqtest(res);
if pvalue<0.05
    fprintf('�в�Ϊ�ǰ��������У�pֵΪ��%f \n',pvalue);
else
    fprintf('�в�Ϊ���������У�pֵΪ��%f \n',pvalue);
end

%% ģ��Ԥ��
[ydata] = forecast(EstMdl,forecastnum,'Y0',xdata);
disp('ģ�͵�Ԥ��ֵΪ��');
disp(ydata');