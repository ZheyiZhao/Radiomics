load m.mat
   X1 = randn(17,100);
    X1(:,1:8)= firstOrdertotalFv;
% X=firstOrdertotalFv;
     y1 = {'1' '1' '1' '1' '2' '2' '2' '2' '2' '3' '3' '3' '3' '4' '4' '4' '4'}';
     opt = statset('display','iter');
     % Generating a stratified partition is usually preferred to
     % evaluate classification algorithms.
    cvp = cvpartition(y1,'holdout',1); 
    [fs,history] = sequentialfs(@classf,X1,y1,'cv',cvp,'options',opt);


