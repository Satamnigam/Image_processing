I=imread('cameraman.tif');
figure,imshow(I)
%t=rgb2gray(I)
j=imnoise(I,'salt & pepper',0.09);
k=medfilt2(j);
imshowpair(j,k,'montage')