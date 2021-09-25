% 2.复化Simpson公式的代码
function Sn = Sn(a,b,n)
    format long
    h = (b-a)/n;
    sum1 = 0;
    sum2 = 0;
    for i = 0:n-1
        sum1 = sum1 + f(a+(i+1/2).*h);
    end
    
    for j = 1:n-1
        sum2 = sum2 + f(a+j.*h);
    end
    
    Sn = h/6*(f(a)+4*sum1+2*sum2+f(b));
end
