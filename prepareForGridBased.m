function [grid, pavement] = prepareForGridBased(im, gridPattern, pavementSize, writeIm)
writeIm('base', im);
imbw = im2bw(im, 'concavity');
if imbw(1, 1)
	imbw = not(imbw);
end
writeIm('bw', imbw);
focused = focusMainCentroid(imbw);
writeIm('focused', focused);
grid = splitToGrid(focused, 10, 10);
pavement = makePavement(grid, makePattern(gridPattern, pavementSize ./ size(grid)));
writeIm('grid', pavement);
end
