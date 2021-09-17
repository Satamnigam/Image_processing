clear all; 
close all;
clc;

I=imread('cameraman.tif');
p=im2double(I);
k=imread('autumn.tif');
t=rgb2gray(k);
q=im2double(t);
%Hsl= convolve(p,q);
%figure,
%imagesc((Hs1/255)); colormap('gray');
Hs2=conv2(p,q,'same');
figure,
imagesc((Hs2)); 
colormap('gray');
