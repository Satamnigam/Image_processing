%%laplacian filter

clear
clear all;
a=imread('peppers.png');
a=rgb2gray(a);           %converting colored image into grayscale image
[r c]=size(a);            %getting size of image
a=im2double(a);          %converting image format into double format
filter=[-1 -1 -1;-1 8 -1; -1 -1 -1]; %laplacian mask
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
result;
 subplot(2,2,1)
 imshow(a);
 subplot(2,2,2)
imshow(result);