function y = emailVerify(str)
% �ú���ʵ���˶������ַ�ַ�������Ч����֤����֤ͨ��ʱ����true�����򷵻�false
% ���ߣ��޻���
% �汾��V1.0
% ���ڣ�2014.3
    y = false;
    if ischar(str)  %ȷ���������Ϊ�ַ���
        regStr = ['^([a-zA-Z0-9]+[_-.]?)*[a-zA-Z0-9]+',...%ƥ���ַ���A��������ʽ
        '@([a-zA-Z0-9]+[_-.]?)*[a-zA-Z0-9]+',...%ƥ���ַ���B��������ʽ
        '\.[a-zA-Z]{2,5}$'];%%ƥ���ַ���C��������ʽ
     y = ~isempty(regexp(str, regStr, 'once'));
    end
end
