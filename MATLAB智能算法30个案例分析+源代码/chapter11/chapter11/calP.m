function P=calp(S,PNumber)

% ����˵����          ���ݻ���S,������ȹ���P
% ���������
%        S           Ϊ����  
%        PNumber     Ϊ�������� 
% �������: 
%        P           Ϊ����ĵ��ȹ��� 
%                    ��������1002��ʾ����10�Ĺ���03

WNumber=length(S);%�����ܸ���
WNumber=WNumber/2;

%ȡ�������ȡ�����һ��
S=S(1,1:WNumber);

%��ʼ��
temp=zeros(1,PNumber);
P=zeros(1,WNumber);

%�������ɵ��ȹ���
for i=1: WNumber 
    
   %�����+1
  temp(S(i))=temp(S(i))+1; 
  
  P(i)=S(i)*100+temp(S(i));
  
end


