function y = str2poly(x)
%把多项式的字符串表示转换为行向量表示。假定自变量为x
%x是字符串形式的多项式
%y是行向量形式的多项式
% 作者：罗华飞
% 版本： V1.2
% 时间：2014.8.18
%输入格式检查
    if(~ischar(x))   
            errordlg('输入错误：输入必须是一个字符串！');
            return;
    end;
    x = regexprep(x, '[ |*]', ''); %去除空格、*号
    tmp = regexp(x,'(?<=(x\^))\d+(?=[+-])', 'match'); %提取幂次
    n = str2double(tmp);
    len = max(n) + 1;
    y = zeros(1, len);
    tmp = regexp(x, '[+-]?\d*x', 'match'); %提取系数
    for i = 1 : length(tmp)
        if (strcmp(tmp{i}, 'x')) || (strcmp(tmp{i}, '+x'))
            tmp{i} = '1';
        elseif strcmp(tmp{i}, '-x')
            tmp{i} = '-1';
        else
            tmp{i} = tmp{i}(1:end-1);
        end
    end 
    factor = str2double(tmp);
    for(m = 1 : length(n)) %matlab支持采用括号分隔关键字的语法结构
       y(n(m)+1) = factor(m);%根据幂次和系数，获得矩阵向量
    end
    if(length(n) == length(factor) - 1)%1次幂单独处理
        y(2) = factor(end);
    end
    tmp = str2double(regexp(x,'[+-]\d+$','match'));%提取0次幂
    if ~isnan(tmp)
        y(1) = tmp;
    end    
    y = fliplr(y);
end
