function [imbw] = ensureBW(im)
if isa(im, 'logical')
    imbw = im;
else
    imbw = im2bw(im, 'concavity');
    if imbw(1, 1)
        imbw = not(imbw);
    end
end
end
