%% ���ݿ�ȱֵ̽��,������ַ����򷵻�ȱʧֵ������
%  �������ֵ�ͷ���ȱʧֵ�����Լ������Сֵ
clear;
% ������ʼ��
datafile= '../data/air_data.csv' ; % ����ԭʼ����,��һ��Ϊ���Ա�ǩ
logfile = '../tmp/log.txt'; % ��־�ļ�
resultfile = '../tmp/explore.xls'; % ����̽�������

%% ��ȡ����
[num,txt] = xlsread(datafile);
[rows,cols] = size(num);
% ��ʼ�� �������
results = cell(5,cols+1);
result = zeros(4,cols);
results(:,1)= {'����';'�ռ�¼��';'ȱʧ��';'���ֵ';'��Сֵ'};
results(1,2:end)=txt(1,:);
% ��¼��־
log_add(logfile,['�ļ�' datafile 'һ����' num2str(rows) ...
     '����¼']);
 
%% ���������У����п�ȱ�ж�
for i= 1: cols
    % �ж�txtÿ�дӵڶ��п�ʼ ���Ƿ��ǿմ�
    empty_sum = sum(cellfun(@isempty,txt(2:end,i))); % ����ǿմ�����empty_sum==rows,��Ϊ��ֵ�� 
    if empty_sum==rows  % ����Ϊ��ֵ��
        min_ = min(num(:,i)); % ��Сֵ
        max_ = max(num(:,i)); % ���ֵ
        nan_sum = sum(isnan(num(:,i)));
        nan_rate = nan_sum/rows; % ȱʧ��
        loginfo=['������' txt{1,i} '����ֵ�ͣ������ֵΪ'...
             num2str(max_) ',��СֵΪ' num2str(min_) ...
             ',ȱʧֵ����Ϊ' num2str(nan_sum) '����ȱʧ��Ϊ' ...
             num2str(nan_rate)];
        log_add(logfile,loginfo);
%         if nan_sum~=0
%             disp(loginfo);
%         end
        result(1,i)=nan_sum;
        result(2,i)=nan_rate;
        result(3,i)=max_;
        result(4,i)=min_;
        
    else       % ����Ϊ�ַ����ͣ������ж�txt
        [emptynum,emptyrate]= find_empty(txt(2:end,i));
        loginfo=['������' txt{1,i} '���ַ����ͣ�ȱʧֵ����Ϊ' ...
            num2str(emptynum) '����ȱʧ��Ϊ' ...
             num2str(emptyrate)];
          log_add(logfile,loginfo);
%          if emptynum~=0
%             disp(loginfo);
%          end
        result(1,i)=nan_sum;
        result(2,i)=nan_rate;
    end
end 
 
%% д������̽�����
results(2:end,2:end)=num2cell(result);
xlswrite(resultfile,results');

disp('����������ɣ�');