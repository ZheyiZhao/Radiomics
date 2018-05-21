function err = classf(xtrain,ytrain,xtest,ytest)
        yfit = classify(xtest,xtrain,ytrain,'quadratic');
       err = sum(~strcmp(ytest,yfit));
end