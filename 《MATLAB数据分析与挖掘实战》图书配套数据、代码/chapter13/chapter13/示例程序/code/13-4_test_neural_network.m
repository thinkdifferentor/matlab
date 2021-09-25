%% BP������ģ�Ͳ���
clear;
% ������ʼ��
netfile = '../tmp/net.mat';    % ������ģ�ʹ洢·��
testdatafile = '../data/test_neural_network_data.xls' ; % ����֤���ݴ洢·��
testoutputfile = '../tmp/test_output_data.xls' ; % ��������ģ������ļ�
data=xlsread(testdatafile);   %������֤����
index=5;                       %��ʦ�ź�������
targetoutput=data(:,index);   
 
%% ���������
ywind=6:16;                  %������������
testdata=data(:,ywind)';       %�任��������������ʽ
load(netfile);                 %����ѵ���õ�������ģ��
output=sim(net,testdata);      %����õ�������
%���������
n=length(output);
error=0;
for i=1:n                      %��ÿ��������õ���������ж�
    if(output(i)<=0)           %С�ڵ���0����ʶ��Ϊ��ϴԡ
       output(i)=-1;       
    else
       output(i)=1;            %����0����ʶ��Ϊϴԡ
    end
    if(output(i)~=targetoutput(i)) error=error+1; end  %�����Ƿ����־��¼��һ��
end
disp(['�ô������������ȷ��Ϊ��' num2str(1-error/n)]);

%% д������
output=output';
temp=num2cell(output);
xlswrite(testoutputfile,['ģ�����';temp]);
disp('BP������ģ�Ͳ�����ɣ�');