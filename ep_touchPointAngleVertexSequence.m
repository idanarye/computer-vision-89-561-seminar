pkg load image;
pkg load geometry;

baseDir = 'output/touch_point_angle_vertex_sequence';

prepareForTouchPointAngleVertexSequence(imread('hammer1.jpeg'), makeImageWriteFn(baseDir, 'h1_', '.png'));
prepareForTouchPointAngleVertexSequence(imread('hammer2.jpeg'), makeImageWriteFn(baseDir, 'h2_', '.png'));
prepareForTouchPointAngleVertexSequence(imread('clock1.jpeg'), makeImageWriteFn(baseDir, 'c_', '.png'));
