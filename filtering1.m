originalRGB=imread('D:\Wallpapers\17.jpg');
imshow(originalRGB);
h=fspecial('motion',50,45);
filteredRGB=imfilter(originalRGB,h);
figure,imshow(filteredRGB);
boundaryReplicateRGB=imfilter(originalRGB,h,'replicate');
figure,imshow(boundaryReplicateRGB);