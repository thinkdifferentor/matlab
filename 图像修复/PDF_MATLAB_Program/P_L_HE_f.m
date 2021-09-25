function f=P_L_HE_f( h,Damax,Damin,Dbmax,Dbmin,N)  
%%% 子函数: P_L_HE_f()计算分段线形拉伸函数
%%% 参数说明：
%%% h      - 输入图像的归一化直方图
%%% Damax  - 输入图像的最大值
%%% Damin  - 输入图像的最小值
%%% Dbmax  - 输出图像的最大值
%%% Dbmin  - 输出图像的最小值
%%% N      - 分段数
%%% f      - 返回的分段线形拉伸函数
  
D_a([1:N])=0;                     % 初始化输入分段的各分段的终点
D_b([1:N])=0;                     % 初始化输出分段的各分段的终点
count([1:N])=0;                   % 在每一输入分段中含有非零值的数目
start=Damin+1;  s=0.0;
%%- 寻找N个分段的终点D_a(n)，但一些分段可能为空
for n=1:N
    for ii=start:Damax+1    
        if h(ii)>0
            count(n)=count(n)+1;
            s=s+h(ii);
        end
        if s>=double(n/N)             
            D_a(n)=ii-1;                
            count(n)=count(n)-1;  % 记录每一段内的非零值
            s=s-h(ii);            % 这一分段不包括h(i)
            start=ii;             % 从i开始搜寻下一个分段终点
            break;              
        end
    end
    if n==N
        D_a(N)=Damax+1;
        count(N)=count(N)+1;
    end
end                            

%%- 删除空的分段，并更新分段终点
kk=(Dbmax-Dbmin+1)/N;                    
nn=0;
for n=1:N
    if count(n)>0
        nn=nn+1;                  % 新的分段总数
        count(nn)=count(n);
        D_a(nn)=D_a(n);
        D_b(nn)=Dbmin+n*kk-1;
    end
    if n==N
        D_b(nn)= D_b(nn)+1;
        D_a(nn)=Damax+1;
    end
end                           

%%- 计算每一分段的拉伸函数
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
    