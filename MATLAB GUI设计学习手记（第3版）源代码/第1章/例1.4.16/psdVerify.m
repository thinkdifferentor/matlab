function y = psdVerify(str)
% 该函数实现了对用户名或密码字符串的有效性验证。验证通过时返回true，否则返回false
% 验证规则如下：
% 由英文字母、数字和下划线组成 
% 第1个字符为字母
% 包含6~15个字符
    y = false;
    if ischar(str)  %确保输入参数为字符串
    	y = ~isempty(regexp(str, '^[a-zA-Z]\w{5,15}$', 'once'));
    end
end
