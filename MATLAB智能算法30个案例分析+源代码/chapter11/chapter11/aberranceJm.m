function ChromNew=aberranceJm(Chrom,MUTR,Jm,T)

%��ʼ��
[NIND,WNumber]=size(Chrom);
WNumber=WNumber/2;

ChromNew=Chrom;

[PNumber MNumber]=size(Jm);
Number=zeros(1,PNumber);
for i=1:PNumber
  Number(i)=1;
end

for i=1:NIND    
                
    %ȡһ������
    S=Chrom(i,:);
            
       WPNumberTemp=Number; 
        
       for j=1:WNumber
           
          JMTemp=Jm{S(j), WPNumberTemp(S(j))};
          SizeTemp=length(JMTemp);
          
            %�Ƿ����
          if MUTR>rand;
              
%               ѡ����������ѡ��
%                S(j+WNumber)=unidrnd(SizeTemp); 
          
                %ѡ������� �ӹ�ʱ���ٵ�ѡ���ʴ�
                if SizeTemp==1      
                       S(j+WNumber)=1;
                else
                    S(j+WNumber)=selectJm(S(j++WNumber),T{S(j),WPNumberTemp(S(j))});
                end
          end
          
            WPNumberTemp(S(j))=WPNumberTemp(S(j))+1;
        end         
   
  
    %���ݷ�����Ⱥ
    ChromNew(i,:)=S;
end
