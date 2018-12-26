function prepareForTouchPointAngleVertexSequence(im, writeIm)
writeIm('base', im);
% im = padarray(im, [150, 150]);
hold off

% f = figure("visible", false);
f = gcf;
clf;
hold on

polygonCenter = getMainCentroid(im, 'Centroid').Centroid;
[poly, polyIm] = bw2polygon(im, 0.04);
polyIm = polyIm';
imshow(polyIm);
writeIm('outline', handle2image(f));

% polygonCenter = getMainCentroid(im, 'Centroid').Centroid;
circle = findMBC(fliplr(poly));
center = fliplr(circle(1:2));
% center = flip(polygonCenter);
% drawCircle(circle);
thetas = [];
prevTheta = [];
veclens = [];
for vertex = poly'
	vertex = vertex';
	vec = vertex - center;
	veclens = [veclens; norm(vec)];
	theta = atan2(vec(1), vec(2));
	thetas = [thetas; theta];
	drawPolyline(fliplr([center; vertex]), 'color', 'red', 'linewidth', 2);
end
thetas = sort(thetas);
thetas = [thetas; thetas(1)];
angles = [];
for i = 1:(size(thetas) - 1)
	t1 = thetas(i);
	t2 = thetas(i + 1);
	while t1 < 0
		t1 = t1 + 2 * pi;
	end
	while t2 < t1
		t2 = t2 + 2 * pi;
	end

	angle = t2 - t1;
	angles = [angles angle];

	drawCircleArc(center(2), center(1), max(veclens) * (0.1 + 0.06 * (t2 - t1)), rad2deg(t1), rad2deg(angle), 'linewidth', 2);
end
writeIm('angles', handle2image(f));

clf;
bar(angles, 0.1, 'facecolor', 'red');
writeIm('anglesHist', handle2image(f));
clf;
anglesFourier = abs(fft(angles, 10));
bar(0:(length(anglesFourier) - 1), anglesFourier, 0.1, 'facecolor', 'yellow');
writeIm('anglesFourier', handle2image(f));
hold off
end
