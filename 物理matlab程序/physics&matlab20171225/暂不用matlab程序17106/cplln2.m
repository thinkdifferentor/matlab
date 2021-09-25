z=cplxgrid(20);
w=log(z);
for k=0:3
    w=w+i*2*pi;
    surf(real(z),imag(z),imag(w),real(w));
    hold on
    title('lnz')
end
view(-75,30)
