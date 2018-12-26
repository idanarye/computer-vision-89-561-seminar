pkg load image;
pkg load geometry;

im = imread('tiger2.jpeg');

% method = 'Otsu';
% method = 'concavity';
% method = 'intermodes';
% method = 'intermeans';
% method = 'MaxEntropy';
% method = 'MaxLikelihood';
% method = 'mean';
% method = 'MinError';
% method = 'minimum';
% method = 'moments';
% method = 'percentile';

% imshow(im2bw(im, method));

% edge(rgb2gray(im), 'Lindeberg', 2);
% imshow(im2bw(im, 'minimum'))
% imshow(im)
% imshow(rgb2gray(im) < 255)
% rhist = imhist(im(:, :, 1));
% ghist = imhist(im(:, :, 2));
% bhist = imhist(im(:, :, 3));
% imhist(rgb2hsv(im)(:, :, 1))
% imwrite((rgb2gray(im(250:300, 250:300, :))), 'texture.png')
% [ind, map] = rgb2ind(im);
% imhist(ind, map)
imHsv = rgb2hsv(im);
imhist(imHsv(:, :, 1))
colormap(summer(64))
