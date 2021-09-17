% function t=getSlantTransform(im,N)
clear all
clc
% im=[100 50 60 150;20 40 60 30;50 90 70 82;74 66 90 58];
im=[1 2 3 4  5 6 1 0];
N=length(im);
s=sltmtx(log2(N));
t=s*im*s';