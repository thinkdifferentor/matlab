%ͨ���û���ID��ȡ�Ը�����Ӱ����������

function [ oneLine ] = getScore( id )

%��ȡ���Լ����û�ID����Ӱid�����֣�ʱ�����
test = load('u1.test');
%ȥ��ʱ���
test = test(:,1:3);
%���ҵ������û���id�ĶԵ�Ӱ���������֣��û�id����ӰID�����ֵľ���
oneTest = test(test(:,1)==id,:);

%ֱ�Ӷ�ȡinfo���ĵ�Ӱ��
info = textread('u.info','%n%*[^\n]');
oneLine = zeros(1,info(2));

% ����Ӱ������ֵ
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneLine(oneTestLine(2)) = oneTestLine(3);
end

end

