%��������õ���������ƴ�Ӻ��� 
function [next,x1]=fun2_unique(f0,f,dang,index1,index2)     %������     
    alpha=2; 
    a1=f0(:,end)*ones(1,(length(index2)));    
    b=f(:,index1); 
    distance=(a1-b).^alpha;     
    zhi1=min(sum(distance)); 
    next1=find(sum(distance)==zhi1);%�������ҵ�ƥ��ͼƬ     %���ҵ��� 
    a1=f0(:,1)*ones(1,(length(index1)));     
    b=f(:,index2); 
    distance=(a1-b).^alpha;     
    zhi2=min(sum(distance)); 
    next2=find(sum(distance)==zhi2);%���������ƥ��ͼƬ     
    if zhi1==zhi2         
        next=next1;       
        x1=1;         
        return    
    else 
        [y,x1]=min([zhi1,zhi2]);    
    end 
    if x1==1 
        next=next1;    
    else 
        next=next2;   
    end
    