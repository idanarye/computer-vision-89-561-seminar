function prepareForGridBased(im)
% showMulti({im, gray, edge(gray), colorTags(bwlabel(im2bw(im, 'concavity')))})
imbw = im2bw(im, 'concavity');
if imbw(1, 1)
	imbw = not(imbw);
end
showMulti({im, focusMainCentroid(im)});
% imshow(aligned);
end
