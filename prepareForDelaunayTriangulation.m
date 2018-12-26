function prepareForDelaunayTriangulation(im, writeIm)
writeIm('base', im);
% hold off

[poly, polyIm] = bw2polygon(im, 0.1);
numBins = 9;
binSizeDeg = 180 / numBins;
halfBinDeg = binSizeDeg / 2;

f = gcf;
clf;
hold on

imshow(im);

% poly
triangulation = delaunay(poly);
triplot(triangulation, poly(:, 2), poly(:, 1), 'linewidth', 3)
allAngles = [];
for row = triangulation'
	triangle = poly(row, :);
	[angles, thetas] = triangleAngles(triangle);
	allAngles = [allAngles; angles];
	for i = 1:3
		point = triangle(i, :);
		drawCircleArc(point(2), point(1), 40, rad2deg(thetas(i)), rad2deg(angles(i)), 'linewidth', 3);
	end
end

writeIm('angles', handle2image(f));


clf;
binsDeg = partsRange(numBins) * 180 + halfBinDeg;
h = hist(allAngles, deg2rad(binsDeg));
% binsText = [num2str(binsDeg' - 5) repelem(' - ', length(binsDeg), 1) num2str(binsDeg' + 5)];
binsText = arrayfun(@(b) sprintf('%d\n|\n%d', b - halfBinDeg, b + halfBinDeg), binsDeg, 'un', false);
bar(h, 0.8, 'facecolor', [1 0 1]);
set(gca, 'xtick', 1:numBins);
set(gca, 'xticklabel', binsText);

writeIm('angleHistogram', handle2image(f));

% hold off
end
