
clear;
load m.mat;
[a b] =size(grp);
%   X1 = randn(a,10);
%     X1(:,1:8)= firstOrdertotalFv;
obs=firstOrdertotalFv';

% GROUP = [1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 2 3 3 4 4];
GROUP = [1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
dataTrain=obs(:,1:17);

% I = randfeatures(X,GROUP,'SubsetSize',5,'Classifier','da')
[I ,z] = rankfeatures(dataTrain,GROUP,'Criterion', 'entropy')
ecdf(z);
xlabel('P value');
ylabel('CDF value')
% C = classify(X(I(1:5),:)',X(I(1:5),:)',GROUP);
% cp = classperf(GROUP,C);
% cp.CorrectRate  