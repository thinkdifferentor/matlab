[~, ~, raw] = xlsread('data.xls');  %读取EXCEL文件。变量名为~表示程序不使用该变量
ColumnName = raw(1, :);           %获取列名
data = raw(2 : end, :);                 %获取表格数据
for i = 1 : numel(data)                 %遍历表格所有数据项，将Nan项替换为空格字符
    if isnan(data{i})
        data{i} = ' ';
    end
end
h = figure('NumberTitle', 'off', 'Position', [200 200 800 300], 'Name', '例4.3.1示例');
uitable('parent', h, 'ColumnName', ColumnName, 'data', data, 'Units',...
    'normalized', 'Position', [0.1 0.1 0.8 0.8], 'FontSize', 10);  %创建表格
