clc;
clear;


fid1=fopen('Data2.txt','r');
i=1;
while (~feof(fid1))
data=fgetl(fid1);
a=length(find(data==97));
b=length(find(data==99));
c=length(find(data==103));
d=length(find(data==116));

e=length(find(data>=97&data<=122));

f(i,:)=[a b c d e a+b+c+d];
i=i+1;
end

f;
he=sum(f);
dlmwrite('pinshu.txt',f); 
dlmwrite('pinshu.txt',he,'-append');
fclose(fid1);