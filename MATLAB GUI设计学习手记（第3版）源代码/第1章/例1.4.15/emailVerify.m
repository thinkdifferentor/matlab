function y = emailVerify(str)
% 该函数实现了对邮箱地址字符串的有效性验证。验证通过时返回true，否则返回false
% 作者：罗华飞
% 版本：V1.0
% 日期：2014.3
    y = false;
    if ischar(str)  %确保输入参数为字符串
        regStr = ['^([a-zA-Z0-9]+[_-.]?)*[a-zA-Z0-9]+',...%匹配字符串A的正则表达式
        '@([a-zA-Z0-9]+[_-.]?)*[a-zA-Z0-9]+',...%匹配字符串B的正则表达式
        '\.[a-zA-Z]{2,5}$'];%%匹配字符串C的正则表达式
     y = ~isempty(regexp(str, regStr, 'once'));
    end
end
