data = {'0-0-0.xls' '1-0-0.xls' '10-0-0.xls' ...
    '11-0-0.xls' '12-0-0.xls' '13-0-0.xls' '14-0-0.xls' ...
    '15-0-0.xls' '16-0-0.xls' '17-0-0.xls' '18-0-0.xls' ...
    '19-0-0.xls' '19-39-52.xls' '2-0-0.xls' '20-0-0.xls' ...
    '21-0-0.xls' '22-0-0.xls' '23-0-0.xls' '23-0-29.xls' ...
    '3-0-0.xls' '4-0-0.xls' '5-0-0.xls' '6-0-0.xls' ...
    '7-0-0.xls' '8-0-0.xls' '9-0-0.xls'};     %原始的字符串单元数组
remain = data;                                    %remain用于保存提取数值后的字符串，用于再次提取其中剩余的数值
num = zeros(length(data), 3);             %用于保存每次提取的数值
[str_num1, remain] = strtok(remain, '-'); %提取第1组数值
num(:, 1) = str2double(str_num1)';
[str_num2, remain] = strtok(remain, '-'); %提取第2组数值
num(:, 2) = str2double(str_num2)';
[str_num3, remain] = strtok(remain, '.'); %提取第3组数值
num(:, 3) = str2double(str_num3)';
%%%%%%%%以下为方法1的实现代码%%%%%%%%%%%%%
[num2, index1] = sortrows(num, [1 2 3]); %依次按第1列、第2列、第3列的数值进行排序
data2 = data(index1)
%%%%%%%%以下为方法2的实现代码%%%%%%%%%%%%%
% num3 = num(:, 1) * 10000 + num(:, 2) * 100 + num(:, 3); %根据数值的权重，获得新数值
% [num4, index2] = sort(num3);                   %新数值排序
% data3 = data(index2)                                %获得最终字符串单元数组
