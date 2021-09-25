%% ��ֵѰ��
clear;
inputfile='../data/water_heater.xls';           % inputfile����������·��,��Ҫʹ��Excel��ʽ��

%% ��������
[~, ~, data]=xlsread(inputfile);

%% ���ݲ�ͬ��ֵ���õ���ˮ���ֽ��
threshold_best=0;
disp('������ˮ�¼���......');
h = 2:0.25:8; % ������2-8��������һ��������ֵ
cols = size(h,2);
t = zeros(cols,3);
for i=1:cols                       
    dividsequence=divide_event_for_optimization(h(1,i),data);
    n=size(dividsequence,1);        % �¼�����
    t(i,1)=h(1,i);  
    t(i,2)=n;    
end       

%% �����ó�2-8���ӣ���ͬ��ֵ���¼������󣬿�ʼ�����ŵ���ֵ
disp('��ֵѰ����......');
threshold_n=size(t,1);      %threshold_n��¼̽Ѱ����ֵ����
for i=1:threshold_n-4
    t(i,3)=(abs((t(i+1,2)-t(i,2))/0.25)+abs((t(i+2,2)-t(i,2))/0.5)...
        +abs((t(i+3,2)-t(i,2))/0.75)+abs((t(i+4,2)-t(i,2))/1))/4;
    %t(i,3)������¼ÿ����ֵ��Ӧ��ƽ��б��
    if(t(i,3)<=1)   
        threshold_best=t(i,1);   
        break;   
    end    %�ҵ��ǰ�����ŵ�ֵ
end
if(threshold_best==0)                          %���û�ҵ����ŵ���ֵ�������Ĭ��ֵ4���ӻ���ȡ��С��
    [threshold_best,threshold_index]=min(t(1:threshold_n-4,3));
    if(threshold_best>=5)
        threshold_best=4;
        disp('here...');
    else
        threshold_best=t(threshold_index,1);
    end
end

%% ��ӡ���
disp(['������ֵΪ��' num2str(threshold_best) '����']);
