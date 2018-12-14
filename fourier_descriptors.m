% entry_point

baseDir = 'output/fourier_descriptors';

prepareForFourierDescriptors(imread('hammer2.jpeg'), makeImageWriteFn(baseDir, 'h1_', '.png'));
