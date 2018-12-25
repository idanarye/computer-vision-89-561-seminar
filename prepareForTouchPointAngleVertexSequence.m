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
circleCenter = circle(1:2);
% drawCircle(circle);
thetas = [];
prevTheta = [];
for vertex = poly'
	vertex = vertex';
	vec = vertex - circleCenter;
	theta = atan2(vec(1), vec(2));
	thetas = [thetas; theta];
	drawPolyline(fliplr([circleCenter; vertex]), 'color', 'red', 'linewidth', 2);
end
sort(thetas);
thetas = [thetas; thetas(1)];
angles = [];
for i = 1:(size(thetas) - 1)
	t1 = thetas(i);
	t2 = thetas(i + 1);
	if t2 < t1
		t2 = t2 + 2 * pi;
	end

	angle = t2 - t1;
	angles = [angles angle];

	drawCircleArc(circleCenter(2), circleCenter(1), circle(3) * (0.1 + 0.03 * (t2 - t1)), rad2deg(t1), rad2deg(angle), 'color', 'green');
end
writeIm('angles', handle2image(f));

clf;
bar(angles, 0.1, 'facecolor', 'red');
writeIm('anglesHist', handle2image(f));
clf;
bar(0:size(angles) - 1, fft(angles, 10), 0.1, 'facecolor', 'yellow');
writeIm('anglesFourier', handle2image(f));
hold off
end
