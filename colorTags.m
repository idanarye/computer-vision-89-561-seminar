function [taggedImage] = colorTags(tags)
taggedImage = ind2rgb(tags + 1, jet(1 + max(max(tags))));
end
