R=imread('autumn.tif');
imshow(R)
I=rgb2gray(R);
J=dct2(I);
figure(1)
imshow(log(abs(J)),[])
J(abs(J)<10)=0;
K=idct2(J);
figure(2)
imshowpair(I,K,'montage')
title('Original Grayscale Image (Left) and Processed Image (Right)');
