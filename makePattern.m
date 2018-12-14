function [pattern] = makePattern(base, targetSize)
if 3 == length(size(base))
	targetSize(3) = size(base)(3);
end
pattern = repmat(base, ceil(targetSize ./ size(base)));
pattern = pattern(1:targetSize(1), 1:targetSize(2), :);
end
