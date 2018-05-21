clear ;
clc;
%% 导入数据 正则项 防过拟合
 load adc.mat;
 textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
featureSelMat= [sobelTotalFV, hogTotalFV,firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) ,wavelettotalFv(:,[14 8 4 21 15 30 10 34])];

x=firstOrderSelFv';
% ';%t4 10; t3 11 ;t2 6; t1 10

 total =111
t =zeros(4,total);
t(1,1:30)=1;%30
t(2,31:48)=1;%18
t(3,49:81)=1;%33
t(4,82:111)=1;%30
% net = feedforwardnet(40);
% net = configure(net,x,grp1);
% net = init(net);
% [net,tr] = train(net,x,grp1);
setdemorandstream(391418381);%设置随机种子值
net = patternnet(840);


% Train the Network
view(net);
[net,tr] = train(net,x,t);
nntraintool
plotperform(tr)

testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY)
plotconfusion(testT,testY)


[c,cm] = confusion(testT,testY)

fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);