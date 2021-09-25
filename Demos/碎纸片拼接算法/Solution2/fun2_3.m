%问题二调用的从左向右拼接函数 
function next=fun2_3(f,dang,index1,index2) %从右到左 
    a1=f(:,index1(dang))*ones(1,(length(index1)));     
    b=f(:,index2); 
    chabie1=(a1-b).^2; 
    next=find(sum(chabie1)==min(sum(chabie1))); 