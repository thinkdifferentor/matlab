function  [filterflag,rule1_sum,rule2_sum] = filter_data(txtdata,rule1_sum,rule2_sum)
%% ���ݹ��˹��򷵻��Ƿ���Ϲ�������
% Ʊ��Ϊ�յ����ݣ�SUM_YR_1���±�15�� ��SUM_YR_2���±�16�� ��һΪ��
% Ʊ��Ϊ0��ƽ���ۿ��ʲ�Ϊ0���ܷ��й���������0������ 
% SUM_YR_1���±�15�� ��SUM_YR_2���±�16�� ��Ϊ��
% AVG_DISCOUNT ���±�Ϊ29��������0
% SEG_KM_SUM ���±�Ϊ17�������㣻

% ���������
% txtdata�� һ�����ݣ�cell������
% rule1_sum : ����һ���˵ļ�¼��
% rule2_sum : ��������˵ļ�¼��

% ������ݣ�
% filterflag��0�����ݲ�����Ҫ��1:���ݷ���Ҫ��
% rule1_sum : ����һ���˵ļ�¼��
% rule2_sum : ��������˵ļ�¼��

%% ���� 
index_15 = txtdata{1,15};
index_16 = txtdata{1,16};

% ��һ����������
if isnan(index_15)||isnan(index_16)||isempty(index_15) || isempty(index_16)
    filterflag =0;
    rule1_sum=rule1_sum+1;
    return; 
end
% �ڶ�����������
index_17 = txtdata{1,17};
index_29 = txtdata{1,29};

if index_15==0 && index_16==0
    if index_17>0 && index_29~=0
       filterflag=0;
       rule2_sum=rule2_sum+1;
       return;
    end
end
filterflag=1;