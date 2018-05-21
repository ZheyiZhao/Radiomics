clear;
load adc.mat;

%使用筛选特征
textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
featureSelMat= [sobelTotalFV, hogTotalFV,firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) ,wavelettotalFv(:,[14 8 4 21 15 30 10 34])];

% x=[sobelTotalFV, hogTotalFV,firstOrderSelFv textureMat, shapetotalF,wavelettotalFv];
x=firstOrdertotalFv;

idx4 = kmeans(x,4, 'Distance','sqeuclidean','Display','iter');

figure
[silh4,h] = silhouette(x,idx4,'sqeuclidean');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value'
ylabel 'Cluster'

figure
plot(idx4,'*')