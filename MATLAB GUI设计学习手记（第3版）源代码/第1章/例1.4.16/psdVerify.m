function y = psdVerify(str)
% �ú���ʵ���˶��û����������ַ�������Ч����֤����֤ͨ��ʱ����true�����򷵻�false
% ��֤�������£�
% ��Ӣ����ĸ�����ֺ��»������ 
% ��1���ַ�Ϊ��ĸ
% ����6~15���ַ�
    y = false;
    if ischar(str)  %ȷ���������Ϊ�ַ���
    	y = ~isempty(regexp(str, '^[a-zA-Z]\w{5,15}$', 'once'));
    end
end
