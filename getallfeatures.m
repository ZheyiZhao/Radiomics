clear;
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t1/ggxC', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);
[asobel bsobel]=size(sobelFV);
[ahog bhog]=size(hogFV);
[afirstOrderFV bfirstOrderFV]=size(firstOrderFV);
[acooc bcooc]=size(coocfeatureVector);
[aglrmfeatureVector bglrmfeatureVector]=size(glrmfeatureVector);
[ashapeFV bshapeFV]=size(shapeFV);
[awaveletFV bwaveletFV]=size(waveletFV);
obsize=24;
sobelTotalFV=ones(obsize,bsobel);
hogTotalFV=ones(obsize,bhog);
firstOrdertotalFv=ones(obsize,bfirstOrderFV);
cooctotalFv=ones(obsize,bcooc);
glrmtotalFv=ones(obsize,bglrmfeatureVector);
shapetotalF=ones(obsize,bshapeFV);
wavelettotalFv=ones(obsize,bwaveletFV);

index =1;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t1/hrlC0', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =2;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t1/ljfC0', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =3;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t1/mmC0', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =4;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%-------t2

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t2/cdjC0', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =5;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t2/cmgC0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =6;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t2/hjwC0', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =7;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t2/lxlC0', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =8;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t2/qzxC0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =9;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%t3
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t3/cqfc0', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =10;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t3/cqlC0', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=11;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t3/czjc0', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=12;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t3/dhqc0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=13;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%t4

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t4/cmec', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=14;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t4/cxlc', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=15;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t4/cylc', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=16;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t4/gzlc', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=17;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%------t1
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t1/wrtC0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=18;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t1/yzhC0', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=19;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%--------t2
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t2/zwwC0', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=20;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%--------t3
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t3/hgcc0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=21;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t3/hgqc0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=22;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%t4
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t4/hzpc', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=23;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/t4/ldkc', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=24;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
grp = {'1' '1' '1' '1' '2' '2' '2' '2' '2' '3' '3' '3' '3' '4' '4' '4' '4' '1' '1' '2' '3' '3' '4' '4'}';

sobelTotalFV(isnan(sobelTotalFV))=0;
hogTotalFV(isnan(hogTotalFV))=0;
firstOrdertotalFv(isnan(firstOrdertotalFv))=0;
cooctotalFv(isnan(cooctotalFv))=0;
glrmtotalFv(isnan(glrmtotalFv))=0;
shapetotalF(isnan(shapetotalF))=0;
wavelettotalFv(isnan(wavelettotalFv))=0;
save m.mat  sobelTotalFV hogTotalFV firstOrdertotalFv cooctotalFv glrmtotalFv shapetotalF wavelettotalFv grp;