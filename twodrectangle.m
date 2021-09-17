x=[1 1 1 1;1 1 1 1;1 1 1 1;1 1 1 1];
figure(1)
r=fft2(x,256,256);
%figure(3)
plot(abs(r));
mesh(abs(r))
figure(2)
s=fftshift(r);
mesh(abs(s));
