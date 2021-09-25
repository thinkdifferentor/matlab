% https://wenku.baidu.com/view/4f937ab1b9d528ea80c7790b.html


%复合梯形公式
function y=fx(x)  
y=sin(x)./x; 
 
 
function T_n=fht(a,b,n)
h=(b-a)/n;  
for k=0:n      
    x(k+1)=a+k*h;          
if x(k+1)==0                   
    x(k+1)=10^(-10);          
end 
end 
T_1=h/2*(fx(x(1))+fx(x(n+1)));  
for i=2:n       
    F(i)=h*fx(x(i));  
end 
T_2=sum(F);  
T_n=T_1+T_2;
 
 
 
% 复合辛普森公式
function y=f(x)  
y=sin(x)./x;  
 
 
function S_n=S_P_S(a,b,n)  
h=(b-a)/n; for k=0:n      
    x(k+1)=a+k*h;       
    x_k(k+1)=x(k+1)+1/2*h;      
    if (x(k+1)==0)|(x_k(k+1)==0)                  
    x(k+1)=10^(-10);                  
    x_k(k+1)=10^(-10);      
end 
end 
 
S_1=h/6*(f(x(1))+f(x(n+1))); 
for i=2:n       
     F_1(i)=h/3*f(x(i));  
end 
for j=1:n       
     F_2(j)=2*h/3*f(x_k(j));  
end 
S_2=sum(F_1)+sum(F_2);  
S_n=S_1+S_2;



%积分函数
function y=f(x)   
y=sin(x); 

end


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
    
% 3.复化Cotes公式的代码    
function Cn = Cn(a,b,n)  
    format long  
    h = (b-a)/n;  
    sum1 = 0;  
    sum2 = 0;  
    for i = 0:n-1  
        sum1 = sum1 + 32*f(a+(i+1/4).*h)+12*f(a+(i+1/2).*h)+32*f(a+(i+3/4).*h);  
    end  
    for j = 1:n-1  
        sum2 = sum2 + 14*f(a+j.*h);  
    end  
Cn = h/90*(7*f(a)+sum1+sum2+7*f(b));     
end















