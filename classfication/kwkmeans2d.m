clear;
load adcimg2dfea.mat;


x=[imgfea2Dt1;imgfea2Dt2;imgfea2Dt3;imgfea2Dt4];
idx4 = kmeans(x,4, 'Distance','sqeuclidean','Display','iter');

figure
[silh4,h] = silhouette(x,idx4,'sqeuclidean');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value'
ylabel 'Cluster'

figure
plot(idx4,'*')