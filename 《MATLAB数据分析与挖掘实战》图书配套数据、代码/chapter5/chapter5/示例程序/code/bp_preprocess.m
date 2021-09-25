function [ matrix,attributes ] = bp_preprocess( inputfile )
%% BP�������㷨����Ԥ�������ַ���ת��Ϊ0,1����

% ���������
% inputfile: ���������ļ���

% ���������
% output�� ת�����0,1����
% attributes: ���Ժ�Label��

%% ��ȡ����
[~,txt]=xlsread(inputfile);
attributes=txt(1,2:end);
data = txt(2:end,2:end);

%% ���ÿ�����ݽ���ת��
[rows,cols] = size(data);
matrix = zeros(rows,cols);
for j=1:cols
    matrix(:,j) = cellfun(@trans2onefalse,data(:,j));
end

end

function flag = trans2onefalse(data)
    if strcmp(data,'��') ||strcmp(data,'��')...
        ||strcmp(data,'��')
        flag =0;
        return ;
    end
    flag =1;
end
