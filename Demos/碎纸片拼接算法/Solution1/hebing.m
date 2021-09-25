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