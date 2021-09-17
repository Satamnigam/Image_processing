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


 %% laplacian
 
a=imread('peppers.png');
a=rgb2gray(a);
[r c]=size(a)
a=im2double(a);
filter=[-1 -1 -1;-1 8 -1; -1 -1 -1];
result=a;
for i=2:r-1
    for j=2:c-1
        sum=0;
        row=0;
        col=1;
        
        for k=i-1:i+1
            row=row+1;
            col=1;
            for l=j-1:j+1
                sum = sum+a(k,l)*filter(row,col);               
                col=col+1;
            end
        end
      result(i,j)=sum;      
    end
end
result
 subplot(2,2,1);
 imshow(a);
 subplot(2,2,2)
imshow(result);