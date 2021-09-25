function NewChrom=across(Chrom,XOVR,Jm,T)

% Chrom=[1 3 2 3 1 2 1 3 2; 
%     1 1 2 3 3 1 2 3 2;
%     1 3 2 3 2 2 1 3 1;
%     1 3 3 3 1 2 1 2 2;
% ]; 
%   XOVR=0.7;

[NIND,WNumber]=size(Chrom);
WNumber=WNumber/2;
NewChrom=Chrom;%��ʼ������Ⱥ

[PNumber MNumber]=size(Jm);
Number=zeros(1,PNumber);
for i=1:PNumber
  Number(i)=1;
end

%���ѡ�񽻲����(ϴ�ƽ���)
SelNum=randperm(NIND);   

Num=floor(NIND/2);%������������
for i=1:2:Num
    if XOVR>rand; 
        Pos=unidrnd(WNumber);%����λ��
        while Pos==1
            Pos=unidrnd(WNumber);
        end
        %ȡ������ĸ���
        S1=Chrom(SelNum(i),1:WNumber);
        S2=Chrom(SelNum(i+1),1:WNumber); 
        S11=S2;S22=S1; %��ʼ���µĸ���     
        %�¸����м�Ƭ�ϵ�COPY      
        S11(1:Pos)=S1(1:Pos);      
        S22(1:Pos)=S2(1:Pos);        
        %�Ƚ�S11���S1,S22���S2�����ȱʧ�Ļ���
        S3=S11;S4=S1;
        S5=S22;S6=S2;
        for j=1:WNumber         
           Pos1=find(S4==S3(j),1);
           Pos2=find(S6==S5(j),1);
           if Pos1>0
               S3(j)=0;
               S4(Pos1)=0;
           end                         
           if Pos2>0
               S5(j)=0;
               S6(Pos2)=0;
           end
        end
        for j=1:WNumber          
          if S3(j)~=0 %����Ļ���          
            Pos1=find(S11==S3(j),1);        
            Pos2=find(S4,1);%����ȱʧ�Ļ���
            S11(Pos1)=S4(Pos2);%��ȱʧ�Ļ����޲�����Ļ���
            S4(Pos2)=0;       
          end 
          if S5(j)~=0              
            Pos1=find(S22==S5(j),1); 
            Pos2=find(S6,1);           
            S22(Pos1)=S6(Pos2);
            S6(Pos2)=0;          
          end  
        end                         

        % ���潻��ǰ�Ļ��� ����
        S1=Chrom(SelNum(i),:);
        S2=Chrom(SelNum(i+1),:); 
       
        for k=1:WNumber            
            Pos1=Find(S11(k),S1);           
            S11(WNumber+k)=S1(WNumber+Pos1);
            S1(Pos1)=0;
            
            Pos1=Find(S22(k),S2);           
            S22(WNumber+k)=S2(WNumber+Pos1);
            S2(Pos1)=0;
        end
          
        %�����µ���Ⱥ
        NewChrom(SelNum(i),:)=S11;
        NewChrom(SelNum(i+1),:)=S22;
    end
 end