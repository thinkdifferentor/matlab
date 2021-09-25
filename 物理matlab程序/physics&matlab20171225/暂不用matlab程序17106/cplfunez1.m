figure(1)
z=5*cplxgrid(30);
cplxmap(z,exp(z));
colorbar('vert');
title('e^z')
figure(2)
w=1;u=1;
for k=1:15
    u=u.*z./k;
    w=w+u;
end
cplxmap(z,w)
colorbar('vert');
title('e^z')
