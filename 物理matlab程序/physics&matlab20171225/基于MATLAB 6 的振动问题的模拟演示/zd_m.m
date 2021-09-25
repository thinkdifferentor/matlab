function zd_m(f,wp,x0v0,t1,z,w1)
w0=w1+0.000000000001;
for k=1:length(z)
    x=dsolve('D2x+2*z(k)*Dx+w0^2*x=f*cos(wp*t)','x(0)=x0v0(1)','Dx(0)=x0v0(2)','t');
    x=real(x);  %%取x的实部
    i=0;
    for t=t1
        i=i+1;
        s(i,k)=eval(vectorize(char(x)));
    end
    t=t1;
    if z(k)>w0
    plot(t,s(:,k),'g')
elseif z(k)==w1
    plot(t,s(:,k),'r')
elseif z(k)<w0
    plot(t,s(:,k),'k')
end
if length(z)>1 
   hold on
end
end
return