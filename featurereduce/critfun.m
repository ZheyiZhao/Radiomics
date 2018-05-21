function dev = critfun(X,Y)

[b,dev] = glmfit(X,Y,'binomial'); 
end