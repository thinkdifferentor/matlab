%碎纸片拼接算法一

%Problem one
clear
n=19;
x=cell(n,1); %建立 cell 存储碎纸片数据结构
for i=1:n
    str=rename(i);
    imgt=imread(str);
    img=im2double(imgt);
    x{i}.pic=img; %读取图片并转化为 double 类型
    x{i}.left=img(:,1);
    x{i}.leftnum=sum(img(:,1));
    
    if(x{i}.leftnum>0.98*1980*19/n) %判断是否为边缘，仅在问题 1 中有效
        start=i;
    end
    
    x{i}.right=img(:,end);
    x{i}.rightnum=sum(img(:,end));
    
    if(x{i}.rightnum>0.98*1980*19/n)
        finish=i;
    end
end


mypic=x{start}.pic;
xuhao=start;

for j=1:n-1
    temp=1000000;
    for i=1:n %循环对比相似度
        if(length(find(xuhao==i))==0)
            q=x{start}.right-x{i}.left;
            gg=sum(abs(q)); %两种距离函数随时调整
            % gg=sum(q.*q);
            if(gg<temp)
                temp=gg;
                ww=i;
            end
        end
    end
    start=ww;
    xuhao=[xuhao start];
    mypic=[mypic x{start}.pic];
end
imshow(mypic) %输出图形



% 灰度值密度图象生成
clear
imghg=imread('183.bmp'); %随机选取样本
temp1=sum(imghg,2);
temp2=zeros(178,1);

for i=1:180-2
    temp2(i)=temp1(i)+temp1(i+1)+temp1(i+2);
end
plot(temp1);
[a b]=sort(temp1);

% 根据矩阵画图程序：
function [ pq ] = drawcell( c,cellx )

    %DRAWCELL Summary of this function goes here
    % Detailed explanation goes here
    n=length(c);
    img=[];

    for i=1:n
        img=[img cellx{c(i)}.pic];
    end

    imshow(img);
    pq=img;
end


% 文件名称索取：
function [ str ] = rename( i )
    %RENAME Summary of this function goes here
    % Detailed explanation goes here
    if i<=10
        str=strcat('00',int2str(i-1),'.bmp');
    else if i<=100
        str=strcat('0',int2str(i-1),'.bmp');
    else
        str=strcat(int2str(i-1),'.bmp');
    end
    end
end




% Problem two
% 分类算法
clear

n=209;
h=15;
leibie=cell(30,1);
x=cell(n,1);
jianju=68; %两字中心坐标差
hg=20;

for i=1:n
    str=rename(i);
    imgt=imread(str);
    img=im2double(imgt);
    x{i}.pic=img;
end

for i=1:n
    temp1=sum(x{i}.pic,2);
    for j=1:180
        if(temp1(j)==72) %判断是否为全白
            st=j;
            break
        end
    end
    
    if(i==59)
        st=st+30;
    end
    
    for j=st:180
        if(temp1(j)~=72) %判断是否为字上沿
            st=j;
            break
        end
    end
    
    for j=st:180
        if(temp1(j)==72) %判断是否为字下沿
            a=j;
            break
        end
    end
    
    a=(st+a)/2;
    
    while(a>68)
        a=a-68;
    end
    x{i}.x=a;
end

leibie{1}.x=x{1}.x;
leibie{1}.member=1;

for i=2:n
    k=1;
    success=0;
        while(~isempty(leibie{k}))
            if(abs(mod(leibie{k}.x,68)-mod(x{i}.x,68))<3)
                leibie{k}.member=[leibie{k}.member i];
                success=1;
                break
            end
            
            k=k+1;
        end

        if(success==0)
            leibie{k}.x=x{i}.x;
            leibie{k}.member=i;
        end
end

% 模拟退火
function [ output ] = tuihuo( chushijie,cellx )
%TUIHUO Summary of this function goes here
% Detailed explanation goes here
routes=chushijie;
temperature=100;
titer=1;
previous_cost=diffx(chushijie,cellx);
temperature_threshould=1;
time=0;

while (temperature > temperature_threshould&&time<1000)
    temp_jie=reorder_route(routes);
    current_cost=diffx(routes,cellx);
    diff=current_cost-previous_cost;
    
    if(diff<0||(rand<exp(-diff*10/(temperature))))
        routes=temp_jie;
        previous_cost=current_cost;
        titer=titer+1;
    end
    
    if titer>=10
        temperature=0.5*temperature;
        titer=0;
    end
    
    time=time+1;
end

drawcell(routes,cellx);
output=routes;

end



% 模拟退火算法产生临解
function [ b ] = reorder_route( routes )
    %REORDER_ROUTE Summary of this function goes here
    % Detailed explanation goes here
    n=length(routes)-2;
    pianduan1=ceil(n*rand)+1;
    pianduan2=ceil(n*rand)+1;
    cmin=min(pianduan1,pianduan2);
    cmax=max(pianduan1,pianduan2);
    routes2=[routes(1:cmin-1) routes(cmax:end) routes(cmin:cmax-1) ];
    b=routes2;
end


% 距离值计算
function [ cost ] = diffx( c,cellx )
%DIFFX Summary of this function goes here
% Detailed explanation goes here
n=length(c);
tt=0;

    for i=1:n-1
        j=cellx{c(i)};
        p=cellx{c(i+1)};
        q=j.right-p.left;
        tt=tt+sum(q.*q);
    end

cost=tt;
end


