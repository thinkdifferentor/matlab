% ������id���û�id�Ĳ���ƥ��
clear,clc

%�û�������ƥ���ϵ���� �����к�/�û���
load('Tid');

%������Ҫƥ������� �����к�
load('Match_test.mat');

%��ʼƥ�䡪������һ
U1=zeros(length(Match_test),1);
for i=1:length(Match_test)
   for j=1:length(Tid);
      if(Tid(j,1)== Match_test(i))
         U1(i)=Tid(j,2); 
      end
   end
end



