% 机顶盒id与用户id的查找匹配
clear,clc

%用户机顶盒匹配关系载入 机顶盒号/用户号
load('Tid');

%载入需要匹配的数据 机顶盒号
load('Match_test.mat');

%开始匹配——数据一
U1=zeros(length(Match_test),1);
for i=1:length(Match_test)
   for j=1:length(Tid);
      if(Tid(j,1)== Match_test(i))
         U1(i)=Tid(j,2); 
      end
   end
end



