% entry_point

% im = imread('hammer4.jpeg');
prepareForGridBased(imread('hammer2.jpeg'));
% prepareForGridBased(imread('hammer4.jpeg'));

% gray = rgb2gray(im);

% % imshow(colorTags(bwlabel(gray)))
% % showMulti(im, gray, edge(gray), colorTags(bwlabel(gray, 8)))
% % showMulti({im, gray, edge(gray), colorTags(bwlabel(im2bw(im, 'moments')))})
% showMulti({im, gray, edge(gray), colorTags(bwlabel(im2bw(im, 'concavity')))})
% % showMulti([1 2], [3 4])


% allMethods = {'Otsu' 'concavity' 'intermodes' 'intermeans' 'MaxEntropy' 'MaxLikelihood' 'mean' 'MinError' 'minimum' 'moments' 'percentile'};

% allMethods = [cellslices(allMethods, 1, 5){1}, cellslices(allMethods, 7, 11){1}]

% % showMulti(arrayfun(@(method)(im2bw(im, method{1})), allMethods, 'UniformOutput', false))
