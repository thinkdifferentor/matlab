%fun1_1 
%¼ÆËã¾àÀëµÄº¯Êı 
function next=fun1_1(f,dang,index1,index2) 
    a=f(:,index2(dang))*ones(1,(length(index2)));     
    b=f(:,index1);     
    chabie=(a-b).^2; 
    next=find(sum(chabie)==min(sum(chabie)));
