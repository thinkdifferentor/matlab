function [PVal ObjV P S]=cal(Chrom,JmNumber,T,Jm)

% ����˵����       ���ݻ���Ⱥ,�������Ⱥ��ÿ������ĵ��ȹ���ʱ�䣬
%                 ������Сʱ��ĵ��ȹ���͵��ȹ���ʱ��
% ���������
%       Chrom     Ϊ������Ⱥ  
%       T         Ϊ������������ʹ�õ�ʱ�� 
%       Jm        Ϊ������������ʹ�õĻ��� 

% �������:
%       PVal      Ϊ��ѵ��ȹ���ʱ�� 
%       P         Ϊ�������ĵ��ȹ��� 
%       ObjV      ΪȺ��ÿ������ĵ��ȹ���ʱ��
%       S         Ϊ�������ĵ��Ȼ���

%��ʼ��
NIND=size(Chrom,1);
ObjV=zeros(NIND,1);

%  �������� ������� 
[PNumber MNumber]=size(Jm);

for i=1:NIND  
    
    %ȡһ������
    S=Chrom(i,:);
    
    %���ݻ��򣬼�����ȹ���
    P= calp(S,PNumber);
    
    %���ݵ��ȹ��򣬼�������ȹ���ʱ��
    PVal=caltime(S,P,JmNumber,T,Jm); 
        
    %ȡ���ʱ��
    MT=max(PVal);
    TVal=max(MT);  
    
    %����ʱ��
    ObjV(i,1)=TVal;
    
    %��ʼ��
    if i==1
        Val1=PVal;
        Val2=P;
        MinVal=ObjV(i,1);
        STemp=S;
    end
    
    %��¼ ��С�ĵ��ȹ���ʱ�䡢��ѵ��ȹ���ʱ�� �������ĵ��ȹ���
    if MinVal> ObjV(i,1)
        Val1=PVal;
        Val2=P;
        MinVal=ObjV(i,1);
        STemp=S;
    end   
end 
 
%��ѵ��ȹ���ʱ�� �������ĵ��ȹ���
 PVal=Val1;
 P=Val2;
 S=STemp;

 
 
 
 