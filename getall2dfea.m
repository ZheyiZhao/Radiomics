
pre='/Users/huangkaiwei/Documents/MATLAB/datafor2d/t1/t1';
cnt=22;


x=strcat(pre,num2str(1),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);

imgfea2Dt1=zeros(cnt,length(fea2d));
imgfea2Dt1(1,:)=fea2d;

for i=2:1:cnt
x=strcat(pre,num2str(i),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);
imgfea2Dt1(i,:)=fea2d;
end

pre='/Users/huangkaiwei/Documents/MATLAB/datafor2d/t2/t2';
cnt=26;


x=strcat(pre,num2str(1),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);

imgfea2Dt2=zeros(cnt,length(fea2d));
imgfea2Dt2(1,:)=fea2d;

for i=2:1:cnt
x=strcat(pre,num2str(i),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);
imgfea2Dt2(i,:)=fea2d;
end

pre='/Users/huangkaiwei/Documents/MATLAB/datafor2d/t3/t3';
cnt=22;


x=strcat(pre,num2str(1),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);

imgfea2Dt3=zeros(cnt,length(fea2d));
imgfea2Dt3(1,:)=fea2d;

for i=2:1:cnt
x=strcat(pre,num2str(i),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);
imgfea2Dt3(i,:)=fea2d;
end


pre='/Users/huangkaiwei/Documents/MATLAB/datafor2d/t4/t4';
cnt=28;


x=strcat(pre,num2str(1),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);

imgfea2Dt4=zeros(cnt,length(fea2d));
imgfea2Dt4(1,:)=fea2d;

for i=2:1:cnt
x=strcat(pre,num2str(i),'.jpg');
imgRes= imread(x);
fea2d= get2DFeatures(imgRes);
imgfea2Dt4(i,:)=fea2d;
end

save img2dfea.mat  imgfea2Dt4 imgfea2Dt3 imgfea2Dt2 imgfea2Dt1;