clc;
img_mat = 1:50;
for i = 2:99
    img_mat(i,:) = img_mat(i-1,:) + 22;
end 
imshow(mat2gray(img_mat));