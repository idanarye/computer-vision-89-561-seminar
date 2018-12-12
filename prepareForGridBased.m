function prepareForGridBased(im)
% showMulti({im, gray, edge(gray), colorTags(bwlabel(im2bw(im, 'concavity')))})
imbw = im2bw(im, 'concavity');
if imbw(1, 1)
	imbw = not(imbw);
end
centroid = getMainCentroid(imbw);
showMulti({im, focusCentroid(imbw, centroid)});
end
