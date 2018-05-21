
clear;

load adc.mat;


%使用筛选特征
textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
 featureSelMat= [firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) , wavelettotalFv(:,[14 8 4 21 15 30 10 34])];
% featureSelMat = [firstOrdertotalFv textureMat shapetotalF wavelettotalFv];
trainingFeatures=textureMat;
% % totallabel=[1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2  1 1 2 2 2 2 2];
% totallabel = [1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 2 3 3 4 4];
% totallabel=[1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2  1 1 2 2 2 2 2];
totallabel = [t1label t2label t3label t4label ];
% fitcecoc uses SVM learners and a 'One-vs-One' encoding scheme.
classifier = fitcecoc(trainingFeatures, totallabel);

testFeatures=trainingFeatures;
testLabels=totallabel;
% Make class predictions using the test features.
predictedLabels = predict(classifier, testFeatures)


