clear all
%specify image
im_size= [128, 128];
e = double (imread('https://ichef.bbci.co.uk/news/976/cpsprodpb/14A35/production/_115033548_gettyimages-1226314512.jpg'));
X = imresize (e (1, :), im_size);

% Grab some kind of filter/PSF
PSF_dim = [4,4];
PSF = ones (PSF_dim);
PSF = PSF ./ norm (PSF (:));

% Generate the matrix
H = convmtx2 (PSF, im_size);

% Calculate convolution
tic
Y = H*X(:);
matrix_time = toc

% Reshape the solution
new_dim = [ (im_size(1) + PSF_dim(1)-1) (im_size (2) +PSF_dim (2)-1)];
Y = reshape (Y, new_dim);

% Comparison Using conv2
tic
Y2 = conv2 (X, PSF, 'full');
function_time = toc
Y2 = reshape (Y2, new_dim);

% Display the result

figure (1);
subplot(1,3,1);
imshow(X,[]);
title ('Original Image');
subplot(1,3,2);
imshow(Y,[]);
title ('Convoulted Image');
subplot(1,3,3);
imshow(Y2,[]);
title ('Convoulted Image with "conv2" function');