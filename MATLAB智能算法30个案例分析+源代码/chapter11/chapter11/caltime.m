function PVal=caltime(S,P,JmNumber,T,Jm)

% ����˵����    ���ݵ��ȹ���,��������ȹ���ʱ��
% ���������
%        P     Ϊ���ȹ���  
%        JmNumber    Ϊ��������
%        T     Ϊ������������ļӹ�ʱ�� 
%        Jm    Ϊ������������ʹ�õĻ��� 
% �������:
%        PVal  Ϊ���ȹ���ʼ�ӹ�ʱ�估���ʱ��


%  �������� ������� 
[PNumber MNumber]=size(Jm);

%ȡ��������ȡ�����һ��
 M=S(1,PNumber*MNumber+1:PNumber*MNumber*2); 
 
%�����ܸ���
WNumber=length(P);

%��ʼ��
TM=zeros(1,JmNumber);
TP=zeros(1,PNumber);
PVal=zeros(2,WNumber);

%������ȹ���ʱ��
for i=1: WNumber 
    
    % ȡ������
    val= P(1,i);
    a=(mod(val,100)); %����
    b=((val-a)/100);  %����
    Temp=Jm{b,a};
    m=Temp(M(1,i));
    
    %ȡ�ӹ�ʱ��
    Temp=T{b,a};
    t=Temp(M(1,i));
    
    %ȡ�����ӹ�������Ŀ�ʼʱ���ǰ��һ����������ʱ��
    TMval=TM(1,m);
    TPval=TP(1,b); 
    
    %�����ӹ�������Ŀ�ʼʱ�� ����ǰ��һ����������ʱ ��ȡ�����ӹ�������Ŀ�ʼʱ��
    if TMval>TPval 
        val=TMval;
     %ȡǰ��һ����������ʱ��  
    else
        val=TPval;
    end
    
    %����ʱ��
    PVal(1,i)=val;
    PVal(2,i)=val+t;
    
    %��¼���ι���Ļ���ʱ��͹���ʱ��
    TM(1,m)=PVal(2,i);
    TP(1,b)=PVal(2,i); 
end

