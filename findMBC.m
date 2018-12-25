function [circle] = findMBC(poly)
if size(poly, 1) < 3
	return
elseif size(poly, 1) == 3
	circle = createCircle(num2cell(poly, 2){:});
else
	circle = welzl(poly, []);
end
end

function [circle] = welzl(P, R)
if 3 <= size(R, 1)
	circle = createCircle(num2cell(R, 2){:});
	return
end
if size(P, 1) == 0
	if size(R) == 1
		circle = [R 0];
	elseif size(R) == 2
		midpoint = sum(R) / 2;
		circle = createCircle(midpoint, R(1, :));
	else
		circle = [0 0 0];
	end
	return
end
p = P(1, :);
P = P(2:end, :);
circle = welzl(P, R);
if not(isPointInCircle(p, circle))
	R = [R; p];
	circle = welzl(P, R);
end
end
