%������С��--��ȥ����Ƶ��
clear,clc;

%��������
Data=importdata('Rating_W.mat');
Rating=zeros(1329,150);
[r,c]=size(Data);
cnt=1;

%��С����
for i=1:c
   if(sum(Data(:,i))==0)
      continue; 
   end
   Rating(:,cnt)=Data(:,i);
   cnt=cnt+1;
end
