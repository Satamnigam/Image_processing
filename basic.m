clear all;
a=imread ('https://ichef.bbci.co.uk/news/976/cpsprodpb/14A35/production/_115033548_gettyimages-1226314512.jpg');
rgbImage=a;
figure(1);
subplot(1,1,1);
imshow(a); %Original Image
title('Original Image');

figure(2);
b = rgb2gray(a); 
subplot(2,2,1);
imshow(b);
title('Gray Image');

red = rgbImage(:, :, 1);
subplot(2,2,2);
z = zeros(size(red));
redAppearingImage = cat(3, red, z, z);
imshow(redAppearingImage);
title('Red Component');

green = rgbImage(:, :, 2);
greenAppearingImage = cat(3,z, green, z);
subplot(2,2,3);
imshow(greenAppearingImage);
title('Green Component');

blue = rgbImage(:, :, 3);
blueAppearingImage = cat(3,z, z, blue);
subplot(2,2,4);
imshow(blueAppearingImage);
title('Blue Component');