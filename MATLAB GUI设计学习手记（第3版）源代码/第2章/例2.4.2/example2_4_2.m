[nData, strCell] = xlsread('data.xls');                    %读取EXCEL文件
nLines = size(nData, 2);                                      %获取数据的列数
str = input('请输入代码:\n', 's');                             %命令行提示输入关键字，并存入str中
str = upper(str);                                                    %将输入关键字中的小写字母转化为大写字母
while ~strcmp(str, 'Q')                                          %若输入的关键字不是Q或q
    index = strfind(strCell, str);                              %查找关键字，返回包含关键字的行
    if ~isequal(index, cell(size(nData, 1), 1))         %判断index是否为1个6×1的空单元数组
        for i =1 : length(index)                                  %逐行输出包含关键字的行的内容到命令行
            if ~isempty(index{i})
                strFormat = ['代码：%s\n\t' repmat('%8.4f', 1, nLines)];
                str_disp = sprintf(strFormat, strCell{i}, nData(i, :));     %格式化要输出的内容
                disp(str_disp);                                          %显示格式化后的内容
            end
        end
    else
        disp('没有找到相关项的数据');                     %没有超找到满足条件的项
    end
    str = input('请输入代码:\n', 's');                         %循环提示输入关键字
    str = upper(str);                                                    %将输入关键字中的小写字母转化为大写字母
end
