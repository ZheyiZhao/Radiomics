  % Perform sequential feature selection for CLASSIFY on iris data with
%      % noisy features and see which non-noise features are important
clear;
load('fisheriris');
      X = randn(150,10);
    X(:,[1 3 5 7 ])= meas;
     y = species;
     opt = statset('display','iter');
     % Generating a stratified partition is usually preferred to
     % evaluate classification algorithms.
    cvp = cvpartition(y,'k',10); 
    [fs,history] = sequentialfs(@classf,X,y,'cv',cvp,'options',opt);
% 
%      where CLASSF is a MATLAB function such as:
