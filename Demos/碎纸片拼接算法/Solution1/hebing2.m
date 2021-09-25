
% 启发式算法 3 带有关联功能
function [ newc,newcellx ] = hebing2( A,c,cellx,old)
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