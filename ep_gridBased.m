pkg load image;

baseDir = 'output/gridbased';
pavementSize = [200, 200];
pattern1 = [1, 0, 0, 0];
basePattern = [1 zeros(1, 5)];
[grid1, pavement1] = prepareForGridBased(imread('hammer1.jpeg'), bw2rgb(basePattern, [255, 0, 0]), pavementSize, makeImageWriteFn(baseDir, 'h1_', '.png'));
[grid2, pavement2] = prepareForGridBased(imread('hammer2.jpeg'), bw2rgb(basePattern', [0, 255, 0]), pavementSize, makeImageWriteFn(baseDir, 'h2_', '.png'));
[grid3, pavement3] = prepareForGridBased(imread('clock1.jpeg'), bw2rgb(basePattern', [0, 0, 255]), pavementSize, makeImageWriteFn(baseDir, 'c1_', '.png'));

writeIm = makeImageWriteFn(baseDir, 'j_', '.png');

writeIm('joined1', max(pavement1, pavement2));
writeIm('joined2', max(pavement1, pavement3));

writeIm('compare1', imresize(grid1 == grid2, [100, 100], 'nearest'));
writeIm('compare2', imresize(grid1 == grid3, [100, 100], 'nearest'));
