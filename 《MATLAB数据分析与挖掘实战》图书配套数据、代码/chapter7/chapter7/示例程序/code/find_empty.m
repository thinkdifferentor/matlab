function [ emptynum,emptyrate ] = find_empty( input )
%% cell�������в����ַ���Ϊ�յĸ����Լ�����
% ���������
% input��cell��������

% ���������
% emptynum�� ���ַ���������
% emptyrate: ���ַ������ʣ�

rows = size(input,1);
emptynum=sum(cellfun(@isempty,input));
% 
% for i= 1:rows
%    if isempty(input{i,1})
%         emptynum=emptynum+1;
%    end
% end
emptyrate = emptynum/rows;

end

