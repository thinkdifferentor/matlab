%����3��������ƴ�ӵĵ��ú��� 
function next=fun2_1(f,dang,index1,index2) 
%������ 
    a1=f(:,index2(dang))*ones(1,(length(index2)));  
    b=f(:,index1); 
    chabie1=(a1-b).^2; 
    zhi=min(sum(chabie1)); 
    next=find(sum(chabie1)==zhi); 