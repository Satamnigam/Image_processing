% function t=getHaarTransform(im,N)
im=[100 50 60 150;20 40 60 30;50 90 70 82;74 66 90 58];
N=length(im);
h=haarmtx(N);
m=log2(N);
t=h*im*h';