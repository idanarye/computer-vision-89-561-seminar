function [rgbim] = bw2rgb(bwim, rgb)
rgbim = uint8(cat(3, bwim * rgb(1), bwim * rgb(2), bwim * rgb(3)));
end
