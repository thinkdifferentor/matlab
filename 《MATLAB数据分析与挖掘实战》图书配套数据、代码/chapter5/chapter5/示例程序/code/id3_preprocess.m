function [ matrix,attributes,activeAttributes ] = id3_preprocess( inputfile )
%% ID3�㷨����Ԥ�������ַ���ת��Ϊ0,1����

% ���������
% inputfile: ���������ļ���

% ���������
% output�� ת�����0,1����
% attributes: ���Ժ�Label��
% activeAttributes : ����������ȫ1��

%% ��ȡ����
[~,txt]=xlsread(inputfile);
attributes=txt(1,2:end);
activeAttributes = ones(1,length(attributes)-1);
data = txt(2:end,2:end);

%% ���ÿ�����ݽ���ת��
[rows,cols] = size(data);
matrix = zeros(rows,cols);
for j=1:cols
    matrix(:,j) = cellfun(@trans2onezero,data(:,j));
end

end

function flag = trans2onezero(data)
    if strcmp(data,'��') ||strcmp(data,'��')...
        ||strcmp(data,'��')
        flag =0;
        return ;
    end
    flag =1;
end
