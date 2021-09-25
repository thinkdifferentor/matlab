%% K-Means�����㷨
clear;
% ������ʼ��
inputfile = '../tmp/zscoreddata.xls';  % ������������ļ���
k=5;                   % ��Ҫ���еľ����������
logfile = '../tmp/log.txt'; % ��־�ļ�

%% ��ȡ���ݲ����о������
[num,txt]=xlsread(inputfile);         % ��ȡ����
% ����k-means�㷨�����о������
% ���У�typeΪÿ��������Ӧ�����ţ�centervecΪ��������������
[type,centervec] = kmeans(num,k);

%% ��������д����־�ļ�
rows = size(centervec,1); 
for i=1:rows
    loginfo= ['�����Ϊ' num2str(i) '�ľ�����������Ϊ��' ...
        num2str(centervec(i,:))];
    log_add(logfile,loginfo);
end

