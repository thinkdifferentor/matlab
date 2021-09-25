[~, ~, raw] = xlsread('data.xls');  %��ȡEXCEL�ļ���������Ϊ~��ʾ����ʹ�øñ���
ColumnName = raw(1, :);           %��ȡ����
data = raw(2 : end, :);                 %��ȡ�������
for i = 1 : numel(data)                 %������������������Nan���滻Ϊ�ո��ַ�
    if isnan(data{i})
        data{i} = ' ';
    end
end
h = figure('NumberTitle', 'off', 'Position', [200 200 800 300], 'Name', '��4.3.1ʾ��');
uitable('parent', h, 'ColumnName', ColumnName, 'data', data, 'Units',...
    'normalized', 'Position', [0.1 0.1 0.8 0.8], 'FontSize', 10);  %�������
