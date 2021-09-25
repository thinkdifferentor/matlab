function x=Thomas(N,alpha,beta,gama,d)
% Implement Thomas algorithm to solve
%     Tx=d
% where T is a NxN tri-diagonal matrix with N dimensionl vector--alpha 
% as diagonal elements,(N-1) dimensional vectors--beta & gama as up 
% and down off_diagonal elements,respectively. The ouput x is a N 
% dimensional vector--the solution.
x=d;
m=zeros(1,N); l=zeros(1,N);
m(1)=alpha(1);
for i=2:N
    l(i)=gama(i)/m(i-1);
    m(i)=alpha(i)-l(i)*beta(i-1);
end
y=zeros(1,N);
y(1)=d(1);
for i=2:N
    y(i)=d(i)-l(i)*y(i-1);
end

x=zeros(1,N);
x(N)=y(N)/m(N);
for i=N-1:-1:1
    x(i)=(y(i)-beta(i)*x(i+1))/m(i);
end

