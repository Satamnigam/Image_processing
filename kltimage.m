clear all;
close all;
im=imread('D:\Wallpapers\17.jpg');
im2=rgb2gray(im(1:fix(size(im,1)/8)*8,1:fix(size(im,2)/8)*8,:));
image=double(im2)/255;
figure(1)
subplot(121)
imagesc(image);colormap gray;axis image
title('Original')
x=im2col(image,[8 8],'distinct');
mx=mean(x');
z=x-mx';
Cz=cov(z');
[V,D]=eig(Cz);
y=V'*z;
dr=20;
y(1:dr,:)=zeros(dr,size(y,2));
z2=inv(V')*y;
x2=z2+mx';

figure(1)
subplot(122)
imagesc(col2im(x2,[8 8],[fix(size(im,1)/8)*8 fix(size(im,2)/8)*8],'distinct'));colormap gray;axis image
title('compressed')

