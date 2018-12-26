function [angles, thetas] = triangleAngles(points)
angles = [];
thetas = [];
for i = 1:3
	thisPoint = points(i, :);
	otherPoints = points(1 + mod([i i + 1], 3), :);
	v1 = otherPoints(1, :) - thisPoint;
	v2 = otherPoints(2, :) - thisPoint;
	angles = [angles; vectorAngle(v2, v1)];
	thetas = [thetas; vectorAngle(flip(v1))];
end
if 2 * pi < sum(angles)
	angles = 2 * pi - angles;
	thetas = thetas - angles;
	% [angles, thetas] = triangleAngles(flipud(points));
end
end
