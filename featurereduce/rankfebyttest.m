
clear;
load m.mat;
[a b] =size(grp);
obs=firstOrdertotalFv';

% GROUP = [1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 2 3 3 4 4];
GROUP = [1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
dataTrain=obs(:,1:17);

[I ,z] = rankfeatures(dataTrain,GROUP,'Criterion', 'ttest')
ecdf(z);
xlabel('P value');
ylabel('CDF value')

%   4
%      5
%      6
%      1
%      2
%      8
%      3
%      7