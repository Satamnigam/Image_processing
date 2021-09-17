clear all;
clc;
im1 = imread('cameraman.tif')
I=im2double(im1);

M=256;
N=256;
c1=(2/N)^0.5;
for n= 1:N-1
    for k= 1:N-1
       c=cos((2*n+1)*pi*k)/2*N;
    end;
end;
ans=c1*c*I*(c)';
ans1=uint8(ans);

figure;
subplot(1,2,1);
imshow(I);
title('Input Image');

subplot(1,2,2);
imshow(ans1);
title('DCT Result');

%w=1:1:8;
%surf(fftshift(abs(dft1)));