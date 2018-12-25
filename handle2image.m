function [im] = handle2image(handle)
saveas(handle, '/tmp/badapi.pdf');
im = imread('/tmp/badapi.pdf');
im = trimMargin(im);
end
