clear;
load ovariancancer;
holdoutCVP = cvpartition(grp,'holdout',56)
dataTrain = obs(holdoutCVP.training,:);
grpTrain = grp(holdoutCVP.training);

try
   yhat = classify(obs(holdoutCVP.test(),:), dataTrain, grpTrain,'quadratic');
catch ME
   display(ME.message);
end

dataTrainG1 = dataTrain(grp2idx(grpTrain)==1,:);
dataTrainG2 = dataTrain(grp2idx(grpTrain)==2,:);
[h,p,ci,stat] = ttest2(dataTrainG1,dataTrainG2,[],[],'unequal');

ecdf(p);
xlabel('P value');
ylabel('CDF value')