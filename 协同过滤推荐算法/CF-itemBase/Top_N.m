% �ҳ�������ǰN����ֵ���±�
function [score,index]=Top_N(array,n)
    index=zeros(1,n);
    temp=sort(array,'descend');
    for i=1:n
        for j=1:length(array)
           if(temp(i)==array(j))
                index(i)=j;
           end
        end
    end
    score=temp(1:n);
end