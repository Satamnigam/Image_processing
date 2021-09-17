clc;
clear all;
close all;
% (A)Gray Level Slicing
a = imread('football.jpg'); 
b = rgb2gray(a);
[m,n] = size(b);
imshow(b); 
title('input image in gray level');
figure;
imhist(b);
title('histogram of the input image at gray level');
c = zeros(m,n);
for i = 1:m
    for j = 1:n
        if b(i,j) >= 227 %threshold
            c(i,j) = 255;
        else
            c(i,j) = 0;
        end
    end
end
figure;
imshow(c);
title('gray level sliced image from an intensity level 240 onwards');
%% BIT PLANE SLICING
it= imread('football.jpg');   %read the image
itemp = it(:,:,1);
[r,c]= size(itemp);         %dimensions
s = zeros(r,c,8);           %  variable to store 8 bit planes of the image
for k = 1:8
    for i = 1:r
        for j = 1:c
            s(i,j,k) = bitget(itemp(i,j),k);    
        end
     end
    
end
figure,imshow(uint8(itemp));
title('Original Image');    
figure;    
%display all the 8 bit planes
    subplot(3,3,1);imshow(s(:,:,8));title('8th(MSB)Plane');
    subplot(3,3,2);imshow(s(:,:,7));title('7th Plane');
    subplot(3,3,3);imshow(s(:,:,6));title('6th Plane');
    subplot(3,3,4);imshow(s(:,:,5));title('5th Plane');
    subplot(3,3,5);imshow(s(:,:,4));title('4th Plane');
    subplot(3,3,6);imshow(s(:,:,3));title('3th Plane');
    subplot(3,3,7);imshow(s(:,:,2));title('2nd Plane');
    subplot(3,3,8);imshow(s(:,:,1));title('1st(LSB)Plane')
    % reconstruction
    rec=s(:,:,1)+s(:,:,2)*2+s(:,:,3)*4+s(:,:,4)*8+s(:,:,5)*16+s(:,:,6)*32+s(:,:,7)*64+s(:,:,8)*128; 
    subplot(3,3,9);
    imshow(uint8(rec));
    title('Recovered Image')
   
    %% NOISE REDUCTION BY AVERAGING FILTER
I = imread('rice.png');
figure
imshow(I)
J = imnoise(I,'salt & pepper',0.05);
imshow(J);
title('NOISE ADDED');
figure
Kaverage = filter2(fspecial('average',3),J)/255;

imshow(Kaverage);
title ('Noise Removed Partially');
figure
Kmedian = medfilt2(J);
imshowpair(Kaverage,Kmedian,'montage')

%% (B) SPATIAL FILTERING
%% SMOOTHENING FILTER
%%lpf

x=imread('cameraman.tif');

f1=1/9*[1 1 1;1 1 1;1 1 1];

x1=x(1:256,1:256);
y1=conv2(x1,f1);

subplot(2,2,1);
imshow(x);
title('IMAGE ')
subplot(2,2,2);
imshow(uint8((y1)));
title('low pass filtering')

%% geometric mean
%% rank order filters

A = imread('snowflakes.png');

B = ordfilt2(A,1,ones(3,3));

C = ordfilt2(A,9,ones(3,3));
D = ordfilt2(A,5,ones(3,3));
figure
subplot(2,2,1)
imshow(A)
title('ORIGINAL')
subplot(2,2,2)
imshow(B)
title('MIN FILTER ')
subplot(2,2,3)
imshow(C)
title('MAX FILTER ')

subplot(2,2,4)
imshow(D)
title('MEDIAN FILTER ')


%% SHARPENING FILTERS
%% HIGH PASS
x=imread('cameraman.tif');
f2=1/9*[-1 -1 -1;-1 8 -1;-1 -1 -1];

x2=x(1:256,1:256);
y2=conv2(x2,f2);
figure
imshow(x);
title('IMAGE ')
figure
imshow(uint8((y2)));
title('high pass filtering')

%% high boost
f=imread('football.jpg');
figure
imshow(f);
a=size(f);
disp(a);
title('org=f');
for x=2:449
    for y=2:599
        g(x,y)=f(x,y+1)+f(x,y-1)+f(x-1,y)+f(x+1,y)-4*f(x,y);
        %g(x,y)=-f(x,y+1)-f(x,y-1)-f(x-1,y)-f(x+1,y)+4*f(x,y);
        %g(x,y)=f(x-1,y-1)+f(x-1,y)+f(x-1,y+1)+f(x,y-1)-8*f(x,y)+f(x,y+1)+f(x+1,y-1)+f(x+1,y)+f(x+1,y+1);
       
    end;
end;
for x=2:449
    for y=2:599
d(x,y)=f(x,y)+g(x,y);
    end;
end;
 figure
imshow(g);
 title('chngd=g  i.e. edges =>  higher freq components');  
figure
 imshow(d)
 title('f+g i.e. modified=org+edges ');