z=cplxgrid(20);
w=log(z+eps*(abs(z)==0));
for k=0:3
    subplot(2,2,k+1);
    w=w+i*2*pi;
    surf(real(z),imag(z),real(w),imag(w));
    caxis([0,8*pi]);
    title('lnz')
end
