function [result] = makePavement(grid, pattern)
result = imresize(grid, size(pattern)(1:2) .* size(grid), 'nearest');
result = result .* makePattern(pattern, size(result));
end
