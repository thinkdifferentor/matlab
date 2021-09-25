t=0:1/100:100-1/100;
x=sin(2*pi*15*t)+sin(2*pi*40*t);
y=fft(x);
m=abs(y);
p=unwrap(angle(y));
figure(3);
f=(0:length(y)-1)'*100/length(y);
subplot(2,1,1)
plot(f,m),
ylabel('Abs Magnitude')
grid on
subplot(2,1,2)
plot(f,p*180/pi)
ylabel('Phase [degrees]')
grid on
xlabel('Frequency [Hertz]')
