% For example, consider a data set with 100 observations of 10 predictors. 
% The following generates random data from a logistic model, with a binomial distribution 
% of responses at each set of values for the predictors. 
% Some coefficients are set to zero so that not all of the predictors affect the response:
n = 100;
m = 10;
X = rand(n,m);
b = [1 0 0 2 .5 0 0 0.1 0 1];
Xb = X*b';
p = 1./(1+exp(-Xb));
N = 50;
y = binornd(N,p);
Y = [y N*ones(size(y))];
[b0,dev0,stats0] = glmfit(X,Y,'binomial');

% Display coefficient estimates and their standard errors:
model0 = [b0 stats0.se]
% Display the deviance of the fit:

dev0

maxdev = chi2inv(.95,1);     
opt = statset('display','iter',...
              'TolFun',maxdev,...
              'TolTypeFun','abs');

inmodel = sequentialfs(@critfun,X,Y,...
                       'cv','none',...
                       'nullmodel',true,...
                       'options',opt,...
                       'direction','forward');
                   
                   