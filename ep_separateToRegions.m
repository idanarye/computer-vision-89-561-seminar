pkg load image;
pkg load geometry;

% im = imread('tiger2.jpeg');
im = imread('log1.jpeg');

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
% imshow(rgb2gray(im) < 254)
% imwrite(rgb2gray(im) < 254, 'logShape.png')
% rhist = imhist(im(:, :, 1));
% ghist = imhist(im(:, :, 2));
% bhist = imhist(im(:, :, 3));
% imhist(rgb2hsv(im)(:, :, 1))
size(im)
texturePart = ((im(70:140, 380:450, :)));
imshow(texturePart)
imwrite(rgb2gray(texturePart), 'texture.png')
% imwrite((rgb2gray(im(250:300, 250:300, :))), 'texture.png')
% [ind, map] = rgb2ind(im);
% imhist(ind, map)
% imHsv = rgb2hsv(im);
% imhist(imHsv(:, :, 1))
% colormap(summer(64))
