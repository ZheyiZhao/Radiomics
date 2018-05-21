
%LOAD IN THE DATA
load('Example_Data')

%RUN HOG3D WITH EACH CELL MADE UP OF 16x16x16 VOXELS, IN BLOCKS MADE UP OF
%4x4x4 CELLS WITH AN OVERLAP OF 2 CELLS FOR THE BLOCK POSITIONS.
theta_histogram_bins = 9;
phi_histogram_bins = 18;
cell_size = 16;
block_size = 2;
step_size = 2;

%features = hog3d(MRI_volume, cell_size, block_size, theta_histogram_bins, phi_histogram_bins, step_size);
features = hog3d(Bottle_volume, cell_size, block_size, theta_histogram_bins, phi_histogram_bins, step_size)

%VISUALISE THE FEATURES
plot_hog3d(features, cell_size, theta_histogram_bins, phi_histogram_bins);
view([45,45]);