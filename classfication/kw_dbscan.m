
%% Load Data

clear;
load m.mat;

%使用筛选特征
textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
featureSelMat= [firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) ,wavelettotalFv(:,[14 8 4 21 15 30 10 34])];

%% Run DBSCAN Clustering Algorithm

epsilon=0.5;
MinPts=10;
IDX=DBSCAN(featureSelMat,epsilon,MinPts);


%% Plot Results

PlotClusterinResult(featureSelMat, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
