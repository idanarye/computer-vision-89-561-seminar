function [fn] = makeImageWriteFn(dir, base, ext)
mkdir(dir);
if dir(end) != '/'
	dir = [dir '/'];
end
fn = @(name, im) imwrite(im, [dir base name ext]);
end
