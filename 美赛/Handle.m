%�������
years=50;

%���ݵ���
data=cell2mat(struct2cell(load('matlab.mat')));

%��������
num=length(data);

%������ӽ������
% sum=zeros(years,1);

% %������ӽ��
% for i=1:years
%    for j=i:years:num
%         sum(i,1)=sum(i,1)+data(j,1);
%    end
% end

%ֻȡ09������
sum=0;
for i=50:years:num
    sum=sum+data(i,1);
end
