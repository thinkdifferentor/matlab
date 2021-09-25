% Problem two

% 分类算法
function Solution1_2
clc;
clear;
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

end