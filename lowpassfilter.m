clc
close all
clear all
I1 = imread('D:\Wallpapers\19.jpg');
I1 = imresize(I1,[128 128]);
I2 = rgb2gray(I1)
I2=double(I2);
figure, imshow(uint8(I2));
I3=fft2(I2);
I3=fftshift(I3);
figure
I4=log(1+abs(I3));
imshow(mat2gray(I4));
[r,c]=size(I2);
orgr=r/2;
orgc=c/2;
mf= zeros(r,c);
D0= 40;
for i=1:r
  for j=1:c
      if((i-orgr)^2+(j-orgc)^2)^(0.5)<=D0
          mf(i,j)=1;
      end
  end
end
figure
imshow(uint8(255*mf));
title('frequency domain filter used');
I5=I3.*mf;
figure,
I4=log(1+abs(I5));
imshow(mat2gray(I4));
title('filtered image in frequency domain');
I6=ifft2(ifftshift(I5));
figure,
imshow(uint8(abs(I6)));
title('filtered gray scale image');
