%% (Haar Wavelet Transform of an Image)
% Applying Haar Transform to compute multiresolution Image Processing
% Basic Concept (SUMMARY)
% 1. Read an Input Image 
% 2. Resizing the Image to 1024 x 1024 Image 
% 3. Defining the Haar Filter Matrix { 1/sqrt(2)*[1 1; 1 -1] }
% 4. Performing Filtering 
%    Along Colms and then Along Rows and downsample by 2
%    Updating the Output Image iteratively
% 5. Display of Multiresolution Image
% 6. Performing Restoration
%    Along Rows and then Along Colms and upsampling by 2
%    Updating the Output Image iteratively
% 7. Display the Final Restored Img
% REFENCE USED
% 1. Chapter 7 (DIP Book by Gonzales)
% 2. https://www.numerical-tours.com/matlab/wavelet_2_haar2d/
clc
close all
clear all
%% Image Read and Conversion to GrayScale
in_img = imread('cameraman.tif');
in_img = imresize(in_img,[1024 1024]); % Resizing the Input Image to 1024 x 1024
% in_img = rgb2gray(in_img);   % Coloured to Gray Conversion
in_img = im2double(in_img); % Converting the Img Class to Double
[in_colm, in_row] = size(in_img); % Size of input image
%% Performing Transformation
sqrt2 = sqrt(2);
out_img = zeros(in_colm,in_row);
% Computing for Max Level in our case 1024 ie 10 Levels
lvl_count = 1;
while (lvl_count*2 <= in_colm) % For colm Ops
    lvl_count = lvl_count*2;
end
%  Transformation Along Colms and downsampling by 2
while (1 < lvl_count) % 1024, 512, 256,...,1
    lvl_count = floor(lvl_count/2);  
    %  haar_matrix = 1/sqrt(2)*[1 1; 1 -1] implementation
    out_img(1:lvl_count, :) = (in_img(1:2:2*lvl_count-1, :) + in_img(2:2:2*lvl_count, :))/sqrt2;
    out_img(lvl_count+1:lvl_count+lvl_count, :) = (in_img(1:2:2*lvl_count-1, :) - in_img(2:2:2*lvl_count, :))/sqrt2;
    in_img(1:2*lvl_count, :) = out_img(1:2*lvl_count, :); % Updating Colms
end
lvl_count = 1;
while (lvl_count*2 <= in_row) % For row ops
    lvl_count = lvl_count*2;
end
%  Transformation Along Rows and downsampling by 2
while (1 < lvl_count)
    lvl_count = floor(lvl_count/2); % In this case K will be 1024, 512, 256....1
    out_img(:, 1:lvl_count) = (in_img(: ,1:2:2*lvl_count-1) + in_img(: ,2:2:2*lvl_count))/sqrt2;
    out_img(:, lvl_count+1:lvl_count+lvl_count) = (in_img(: ,1:2:2*lvl_count-1) - in_img(: ,2:2:2*lvl_count))/sqrt2;
    in_img(:, 1:2*lvl_count) = out_img(:,1:2*lvl_count); % Updating Rows
end
figure(1)
imshow(in_img), title('Haar Transformation on Input Image');
% imshow(in_img(1:(in_colm),1:(in_row))), title('Haar Transformation on Input Image');
%% Reconstruction of Original Image by Performing Inverse Haar Transformation
%  Inverse transform Along Rows and upsampling by 2
lvl_count = 1;
while (lvl_count*2 <= in_row)
    in_img(:, 1:2:2*lvl_count-1) = (out_img(: ,1:lvl_count) + out_img(: ,1+lvl_count:lvl_count+lvl_count))/sqrt2;
    in_img(:, 2:2:2*lvl_count) = (out_img(: ,1:lvl_count) - out_img(: ,1+lvl_count:lvl_count+lvl_count))/sqrt2;
    out_img(:, 1:2*lvl_count) = in_img(:, 1:2*lvl_count); % Updating Rows
    lvl_count = lvl_count*2;
end
%  Inverse transform Along Colms and upsampling by 2
lvl_count = 1;
while (lvl_count*2 <= in_colm)
    in_img(1:2:2*lvl_count-1, :) = (out_img(1:lvl_count, :) + out_img(1+lvl_count:lvl_count+lvl_count, :))/sqrt2;
    in_img(2:2:2*lvl_count, :) = (out_img(1:lvl_count, :) - out_img(1+lvl_count:lvl_count+lvl_count, :))/sqrt2;
    out_img(1:2*lvl_count, :) = in_img(1:2*lvl_count, :); % Updating Colms
    lvl_count = lvl_count*2;
end
figure(2)
imshow(out_img,[]), title('Final Restored Image');
