function f=P_L_HE_f( h,Damax,Damin,Dbmax,Dbmin,N)  
%%% �Ӻ���: P_L_HE_f()����ֶ��������캯��
%%% ����˵����
%%% h      - ����ͼ��Ĺ�һ��ֱ��ͼ
%%% Damax  - ����ͼ������ֵ
%%% Damin  - ����ͼ�����Сֵ
%%% Dbmax  - ���ͼ������ֵ
%%% Dbmin  - ���ͼ�����Сֵ
%%% N      - �ֶ���
%%% f      - ���صķֶ��������캯��
  
D_a([1:N])=0;                     % ��ʼ������ֶεĸ��ֶε��յ�
D_b([1:N])=0;                     % ��ʼ������ֶεĸ��ֶε��յ�
count([1:N])=0;                   % ��ÿһ����ֶ��к��з���ֵ����Ŀ
start=Damin+1;  s=0.0;
%%- Ѱ��N���ֶε��յ�D_a(n)����һЩ�ֶο���Ϊ��
for n=1:N
    for ii=start:Damax+1    
        if h(ii)>0
            count(n)=count(n)+1;
            s=s+h(ii);
        end
        if s>=double(n/N)             
            D_a(n)=ii-1;                
            count(n)=count(n)-1;  % ��¼ÿһ���ڵķ���ֵ
            s=s-h(ii);            % ��һ�ֶβ�����h(i)
            start=ii;             % ��i��ʼ��Ѱ��һ���ֶ��յ�
            break;              
        end
    end
    if n==N
        D_a(N)=Damax+1;
        count(N)=count(N)+1;
    end
end                            

%%- ɾ���յķֶΣ������·ֶ��յ�
kk=(Dbmax-Dbmin+1)/N;                    
nn=0;
for n=1:N
    if count(n)>0
        nn=nn+1;                  % �µķֶ�����
        count(nn)=count(n);
        D_a(nn)=D_a(n);
        D_b(nn)=Dbmin+n*kk-1;
    end
    if n==N
        D_b(nn)= D_b(nn)+1;
        D_a(nn)=Damax+1;
    end
end                           

%%- ����ÿһ�ֶε����캯��
f([1:256])=0;               
for n=1:nn                     
    if n==1
        Da1=Damin+1; Db1=Dbmin+1;
    else
        Da1=D_a(n-1)+1; Db1=0.5*(D_b(n-1)+D_b(n));
    end
    Da2=D_a(n); Db2=D_b(n);
    DeltaDa=Da2-Da1+1; DeltaDb=Db2-Db1+1;
    %       offset=DeltaDb/(count(n)+1);
    for ii=Da1:Da2
        f(ii)= Db1+DeltaDb*(ii-Da1)/DeltaDa;
    end
end
    