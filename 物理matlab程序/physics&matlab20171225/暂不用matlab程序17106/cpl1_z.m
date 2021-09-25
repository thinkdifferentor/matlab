m=30;
r=(0:2*m)'/m;
theta=pi*(-m:m)/m;
z=r*exp(i*theta);
z(find(z==1))=NaN;
figure
cplxmap(z,1./(1-z))
title('1/(1-z)')

z1=z;
z1(abs(z1)>=1)=NaN;
w1=1;u1=1;
for k=1:100
    u1=u1.*z1;
    w1=w1+u1;
end
figure
cplxmap(z1,w1)
title('1/(1-z)的泰勒级数|z|<1')

z2=z;
z2(abs(z2)<=1)=NaN;
w2=1./z2;u2=1./z2;
for k=1:100
    u2=u2./z2
    w2=w2+u2;
end
figure
cplxmap(z2,-w2)
title('1/(1-z)的罗朗级数|z|>1')