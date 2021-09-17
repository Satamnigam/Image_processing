%I = imread('pout.tif');
I1 = imread('cameraman.tif');
mask=255*zeros(size(I1));
mask=insertShape(mask,'line',[50 50 250 250],'linewidth',10,'color',[255 255 0]);
mask=uint8(mask);
subplot(1,3,1);
imshow(im);
title('original');
subplot(1,3,2);
imshow(mask);
subplot(1,3,3);
imshow(im3);
title('combine')


