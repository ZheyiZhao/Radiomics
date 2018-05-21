clear;
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/cmg', 6);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);
[asobel bsobel]=size(sobelFV);
[ahog bhog]=size(hogFV);
[afirstOrderFV bfirstOrderFV]=size(firstOrderFV);
[acooc bcooc]=size(coocfeatureVector);
[aglrmfeatureVector bglrmfeatureVector]=size(glrmfeatureVector);
[ashapeFV bshapeFV]=size(shapeFV);
[awaveletFV bwaveletFV]=size(waveletFV);
obsize=111;
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


%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =2;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =3;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;




imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/fyx', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =4;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =5;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =6;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;



imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/ggx', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =7;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =8;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =9;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/hjw', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =10;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =11;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =12;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/hrl', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =13;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =14;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =15;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/ljf', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =16;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =17;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =18;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/lyz', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);
%%
index =19;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =20;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =21;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/mm', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =22;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =23;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =24;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/wtr', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =25;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =26;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =27;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t1/yzh', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =28;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =29;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =30;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%-------t2
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/cdj', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =31;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =32;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =33;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%


imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/cmg', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =34;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =35;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =36;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/lxl', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =37;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =38;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =39;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/lxll', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =40;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =41;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =42;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/qzx', 6);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =43;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =44;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =45;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/zww', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =46;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =47;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =48;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
% imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t2/zxl', 4);
% [ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);
% 
% index =18;
% sobelTotalFV(index,:)=sobelFV;
% hogTotalFV(index,:)=hogFV;
% firstOrdertotalFv(index,:)=firstOrderFV;
% cooctotalFv(index,:)=coocfeatureVector;
% glrmtotalFv(index,:)=glrmfeatureVector;
% shapetotalF(index,:)=shapeFV;
% wavelettotalFv(index,:)=waveletFV;



%t3
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/cgw', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index =49;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =50;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =51;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/cqfd0', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=52;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =53;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =54;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/cql', 3);

[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=55;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =56;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =57;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/cyc', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=58;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =59;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =60;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/czj', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=61;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =62;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =63;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/hgc', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=64;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =65;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =66;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/hgq', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=67;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =68;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =69;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%%


imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/lfg', 3);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=70;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =71;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =72;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/lzg', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=73;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =74;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =75;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%



imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/lzl', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=76;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =77;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =78;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t3/zhq', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=79;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =80;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =81;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
%t4

imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/cme', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=82;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =83;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =84;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/cxl', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=85;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =86;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =87;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%


imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/cyl', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=88;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =89;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =90;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/fxl', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=91;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =92;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =93;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%


imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/gzl', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=94;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =95;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =96;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/hjx', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=97;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =98;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =99;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/hyf', 5);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=100;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =101;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =102;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/hzp', 7);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=103;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =104;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =105;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/ldk', 2);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=106;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =107;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =108;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;
%%
imgRes = readImg('/Users/huangkaiwei/Documents/MATLAB/dataadc/t4/lzx', 4);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgRes);

index=109;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;



%左右翻转
imgResRL =imgRes(:,end:-1:1,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =110;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;


%前后翻转
imgResRL =imgRes(end:-1:1,:,:);
[ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures(imgResRL);

index =111;
sobelTotalFV(index,:)=sobelFV;
hogTotalFV(index,:)=hogFV;
firstOrdertotalFv(index,:)=firstOrderFV;
cooctotalFv(index,:)=coocfeatureVector;
glrmtotalFv(index,:)=glrmfeatureVector;
shapetotalF(index,:)=shapeFV;
wavelettotalFv(index,:)=waveletFV;

t1label=ones(1,30);
t2label=ones(1,18).*2;

t3label=ones(1,33).*3;

t4label=ones(1,30).*4;
adcgrp = {'1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '1' '2' '2' '2' '2' '2' '2' '2' '2' '2' '2' '2' '2'  '2' '2' '2' '2' '2' '2'  '3' '3' '3' '3' '3' '3' '3' '3'  '3' '3' '3'  '3' '3' '3' '3' '3' '3' '3' '3'  '3' '3' '3'  '3' '3' '3' '3' '3' '3' '3' '3'  '3' '3' '3' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4' '4'}';

sobelTotalFV(isnan(sobelTotalFV))=0;
hogTotalFV(isnan(hogTotalFV))=0;
firstOrdertotalFv(isnan(firstOrdertotalFv))=0;
cooctotalFv(isnan(cooctotalFv))=0;
glrmtotalFv(isnan(glrmtotalFv))=0;
shapetotalF(isnan(shapetotalF))=0;
wavelettotalFv(isnan(wavelettotalFv))=0;
save adc.mat  sobelTotalFV hogTotalFV firstOrdertotalFv cooctotalFv glrmtotalFv shapetotalF wavelettotalFv adcgrp t1label t2label t3label t4label;