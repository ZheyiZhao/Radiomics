clear;
load adc.mat;
% featureMat1= [sobelTotalFV hogTotalFV firstOrdertotalFv cooctotalFv glrmtotalFv shapetotalF wavelettotalFv];



%使用筛选特征
textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
featureSelMat= [sobelTotalFV, hogTotalFV,firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) ,wavelettotalFv(:,[14 8 4 21 15 30 10 34])];

% featureMat=[sobelTotalFV, hogTotalFV,firstOrderSelFv textureMat, shapetotalF,wavelettotalFv];
featureMat=featureSelMat;

grp1 = adcgrp;
rng(1); % For reproducibility
MdlDefault = fitctree(featureMat,grp1,'CrossVal','on');
numBranches = @(x)sum(x.IsBranch);
mdlDefaultNumSplits = cellfun(numBranches, MdlDefault.Trained);

figure;
histogram(mdlDefaultNumSplits);

view(MdlDefault.Trained{1},'Mode','graph');

classErrorDefault = kfoldLoss(MdlDefault)

 Ynew=kfoldPredict(MdlDefault);
 [a b]=size(Ynew);

t1right=0;
t2right=0;
t3right=0;
t4right=0;

t1Cnt=30;
t2Cnt=18;
t3Cnt=33;
t4Cnt=30;
for i = 1: t1Cnt
    if strcmp(grp1{i,1},Ynew{i,1})
        t1right=t1right+1;
    end
end

for i = 31: 48
    if strcmp(grp1{i,1},Ynew{i,1})
        t2right=t2right+1;
    end
end

for i = 49: 81
    if strcmp(grp1{i,1},Ynew{i,1})
        t3right=t3right+1;
    end
end

for i = 82: 111
    if strcmp(grp1{i,1},Ynew{i,1})
        t4right=t4right+1;
    end
end
t1right
t2right
t3right
t4right
t1acc=t1right/t1Cnt
t2acc=t2right/t2Cnt
t3acc=t3right/t3Cnt
t4acc=t4right/t4Cnt

total=(t1right+t2right+t3right+t4right)/111

