
load m.mat;
[a b] =size(grp);
%   X1 = randn(a,10);
%     X1(:,1:8)= firstOrdertotalFv;
obs=firstOrdertotalFv;
holdoutCVP = cvpartition(grp,'holdout',1)
dataTrain = obs(holdoutCVP.training,:);
grpTrain = grp(holdoutCVP.training);

try
   yhat = classify(obs(holdoutCVP.test(),:), dataTrain, grpTrain,'quadratic');
catch ME
   display(ME.message);%数据量不足
end

dataTrainG1 = dataTrain(grp2idx(grpTrain)==1,:);
dataTrainG2 = dataTrain(grp2idx(grpTrain)==2,:);
[h,p,ci,stat] = ttest2(dataTrainG1,dataTrainG2,[],[],'equal');
ecdf(p);
xlabel('P value');
ylabel('CDF value')
p 
ci
