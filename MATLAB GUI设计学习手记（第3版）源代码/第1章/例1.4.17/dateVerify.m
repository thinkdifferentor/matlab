function y = dateVerify(str)
% �ú���ʵ���˶������ַ�������Ч����֤����֤ͨ��ʱ����true�����򷵻�false
% ��֤�������£�
% �����ַ�����ʽΪ��YYYYmmdd����YYYY��ʾ�꣬mm��ʾ�£�dd��ʾ��
    y = false;
    if ~ischar(str) %ȷ���������Ϊ�ַ���
        return;
    end
    if isempty(regexp(str, '^\d{8}$', 'once')) %��8λ�������
        return;
    end
    y = strcmp(str, datestr(datenum(str,'YYYYmmdd'), 'YYYYmmdd'));%�ж������Ƿ���Ϲ���
end
