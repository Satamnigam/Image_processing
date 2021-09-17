    %% NOISE REDUCTION BY AVERAGING FILTER
I = imread('coins.png');
imshow(I);
title('Original Image before adding Noise');
figure

J = imnoise(I,'salt & pepper',0.05);
imshow(J);
title('NOISE ADDED');
figure
Kaverage = filter2(fspecial('average',3),J)/255;

imshow(Kaverage);
title ('Noise Removed Partially');
figure
Kmedian = medfilt2(J);
imshow(Kmedian);
title('Noise removed completely');
figure