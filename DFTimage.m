clear all;
im = imread('football.jpg');
[M N] = size(im);

for j = 0:M-1
    for k=0:N-1
        dft1(j+1,k+1)=(1/(M*N))*(im(j+1,k+1)*(exp(-1*imag*(2*pi/M*j)+(2*pi/N*k)))');
    end
end
w=1:1:8;
surf(fftshift(abs(dft1)));