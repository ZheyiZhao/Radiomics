function mfeacture = get2DFeactures(img_2D )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% SourcePic=imread('demo.jpg');  
  
% grayPic=rgb2gray(img_2D);  
% grayPic=im2double(grayPic1); 
% 由于师兄分割的图底色上白色，先要去除这个的影响
img_2D(find(img_2D>254))=0;

grayPic=img_2D;
[M,N]=size(grayPic);
% －－－－－－－－－
% Sobel算子 
% H_V=edge(grayPic,'sobel',Threshold);  
% －－－－－－－－－
% [VerticalSobel Threshold]=edge(grayPic,'sobel','vertical');%edge detect  
% [HorizontalSobel Threshold]=edge(grayPic,'sobel','horizontal');%edge detect  
% conv2
% －－－－－－－－－
% HOG 
% [a b]=size(hog1)
%    subplot(1,2,1);
%    imshow(grayPic);
%    subplot(1,2,2);
%    plot(visualization);
% －－－－－－－－－

% [hog1, visualization] = extractHOGFeatures(grayPic,'CellSize',[M/2 N/2]);


%肿瘤在这一图层的面积
kw_num=M*N-length(find(grayPic==0));  


      

kw_mean=0;
kw_var=0;
%直方图偏斜度   表示目标图像区域灰度平均值周围直方图对称的程度
%直方图峰度     目标图的一维直方图的锐度
kw_skewness=0;   %偏斜度 —— 获得图像不对称程度
kw_kurtosis=0;   %峰度
kw_energy=0;
kw_ent=0; 


% －－－－－－－－－
% 一阶直方图特征
% －－－－－－－－－
kw_h=imhist(grayPic);

p1=(kw_h)/(kw_num); 
%一阶直方图的均值
kw_mean=sum(sum(grayPic))/kw_num;    

kw_skewness1=0;
kw_kurtosis1=0;
for i=2:256 % 灰度为0的去掉
    if p1(i)~=0
      kw_var=kw_var+(i-kw_mean)*(i-kw_mean)*p1(i);
       kw_skewness1=kw_skewness1+((i-kw_mean)^3)*p1(i);
       kw_kurtosis1=kw_kurtosis1+((i-kw_mean)^4)*p1(i);
        kw_ent=-p1(i)*log(p1(i))+kw_ent;%一阶直方图熵
        kw_energy=p1(i)*p1(i)+kw_energy;%能量
    end
end

kw_skewness= kw_skewness1*kw_var^(-1.5); %偏态
kw_kurtosis= kw_kurtosis1*kw_var^(-2) - 3;%峰态

% % －－－－－－－－－－－－
% % 像素的最值
% % －－－－－－－－－－－－
% %同时找出灰度最值
% kw_max=0;
% kw_min=0;
% 
% for i=2:256 % ignore灰度为0
%     if p1(i)~=0 
%       kw_min=i-1;
%       break;
%     end
% end
% 
% for i=256:2 % ignore灰度为0
%     if p1(i)~=0 
%       kw_max=i-1;
%       break;
%     end
% end



%周长
Y0=grayPic;
Y0(Y0>0)=1;
kw_c=sum(sum(bwperim(Y0)));

%紧密度  周长的平方乘以面积,对应粗糙程度和形状复杂程度
kw_p=kw_c*kw_c/kw_num;

glcms = graycomatrix(grayPic);
glcmsfeature= graycoprops(glcms);

glrmfeatureVectortmp=getglrmfeature(grayPic);
glrmfeatureVector=glrmfeatureVectortmp(:)';

mfeacture=[glcmsfeature.Contrast ,glcmsfeature.Correlation,glcmsfeature.Energy,glcmsfeature.Homogeneity,kw_p,kw_c,kw_kurtosis,kw_skewness,kw_energy, glrmfeatureVector];
mfeacture(isnan(mfeacture))=0;

end

