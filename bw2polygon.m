function [poly, polyIm] = bw2polygon(im, tolRatio)
pkg load geometry
boundaries = bwboundaries(ensureBW(im));
[_, maxIndex] = max(arrayfun(@(im) size(im{1}, 1), boundaries));
boundary = boundaries{maxIndex};

minCoord = min(boundary);
maxCoord = max(boundary);
tol = sqrt(sum((maxCoord - minCoord) .^ 2)) * tolRatio;

poly = simplifyPolygon(boundary, 'tol', tol);
mask = poly2mask(poly(:, 1), poly(:, 2), maxCoord(2), maxCoord(1));
polyIm = edge(1.0 * mask, 'Canny');
end
