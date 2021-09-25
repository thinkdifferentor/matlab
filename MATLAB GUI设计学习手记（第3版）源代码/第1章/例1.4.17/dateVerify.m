function y = dateVerify(str)
% 该函数实现了对日期字符串的有效性验证。验证通过时返回true，否则返回false
% 验证规则如下：
% 日期字符串格式为“YYYYmmdd”，YYYY表示年，mm表示月，dd表示日
    y = false;
    if ~ischar(str) %确保输入参数为字符串
        return;
    end
    if isempty(regexp(str, '^\d{8}$', 'once')) %由8位数字组成
        return;
    end
    y = strcmp(str, datestr(datenum(str,'YYYYmmdd'), 'YYYYmmdd'));%判断日期是否符合规则
end
