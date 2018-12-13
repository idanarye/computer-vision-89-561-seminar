function [newIm] = focusMainCentroid(im)
imbw = ensureBW(im);

newIm = im;

orientation = getMainCentroid(imbw, 'Orientation').Orientation;
newIm = imrotate(newIm, -orientation, 'linear');
imbw = imrotate(imbw, -orientation, 'linear');

extrema = getMainCentroid(imbw, 'Extrema').Extrema;
minX = ceil(min(extrema(:, 1)));
maxX = floor(max(extrema(:, 1)));
minY = ceil(min(extrema(:, 2)));
maxY = floor(max(extrema(:, 2)));
newIm = newIm(minY:maxY, minX:maxX, :);

end
