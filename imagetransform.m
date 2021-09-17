I=im2double(imread('pout.tif'));

%imshow(I)
%R=rgb2gray(I)
F=fftshift(fft2(I));
h=max(F);
h1=max(h);
%hist3((F));
%plot(abs(F));
IF=ifft2(fftshift(F));
figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(IF);