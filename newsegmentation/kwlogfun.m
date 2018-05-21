function y=kwlogfun(p)

myf = @(beta,x) beta(1)*x./(beta(2) + x);
mymodelfun = @(beta,x) 1./(1 + exp(-myf(beta,x)));

mynegloglik = @(beta) -sum(log(binopdf(z,n,mymodelfun(beta,x))));
beta0 = [3;3];
opts = optimset('fminsearch');
opts.MaxFunEvals = Inf;
opts.MaxIter = 10000;
y = fminsearch(mynegloglik,beta0,opts);