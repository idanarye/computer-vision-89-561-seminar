function [imOut] = prepareForFourierDescriptors(im, writeIm)
writeIm('base', im);
hold off

% f = figure("visible", false);
f = gcf;
clf;
hold on

polygonCenter = getMainCentroid(im, 'Centroid').Centroid;
[poly, polyIm] = bw2polygon(im, 0.02);
polyIm = polyIm';
imshow(polyIm);
writeIm('outline', handle2image(f));
radials = [];
for theta = partsRange(10) * pi * 2
	ray = createRay(polygonCenter(2), polygonCenter(1), theta);
	intersection = myIntersectRayPolygon(ray, poly);
	drawPolyline([polygonCenter; fliplr(intersection)], 'color', 'red', 'linewidth', 2);
	radials = [radials norm(fliplr(intersection) - polygonCenter)];
end
drawCircle(polygonCenter, 3, 'color', 'blue', 'linewidth', 6);
writeIm('radials', handle2image(f));

% clf
% hist(radials)
% radials

% delete(f);
clf
bar(radials, 0.1, 'facecolor', 'red');
hold on
plot(radials, 'linewidth', 5, 'color', 'green');

writeIm('radialsHist', handle2image(f));

clf
radialsFT = abs(fft(radials));
bar(0:length(radialsFT) - 1, radialsFT, 0.1, 'facecolor', 'yellow');
hold on
plot(0:length(radialsFT) - 1, radialsFT, 'linewidth', 5, 'color', 'magenta');

writeIm('radialsFourier', handle2image(f));

clf
radialsNorm = radialsFT / radialsFT(1);
radialsNorm = radialsNorm(2:end);
bar(radialsNorm, 0.1, 'facecolor', 'yellow');
hold on
plot(radialsNorm, 'linewidth', 5, 'color', 'magenta');

writeIm('radialsFourierNormalized', handle2image(f));

hold off
end
