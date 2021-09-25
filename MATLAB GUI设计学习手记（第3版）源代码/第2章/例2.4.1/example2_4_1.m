s = {'李某','7','80','90','78'};
xlswrite('chengji.xls',s,1,'A8:E8')   %将李某信息写入Excel
while 1
    str = input('\n请输入学生姓名或学号：(输入quit时退出)\n','s'); 
    %注：书中实例并无“(输入quit时退出)”提示
    if isequal(str,'quit')    %输入quit时退出循环
        break
    end
    str2 = str2double(str);
    [num txt raw] = xlsread('chengji.xls');
    if isnan(str2)  %输入姓名
        n = find(strcmp(txt(2 : end,1),{str}));   %找出是第几个学生
    else    %输入学号
        n = find([raw{2 : end,2}] == str2);   %找出是第几个学生
    end
    if ~isempty(n)
        fprintf(1,'姓名:%s  学号：%d  语文：%d  数学：%d  英语：%d\n',txt{n+1},num(n,:));
    else
        fprintf(1, '找不到该学生，请重新输入！');
    end
end
