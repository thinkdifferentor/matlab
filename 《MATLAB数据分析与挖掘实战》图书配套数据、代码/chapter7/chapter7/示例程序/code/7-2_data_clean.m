%% ������ϴ�����˵������Ϲ��������
clear;
% ������ʼ��
datafile = '../data/air_data.csv';  % �����ļ�
cleanedfile = '../tmp/data_cleaned.csv';  % ������ϴ�󱣴���ļ�

%% ��ϴ��ֵ�Ͳ������������
[num,txt]=xlsread(datafile);     
[row,col]=size(txt);

% ��������
for i=1:col
    % �ж�txtÿ�дӵڶ��п�ʼ ���Ƿ��ǿմ�
    empty_sum = sum(cellfun(@isempty,txt(2:end,i))); % ����ǿմ�����empty_sum==row-1,��Ϊ��ֵ�� 
    if empty_sum == row-1
       txt(2:end,i)=num2cell(num(:,i)); % ����ֵ��תΪcell���ͣ������� 
    end
%     if mod(i,500)==0
%        disp(['����������' num2str(i) '����¼...']); 
%     end
end
disp(['����ǰ������' num2str(size(txt,1))]);

% ��ʼ������
txt_copy=[];
rule1_sum =0;
rule2_sum =0;

% ���ݹ���
for i=2:row   % �ӵڶ��������п�ʼ�ж�
    % �ж�ÿһ�������Ƿ���Ϲ�������filter_dataΪ�Զ��庯����
    % ������ݷ���Ҫ���򷵻�1�����򷵻�0
    [filterflag,rule1_sum,rule2_sum] = filter_data(txt(i,:),rule1_sum,rule2_sum);
    if filterflag ==0  %  ����Ҫ��,ɾ��
        txt_copy=[txt_copy,i];  % �������
    end
%     if mod(i,500)==0
%        disp(['�ѹ�������' num2str(i) '����¼...']); 
%     end
end
txt(txt_copy,:)=[];
disp(['���˺�������' num2str(size(txt,1)-1) '������1���˼�¼����' num2str(rule1_sum) ...
    '����2���˵ļ�¼����' num2str(rule2_sum)]);

%% д����˺������
xlswrite(cleanedfile,txt);  % д�������ļ�

