function [rng] = partsRange(num, includeEnd=false)
if includeEnd
	rng = (0:(num)) / num;
else
	rng = (0:(num - 1)) / num;
end
end
