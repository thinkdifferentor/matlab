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