% 英文分类算法：
function [ B ] = seachformid( A )
%SEACHFORMID Summary of this function goes here
% Detailed explanation goes here
n=length(A);
k=1;
B=[];

    while(k<n)
        success=0;
        for j=k:n
            if(A(j)~=72)
                st=j;
                success=success+1;
                break
            else if(j==n)
                st=n;
            end
            end
        end
        
        for q=st:n
            if(A(q)==72)
                st2=q;
                k=q;
            if(st2-st>20)
                success=success+1;
            end
            break
            else if(q==n)
                k=n+1;
                end
            end
        end
        
        
        if(success>1)
            temp=100000;
            for i=st+10:st2-10
                if(sum(A(i-10:i+10))<temp)
                    temp=sum(A(i-10:i+10));
                    ww=i;
                    while(ww>=63)
                        ww=ww-63;
                    end
                end
            end
            B=[B ww];
        end
    end
end


% 启发式算法 1
function [ output ] = pintu( A,cellx )
    %PINTU Summary of this function goes here
    % Detailed explanation goes here
    n=length(A);
    start=A(floor(n*rand())+1);
    %n=min(n,15);
    xuhao=[start];
    biaoji=[start duimian(start)];
    changdu=1;
    mypic=cellx{start}.pic;
    
    for j=1:min(n,20)-1
        temp=1000000;
        for i=1:n
            nn=length(cellx{A(i)}.id)+changdu;
            if(length(find(biaoji==A(i)))==0&&length(find(cellx{start}.no==A(i)))==0&&nn<20)
                if(length(find(xuhao==A(i)))==0&&length(find(cellx{A(i)}.no==start))==0&&nn<20)
                    % q=cellx{start}.right-cellx{A(i)}.left;29
                    q=cellx{A(i)}.right-cellx{start}.left;
                    % gg=sum(abs(q));
                    gg=sum(q.*q);
                    
                    if(gg<temp)
                        temp=gg;
                        ww=A(i);
                    end
                end
            end
            if(temp<10000)
                start=ww;
                biaoji=[biaoji start duimian(start)];
                % xuhao=[xuhao start];
                xuhao=[start xuhao ];
                % mypic=[mypic zeros(180,3) cellx{start}.pic];
                mypic=[cellx{start}.pic zeros(180,3) mypic];
                changdu=changdu+length(cellx{start}.id);
            end
        end
        imshow(mypic)
        output=xuhao;
    end

end


% 启发式算法 2
function [ newc,newcellx ] = hebing( A,c,cellx,old)
    %HEBING Summary of this function goes here
    % Detailed explanation goes here
    %c 为 11 个类别中的成员向量
    %cellx 我们建立的 X3；
    %old 为上一轮解
    tcell=cellx;
    tempc=c;
    n1=length(A)/2;
    n2=length(old);
    
    for i=1:n2-1
        tcell{old(i)}.no=[tcell{old(i)}.no old(i+1)];
    end
    
    for p=1:n1
        j=2*p-1;
        for q=A(j):A(j+1)-1
            tcell{old(A(j))}.id=[tcell{old(A(j))}.id tcell{old(q+1)}.id];
            tcell{old(A(j))}.apic=[tcell{old(A(j))}.apic
            tcell{old(q+1)}.apic];
            tcell{old(A(j))}.bpic=[tcell{old(q+1)}.bpic
            tcell{old(A(j))}.bpic ];
            tcell{old(A(j))}.aright=tcell{old(q+1)}.aright;
            tcell{old(A(j))}.bleft=tcell{old(q+1)}.bleft;
            tcell{old(A(j))}.no=tcell{old(q+1)}.no;
            tempc=delmem(tempc,old(q+1));
        end
    end
    
    newc=tempc;
    newcellx=tcell;
end



% 启发式算法 3 带有关联功能
function [ newc,newcellx ] = hebing( A,c,cellx,old)
    %HEBING Summary of this function goes here
    % Detailed explanation goes here
    %c 为 11 个类别中的成员向量
    %cellx 我们建立的 X3；
    %old 为上一轮解
    tcell=cellx;
    tempc=c;
    n1=length(A)/2;
    n2=length(old);
    
    for i=1:n2-1
        tcell{old(i)}.no=[tcell{old(i)}.no old(i+1)];
    end
    
    for p=1:n1
        j=2*p-1;
        for q=A(j):A(j+1)-1
            if(length(find(c==old(q+1)))>0)
                tcell{old(A(j))}.id=[tcell{old(A(j))}.id tcell{old(q+1)}.id];
                tcell{old(A(j))}.pic=[tcell{old(A(j))}.pic tcell{old(q+1)}.pic];
                tcell{old(A(j))}.right=tcell{old(q+1)}.right;
                tcell{old(A(j))}.no=tcell{old(q+1)}.no;
                tempc=delmem(tempc,old(q+1));
            end
            
            fm1=duimian(old(A(j)));
            fm2=duimian(old(q+1));
            
            if(length(find(c==fm1)>0))
                % disp aa;
                tcell{fm1}.id=[tcell{fm2}.id tcell{fm1}.id];
                tcell{fm1}.pic=[tcell{fm2}.pic tcell{fm1}.pic];
                tcell{fm1}.right=tcell{fm2}.left;
                tcell{fm1}.no=tcell{fm2}.no;
                tempc=delmem(tempc,fm2);
            end
        end
    end
    newc=tempc;
    newcellx=tcell;
end