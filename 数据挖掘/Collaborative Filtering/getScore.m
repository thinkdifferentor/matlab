%ͨ���û���ID��ȡ�Ը�����Ӱ����������

function [ oneLine ] = getScore( id )

%�û��š�ӰƬ��š��ۿ�ʱ��/�㲥���
data=importdata('Single.mat');

%���ҵ������û���id�ĶԵ�Ӱ���������֣��û�id����ӰID�����ֵľ���
oneTest = data(data(:,1)==id,:);

%��ȡӰƬ��
Mid = importdata('Mid.mat');
oneLine = zeros(1,length(Mid));

% ����Ӱ������ֵ 
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneLine(oneTestLine(2)) = oneTestLine(3);
end

end

