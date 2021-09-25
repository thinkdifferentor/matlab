clear,clc

A=[3	8	19	6	27	23	87	58	9	2	2	7];
B=Beta(A);

function m = Beta( Y )
n=size(Y,2);
k=1;
for i=2:n
   for j=1:i-1
       a(k) = (Y(i)-Y(j))/(i-j);
       k=k+1;
   end
end
m = median(a,2);
end