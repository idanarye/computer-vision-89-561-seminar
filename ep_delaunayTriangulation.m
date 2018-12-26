pkg load image;
pkg load geometry;

baseDir = 'output/delaunay_triangulation';

prepareForDelaunayTriangulation(imread('hammer1.jpeg'), makeImageWriteFn(baseDir, 'h1_', '.png'));
prepareForDelaunayTriangulation(imread('hammer2.jpeg'), makeImageWriteFn(baseDir, 'h2_', '.png'));
prepareForDelaunayTriangulation(imread('clock1.jpeg'), makeImageWriteFn(baseDir, 'c1_', '.png'));
