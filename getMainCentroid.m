function centroid = getMainCentroid(im, varargin)
im = ensureBW(im);
props = regionprops(bwlabel(im), 'MajorAxisLength', varargin{:});
[majorAxisLength, centroidIndex] = max([props.MajorAxisLength]);
centroid = [props](centroidIndex);
end
