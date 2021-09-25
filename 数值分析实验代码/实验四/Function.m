% 一：MATLAB 实现列主元高斯消去法

function x=gauss_lie(A,b)
%采用高斯列主元法求解方程组Ax=b
n=length(b);
p=1:n;lu=A;
y=[];
for k=1:n
    [c,i]=max(abs(lu(k:n,k)));
    ik=i+k-1;
    if ik~=k
        m=p(k);p(k)=p(ik);p(ik)=m;
        ck=lu(k,:);lu(k,:)=lu(ik,:);lu(ik,:)=ck;
    end
    if k==n
        break;
    end
    lu(k+1:n,k)=lu(k+1:n,k)/lu(k,k);
    lu(k+1:n,k+1:n)=lu(k+1:n,k+1:n)-lu(k+1:n,k)*lu(k,k+1:n);
end
l=diag(ones(n,1))+tril(lu,-1);
u=triu(lu);

y(1)=b(p(1));
for i=2:n
    y(i)=b(p(i))-l(i,1:i-1)*y(1:i-1)';
end
x(n)=y(n)/u(n,n);
for i=n-1:-1:1
    x(i)=(y(i)-u(i,i+1:n)*x(i+1:n)')/u(i,i);
end
x=x';
end



% 二：高斯消去法的程序
function [A,b]= Gauss(A,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%use Gaussian elimination method to change 'A' into upper triangular matrix
% Nov 26,2008
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(A);              %get the size of matrix 'A'

% column pivotal elimination method
for k=1:n-1
   [v,u]=max(abs(A(k:n,k)));    %select the maximum element into the kth 
                                %column of matrix A(k:n,1:k)
   u=u+k-1;        %because function max return the index of maximum values
                   %of A(k:n,1:k) so we should change it into the value of
                   %matrix A
   p(k)=u;         %record the index u
   %exchange the row of k and u
   t1 = A(k,k:n);          %temporary variable t1
   A(k,k:n) = A(u,k:n);
   A(u,k:n) = t1;
   
   t2 = b(k);              %temporary variable t2
   b(k) = b(u);
   b(u) = t2;
   % Gauss elimination method
   if A(k,k) ~= 0
        rows=k+1:n
        A(rows,k)=A(rows,k)/A(k,k);
        A(rows,rows)=A(rows,rows)-A(rows,k)*A(k,k);
        L(rows,rows)=A(rows,rows);
   end
   
end

% calculate the matrix U
for k=2:n
    A(k,1:k-1)=0;
end

end


% 三：求解三角方程组的程序
function x= Eqn_Root(A,b);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate the solution of upper triangular equations set Ax=b
% Nov 26,2008
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(A);              %get the size of matrix 'A'
%x(n)=b(n)/A(n,n);           %calculate x(n)
% calculate the solution
for i = n : -1 : 1
    t = 0;
    for j = n : -1 : i+1
        t = t+A(i,j)*x(j);
    end
    x(i) = (b(i)-t)/A(i,i);
end


end

% 四：主程序
function Examples_Eqn_Root
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use the Gauss method to solve the linear equations Ax=b
% Nov 26, 2008
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [  1  3  6  8  9  2;    %input the value of 'A'
    2  5  3  1  6  3;
    3  6  1  2  8  5;
    2  6  8  9  3  8;
    5  8  9  3  2  3;
    3  5  8  1  7  2];
b= [2 -3 2 55 16 -6];       %input the value of 'b'
b = b';                       %take the transpose of 'b'
[A,b]= Gauss(A,b)           %change the matrix 'A' into upper triangular matrix
                            %return the new array 'b'
b = b'
x= Eqn_Root(A,b)            %calculate the upper triangular quations set
end

