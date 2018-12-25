% entry_point

baseDir = 'output/fourier_descriptors';

prepareForFourierDescriptors(imread('hammer1.jpeg'), makeImageWriteFn(baseDir, 'h1_', '.png'));
prepareForFourierDescriptors(imread('hammer2.jpeg'), makeImageWriteFn(baseDir, 'h2_', '.png'));
prepareForFourierDescriptors(imread('clock1.jpeg'), makeImageWriteFn(baseDir, 'c1_', '.png'));
