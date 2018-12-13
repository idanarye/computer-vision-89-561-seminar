function [gridShown] = splitToGrid(im, rows, cols)
imbw = ensureBW(im);
gridShown = zeros(size(im)(1:2));
cellSize = floor(size(imbw)(1:2) ./ [rows, cols]);
gridPercentages = zeros(rows, cols);
for r = 1:rows
    for c = 1:cols
        cellEnd = cellSize .* [r, c];
        cellStart = cellEnd - cellSize + [1, 1];
        imCell = imbw(cellStart(1):cellEnd(1), cellStart(2):cellEnd(2));
        gridPercentages(r, c) = sum(sum(imCell)) / prod(size(imCell));
        % if mod(r + c, 2)
            % gridShown(cellStart(1):cellEnd(1), cellStart(2):cellEnd(2)) = not(imCell);
        % end
    end
end
gridShown = gridPercentages;
end
