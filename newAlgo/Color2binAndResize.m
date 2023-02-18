function [bnImg,grayImg] = Color2binAndResize(colorImg)
%COLOR2BNAndResize Summary of this function goes here
%   change the rgb color image to a black and white image and a binary
%   image resize them to 400 cols and 400 rows
img = imread(colorImg);
grayImg = im2gray(img);
bnImg = imbinarize(img);
grayImg = imresize(grayImg,[400,400]);
bnImg = imresize(bnImg,[400,400]);
end

