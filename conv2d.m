% k >> KERNEL      A>> IMAGE MATRIX
clc;
clear all ; 
close all;
% A=imread('https://ichef.bbci.co.uk/news/976/cpsprodpb/14A35/production/_115033548_gettyimages-1226314512.jpg');
% A=imread('cameraman.tif');
% A = [4 4 3 5 4;
%        6 6 5 5 2;
%        5 6 6 6 2;
%        6 7 5 5 3;
%       3 5 2 4 4];
A = [2 3; 1 4];
k = [4 7; 1 2];
% k = [0 -1 0;-1 4 -1;0 -1 0];
G=conv2(A,k);
% figure(1);
% subplot(1,1,1);
% imshow(G);
[r c] = size(A);
[m n] = size(k);
h = rot90(k, 2);
center = floor((size(h)+1)/2);
left = center(2) - 1;
right = n - center(2);
top = center(1) - 1;
bottom = m - center(1);
Rep = zeros(r + top + bottom, c + left + right);
for x = 1 + top : r + top
    for y = 1 + left : c + left
        Rep(x,y) = A(x - top, y - left);
    end
end
B = zeros(r , c);
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y -1;
                B(x, y) = B(x, y) + (Rep(i + q, j + w) * h(i, j));
            end
        end
    end
end
% figure(2);
% subplot(2,1,1);
% imshow(A);
% title('Original Image');
% subplot(2,1,2);
% imshow(B);
% title('Convoluted Image');
% fprintf('2D Convoultion = \n');
% disp(B);
% fprintf('2D Convoultion with conv2 function = \n');
% disp(conv2(A,k,'same'));  %ONLY CENTRAL PART
