% 1.复化梯形求积公式的代码
function Tn=Tn(a,b,n)  
    format long  
    h=(b-a)/n;
    sum=0;  
    for k=1:n-1  
        sum=sum+f(a+k.*h);  
    end  
    Tn=(f(a)+2*sum+f(b))*h/2;  
end  