%% ȷ�����p��d,qֵ
clear;

% ������ʼ��
discfile = '../data/discdata_processed.xls';
predictnum =5 ;  % ��������5������
index = 3; % D�������������±�
D= 1 ; % ��ֵĽ״�

%% ��ȡ����
[num,txt] = xlsread(discfile);
xdata = num(1:end-5,index); % ȡǰ5������
% ȷ��p��q����߽״�
length_=length(xdata);
pmin=0;
pmax=round(length_/10); % һ�����������length/10
qmin=0;
qmax=round(length_/10); % һ�����������length/10

%% p��q����
LOGL = zeros(pmax+1,qmax+1); %Initialize
PQ = zeros(pmax+1,qmax+1);

for p = pmin:pmax
    for q = qmin:qmax
        mod = arima(p,D,q);
        [fit,~,logL] = estimate(mod,xdata,'print',false);
        LOGL(p+1,q+1) = logL;
        PQ(p+1,q+1) = p+q;
     end
end
% ����BIC��ֵ
LOGL = reshape(LOGL,(qmax+1)*(pmax+1),1);
PQ = reshape(PQ,(qmax+1)*(pmax+1),1);
[~,bic] = aicbic(LOGL,PQ+1,length_);
bic=reshape(bic,pmax+1,qmax+1);

%% ��ӡ���
% Ѱ����СBICֵ�±�
[bic_min,bic_index]=min(bic);
[bic_min,bic_index_]=min(bic_min);
index = [bic_index(bic_index_)-1,bic_index_-1];
disp(['pֵΪ��' num2str(index(1,1)) ',qֵΪ��' num2str(index(1,2)),...
    '��СBICֵΪ:' num2str(bic_min)]);
disp('p��q������ɣ�');

