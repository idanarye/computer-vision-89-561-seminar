function showMulti(images)
width = max(arrayfun(@(im) size(im{1}, 2), images));

line = ones(1, width, 3);
separator = [line * 255; line * 0; line * 255];

result = [];

for i = 1:length(images)
    if 1 < i
        result = [result; separator];
    end

    im = images{i};
    if isa(im, 'logical')
        im = im * 255;
    elseif isa(im, 'double')
        im = uint8(im * 255);
    end
    if size(im, 3) == 1
        im = cat(3, im, im, im);
    end
    if size(im, 2) < width
        paddingWidth = width - size(im, 2);
        im = [im zeros(size(im, 1), paddingWidth, 3)];
    end
    result = [result; im];
end
imshow(result);
end
