data = {'0-0-0.xls' '1-0-0.xls' '10-0-0.xls' ...
    '11-0-0.xls' '12-0-0.xls' '13-0-0.xls' '14-0-0.xls' ...
    '15-0-0.xls' '16-0-0.xls' '17-0-0.xls' '18-0-0.xls' ...
    '19-0-0.xls' '19-39-52.xls' '2-0-0.xls' '20-0-0.xls' ...
    '21-0-0.xls' '22-0-0.xls' '23-0-0.xls' '23-0-29.xls' ...
    '3-0-0.xls' '4-0-0.xls' '5-0-0.xls' '6-0-0.xls' ...
    '7-0-0.xls' '8-0-0.xls' '9-0-0.xls'};     %ԭʼ���ַ�����Ԫ����
remain = data;                                    %remain���ڱ�����ȡ��ֵ����ַ����������ٴ���ȡ����ʣ�����ֵ
num = zeros(length(data), 3);             %���ڱ���ÿ����ȡ����ֵ
[str_num1, remain] = strtok(remain, '-'); %��ȡ��1����ֵ
num(:, 1) = str2double(str_num1)';
[str_num2, remain] = strtok(remain, '-'); %��ȡ��2����ֵ
num(:, 2) = str2double(str_num2)';
[str_num3, remain] = strtok(remain, '.'); %��ȡ��3����ֵ
num(:, 3) = str2double(str_num3)';
%%%%%%%%����Ϊ����1��ʵ�ִ���%%%%%%%%%%%%%
[num2, index1] = sortrows(num, [1 2 3]); %���ΰ���1�С���2�С���3�е���ֵ��������
data2 = data(index1)
%%%%%%%%����Ϊ����2��ʵ�ִ���%%%%%%%%%%%%%
% num3 = num(:, 1) * 10000 + num(:, 2) * 100 + num(:, 3); %������ֵ��Ȩ�أ��������ֵ
% [num4, index2] = sort(num3);                   %����ֵ����
% data3 = data(index2)                                %��������ַ�����Ԫ����
