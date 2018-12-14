function prepareForFourierDescriptors(im, writeIm)
pkg load geometry

[poly, polyIm] = bw2polygon(im, 0.02);
imshow(polyIm);
drawPolygon(poly .+ [100 200]);
end
