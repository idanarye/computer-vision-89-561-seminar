function centroid = getMainCentroid(im)
props = regionprops(bwlabel(im), 'Orientation', 'MajorAxisLength', 'MinorAxisLength', 'Centroid', 'Extrema');
[majorAxisLength, centroidIndex] = max([props.MajorAxisLength]);
centroid = [props](centroidIndex);
end
