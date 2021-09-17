clear all;
close all;
img_mat(1,1:256) = 0;
for i = 2:64
    img_mat(i,1:256) = img_mat(i-1,1:256) + 4;
end
imshow(mat2gray(img_mat));