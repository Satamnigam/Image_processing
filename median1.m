clear all

%READ AN IMAGE
I = imread('autumn.tif');
display(size(I));

%CONVERT RGB IMAGE INTO GRAYSCALE
A = rgb2gray(I);

%ADD SALT AND PEPPER NOISE TO THE GRAYSCALE IMAGE
A = imnoise(A,'Salt & pepper',0.1);

figure,imshow(A);title('IMAGE WITH SALT AND PEPPER NOISE');
%DEFINE THE WINDOW SIZE MXN
M=5;
N=5;

%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA=padarray(A,[floor(M/2),floor(N/2)]);
figure,imshow(uint8(modifyA)); title('PADDED WITH ZEROS');
B = zeros([size(A,1) size(A,2)]);
med_indx = round((M*N)/2); %MEDIAN INDEX

for i=1:size(modifyA,1)-(M-1)
    for j=1:size(modifyA,2)-(N-1)
       
       
        temp=modifyA(i:i+(M-1),j:j+(N-1),:);
        tmp_sort = sort(temp(:));%tmp(:) converts 2D matrix to 1D matrix
        B(i,j) = tmp_sort(med_indx);
      
      
       
    end
end


 %CONVERT THE IMAGE TO UINT8 FORMAT.
B=uint8(B);
figure,imshow(B);
title('IMAGE AFTER MEDIAN FILTERING');