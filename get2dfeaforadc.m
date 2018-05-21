
pre='/Users/huangkaiwei/Documents/MATLAB/dataadc2d/t1/t1';
cnt=38;


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

pre='/Users/huangkaiwei/Documents/MATLAB/dataadc2d/t2/t2';
cnt=30;


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

pre='/Users/huangkaiwei/Documents/MATLAB/dataadc2d/t3/t3';
cnt=53;


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


pre='/Users/huangkaiwei/Documents/MATLAB/dataadc2d/t4/t4';
cnt=49;


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



save adcimg2dfea.mat  imgfea2Dt4 imgfea2Dt3 imgfea2Dt2 imgfea2Dt1;