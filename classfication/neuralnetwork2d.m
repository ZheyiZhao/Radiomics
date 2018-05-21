clear al;
clc;
%% 导入数据
load adcimg2dfea.mat;
x=[imgfea2Dt4; imgfea2Dt3 ;imgfea2Dt2 ;imgfea2Dt1]';%t4 49; t3 53 ;t2 30; t1 38
 t1label= ones(1,38);
  t2label= ones(1,30).*2;
  t3label= ones(1,53).*3;
  t4label= ones(1,49).*4;
 total =38+30+53+49
t =zeros(4,total);
t(1,1:38)=1;
t(2,39:68)=1;
t(3,69:121)=1;
t(4,122:170)=1;
% net = feedforwardnet(40);
% net = configure(net,x,grp1);
% net = init(net);
% [net,tr] = train(net,x,grp1);
setdemorandstream(391418381);%设置随机种子值
net = patternnet(15);
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