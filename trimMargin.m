function [trimmedIm] = trimMargin(im)
for top = 1:size(im, 1)
	if not(isUniform(im(top, :, :)))
		break
	end
end
for bot = size(im, 1):-1:1
	if not(isUniform(im(bot, :, :)))
		break
	end
end

for left = 1:size(im, 2)
	if not(isUniform(im(:, left, :)))
		break
	end
end
for right = size(im, 2):-1:1
	if not(isUniform(im(:, right, :)))
		break
	end
end

trimmedIm = im(top:bot, left:right, :);
end


function [answer] = isUniform(subIm)
answer = true;
for c = 1:size(subIm, 3)
	if max(subIm(:, :, c)) != min(subIm(:, :, 1))
		answer = false;
		return
	end
end
end
