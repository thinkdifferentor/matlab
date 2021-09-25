% beta计算公式
function m = Beta( Y )
for i=2:n
   for j=1:i
       a(i) = (Y(i)-Y(j))/(i-j);
   end
end

m = median(a,2);
end

%  Zc计算公式
function U = SMK( Y )
N = length(Y);
s = zeros(1,N);
U(1) = 0;
for k=2:N
    r = 0;
    s(k) = 0;
    for j=1:k-1
        if Y(k)>Y(j)
            r = r+1;
        end
        s(k) = s(k-1)+r;
    end
    E = k*(k-1)/4;
    VAR = k*(k-1)*(2*k+5)/72;
    U(k) = (s(k)-E)/sqrt(VAR);
end
