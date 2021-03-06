% （说明：f表示任一函数，n精度，a，b为区间） 

function y=Romberg(f,n,a,b)      
z=zeros(n,n); h=b-a; 
z(1,1)=(h/2)*(f(a)+f(b)); f1=0; 
for i=2:n 
    for k=1:2^(i-2) 
        f1=f1+f(a+(k-0.5)*h);     
    end   
 z(i,1)=0.5*z(i-1,1)+0.5*h*f1; 
 h=h/2;  
 f1=0;  
 for j=2:i 
     z(i,j)=z(i,j-1)+(z(i,j-1)-z(i-1,j-1))/(4^(j-1)-1);  
 end
end

z,n


r=quadl(@(x)log(1+x)./(1+x.^2),0,1)

x=0:0.01:1;
y=log(1+x)./(1+x.^2);
z=trapz(x,y)

