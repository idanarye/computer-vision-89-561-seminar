function [intersection] = myIntersectRayPolygon(ray, poly)
pkg load geometry
intersections = intersectLinePolygon(ray, poly);
if size(intersections, 1) == 0
	intersection = [];
	return
end
rayDir = [ray(3) ray(4)];
rayDir = rayDir / norm(rayDir);
vec1 = intersections(1, :) - [ray(1), ray(2)];
vec2 = intersections(2, :) - [ray(1), ray(2)];
dir1 = vec1 / norm(vec1);
dir2 = vec2 / norm(vec2);

if norm(dir1 - rayDir) < norm(dir2 - rayDir)
	intersection = intersections(1, :);
else
	intersection = intersections(2, :);
end
end
