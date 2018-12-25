function prepareForTouchPointAngleVertexSequence(im, writeIm)
pkg load geometry

[poly, polyIm] = bw2polygon(im, 0.02);
delete(gcf)
polyIm = polyIm';
% imshow(polyIm)
hold off
drawPolygon(poly);
% polygonCenter = sum(poly) / size(poly, 1);
polygonCenter = getMainCentroid(im, 'Centroid').Centroid;
hold on
% drawCircle(polygonCenter(2), polygonCenter(1), 10);
for vertex = poly'
	% vertex = vertex' - polygonCenter;
	line([polygonCenter(2), vertex(1)], [polygonCenter(1), vertex(2)]);
	% drawLine(createLine(polygonCenter(2), polygonCenter(1), vertex(2), vertex(1)));
end
hold off
end
