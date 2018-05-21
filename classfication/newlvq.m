
load adc.mat;
 textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
featureSelMat= [sobelTotalFV, hogTotalFV,firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) ,wavelettotalFv(:,[14 8 4 21 15 30 10 34])];

x=firstOrdertotalFv';%t4 10; t3 11 ;t2 6; t1 10

 total =111
t =zeros(4,total);
t(1,1:30)=1;%30
t(2,31:48)=1;%18
t(3,49:81)=1;%33
t(4,82:111)=1;%30
net = lvqnet(10);
net.trainParam.epochs = 50;
net = train(net,x,t);
view(net)
y = net(x);
perf = perform(net,y,t)
classes = vec2ind(y);