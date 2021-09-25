%矩阵缩小化--除去无用频道
clear,clc;

%数据载入
Data=importdata('Rating_W.mat');
Rating=zeros(1329,150);
[r,c]=size(Data);
cnt=1;

%缩小矩阵
for i=1:c
   if(sum(Data(:,i))==0)
      continue; 
   end
   Rating(:,cnt)=Data(:,i);
   cnt=cnt+1;
end
