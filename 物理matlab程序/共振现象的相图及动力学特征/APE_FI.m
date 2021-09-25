function APE_FI(tf,wx,b,x0,v0)
%cla
    wn=1/wx;
    wd=wn*sqrt(1-b^2);
    w=atan2(2*b,(wn-1/wn));
    c=1/sqrt((1-1/(wn^2))^2+(2*b/wn)^2);
    a=sqrt((x0-sin(w)/c)^2+(v0-cos(w)/c+b*wn*(x0-sin(w)/c))^2);
    phi=atan2(wd*(x0-sin(w)/c),v0-cos(w)/c+b*wn*(x0-sin(w)/c));
    t=0:tf/10000:tf;
    x=a*exp(-b*wn*t).*sin(wd*t+phi)+sin(t+w)*c;
    v=a*exp(-b*wn*t).*(-wn*b*sin(wd*t+phi)+wd*cos(wd*t+phi))+cos(t+w)*c;
plot(x,v)
return


