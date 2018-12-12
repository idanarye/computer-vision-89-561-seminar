function [newIm] = focusCentroid(im, centroid)
newIm = im;
% centralize

minX = ceil(min(centroid.Extrema(:, 1)));
maxX = floor(max(centroid.Extrema(:, 1)));
minY = ceil(min(centroid.Extrema(:, 2)));
maxY = floor(max(centroid.Extrema(:, 2)));
newIm = newIm(minY:maxY, minX:maxX, :);

newIm = imrotate(im, -centroid.Orientation, 'linear');

end
