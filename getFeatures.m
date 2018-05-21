function [ sobelFV, hogFV ,firstOrderFV,  coocfeatureVector ,glrmfeatureVector ,shapeFV, waveletFV ] = getFeatures( img3D )


% 由于师兄分割的图底色上白色，先要去除这个的影响
img3D(find(img3D>254))=0;

[sx,sy,sz]=size(img3D);



% Sobel operator  3D
[Gx, Gy, Gz] = imgradientxyz(img3D);
% 8份，x，y，z二等分
xinterval=floor(sx/2);
yinterval=floor(sy/2);
zinterval=floor(sz/2);
Gx_1=Gx(1:xinterval,1:yinterval,1:zinterval);
Gx_2=Gx(1:xinterval,yinterval+1:sy,1:zinterval);
Gx_3=Gx(xinterval+1:sx,1:yinterval,1:zinterval);
Gx_4=Gx(xinterval+1:sx,yinterval+1:sy,1:zinterval);
Gx_5=Gx(1:xinterval,1:yinterval,zinterval+1:sz);
Gx_6=Gx(1:xinterval,yinterval+1:sy,zinterval+1:sz);
Gx_7=Gx(xinterval+1:sx,1:yinterval,zinterval+1:sz);
Gx_8=Gx(xinterval+1:sx,yinterval+1:sy,zinterval+1:sz);

Gy_1=Gy(1:xinterval,1:yinterval,1:zinterval);
Gy_2=Gy(1:xinterval,yinterval+1:sy,1:zinterval);
Gy_3=Gy(xinterval+1:sx,1:yinterval,1:zinterval);
Gy_4=Gy(xinterval+1:sx,yinterval+1:sy,1:zinterval);
Gy_5=Gy(1:xinterval,1:yinterval,zinterval+1:sz);
Gy_6=Gy(1:xinterval,yinterval+1:sy,zinterval+1:sz);
Gy_7=Gy(xinterval+1:sx,1:yinterval,zinterval+1:sz);
Gy_8=Gy(xinterval+1:sx,yinterval+1:sy,zinterval+1:sz);

Gz_1=Gz(1:xinterval,1:yinterval,1:zinterval);
Gz_2=Gz(1:xinterval,yinterval+1:sy,1:zinterval);
Gz_3=Gz(xinterval+1:sx,1:yinterval,1:zinterval);
Gz_4=Gz(xinterval+1:sx,yinterval+1:sy,1:zinterval);
Gz_5=Gz(1:xinterval,1:yinterval,zinterval+1:sz);
Gz_6=Gz(1:xinterval,yinterval+1:sy,zinterval+1:sz);
Gz_7=Gz(xinterval+1:sx,1:yinterval,zinterval+1:sz);
Gz_8=Gz(xinterval+1:sx,yinterval+1:sy,zinterval+1:sz);

% 最大池化 一阶梯度特征
xsobelFV=[max(max(max(Gx_1))), max(max(max(Gx_2))) ,max(max(max(Gx_3))), max(max(max(Gx_4))) , max(max(max(Gx_5))),max(max(max(Gx_6))),max(max(max(Gx_7))),max(max(max(Gx_8)))];
ysobelFV=[max(max(max(Gy_1))), max(max(max(Gy_2))) ,max(max(max(Gy_3))), max(max(max(Gy_4))) , max(max(max(Gy_5))),max(max(max(Gy_6))),max(max(max(Gy_7))),max(max(max(Gy_8)))];
zsobelFV=[max(max(max(Gz_1))), max(max(max(Gz_2))) ,max(max(max(Gz_3))), max(max(max(Gz_4))) , max(max(max(Gz_5))),max(max(max(Gz_6))),max(max(max(Gz_7))),max(max(max(Gz_8)))];
sobelFV=[xsobelFV ysobelFV zsobelFV];
%HOG 二维 仅提取中间一张

  midIndex= floor(sz/2);
[hogFV, visualization] = extractHOGFeatures(img3D(:,:,midIndex),'CellSize',[xinterval yinterval]);



%--------------------------------
img3DVector=img3D(:);
imHistCnt=imhist(img3DVector);
pixelCnt=sum(sum(imHistCnt));
%肿瘤在实际像素点个数，体积
 kw_num=pixelCnt-length(find(img3DVector==0));  
 volume=kw_num;
 
p1=imHistCnt/kw_num;%不使用灰度为0的像素点


     

kw_mean=0;
kw_var=0;
%直方图偏斜度   表示目标图像区域灰度平均值周围直方图对称的程度
%直方图峰度     目标图的一维直方图的锐度
kw_skewness=0;   %偏斜度 —— 获得图像不对称程度

kw_kurtosis=0;   %峰1

kw_energy=0;
kw_ent=0; 

kw_skewness1=0;
kw_kurtosis1=0;   %临时变量
%mean
kw_mean = sum(img3DVector)/kw_num;

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

% －－－－－－－－－－－－
% 像素的最值
% －－－－－－－－－－－－
%同时找出灰度最值
kw_max=1;
kw_min=1;

for i=2:256 % ignore灰度为0
    if p1(i)~=0 
      kw_min=i-1;
      break;
    end
end

for i=256:-1:2 % ignore灰度为0
    if p1(i)~=0 
      kw_max=i-1;
      break;
    end
end
 
firstOrderFV=[kw_mean ,kw_var,kw_skewness, kw_kurtosis,kw_energy,kw_ent,kw_max, kw_min ];
%我是华丽丽的分割线－－－－－－－－－－－－－－－－－－－
% 纹理特征
%3D灰度共生矩阵
[coocfeatureVector, coocMat]=cooc3d(img3D,'distance', [1]);

%2D灰度游程长矩阵,仅提取中间一张
glrmfeatureVectortmp=getglrmfeature(img3D(:,:,midIndex));
glrmfeatureVector=glrmfeatureVectortmp(:)';
%我是华丽丽的分割线－－－－－－－－－－－－－－－－－－－
% 几何形状特征
% 体积
 volume
 
%表面积
Ds = smooth3(img3D);
FV=isosurface(Ds,5);
V = FV.vertices;
F = FV.faces;
A = V(F(:, 2), :) - V(F(:, 1), :);
B = V(F(:, 3), :) - V(F(:, 1), :);
C = cross(A, B, 2);
surfaceareatmp= 1/2 * sum(sqrt(sum(C.^2, 2)));

surfacearea=surfaceareatmp;

% 紧凑度
Compactness=(36*pi*volume.^2)./(surfacearea).^3;


% 球形不对称性
R_tmp=((0.75*volume)/pi).^(1/3);
SD=surfacearea./(4*pi*((R_tmp).^2));

% 球形度
Sphericity=((6*volume).^(2/3))./surfacearea;


% 表面积体积比
Ratio=surfacearea./volume;

shapeFV=[ volume,surfacearea,Compactness,SD,Sphericity,Ratio];
%我是华丽丽的分割线－－－－－－－－－－－－－－－－－－
% 变换域特征
n = 1;                   % Decomposition Level
w = 'coif1';              % coif1 wavelet
WT = wavedec3(img3D,n,w);    % Multilevel 3D wavelet decomposition.
% decCoff=WT.dec; %8*1 cell
% 'LLH','LHL','LHH','HLL','HLH','HHL','HHH'.
LLL= WT.dec{1,1};
LLH = WT.dec{2,1};
LHL = WT.dec{3,1};
LHH = WT.dec{4,1};
HLL= WT.dec{5,1};
HLH = WT.dec{6,1};
HHL=WT.dec{7,1};
HHH=WT.dec{8,1};

[aLLL bLLL cLLL]=size(LLL);
LLL_total= aLLL*bLLL*cLLL;
% 子空间能量
LLL_energy=sum(sum(sum(LLL.^2)));
LLH_energy= sum(sum(sum(LLH.^2)));
LHL_energy= sum(sum(sum(LHL.^2)));
LHH_energy= sum(sum(sum(LHH.^2)));
HLL_energy= sum(sum(sum(HLL.^2)));
HLH_energy= sum(sum(sum(HLH.^2)));
HHL_energy= sum(sum(sum(HHL.^2)));
HHH_energy= sum(sum(sum(HHH.^2)));
subspaceEnergy=[LLL_energy, LLH_energy,LHL_energy,LHH_energy,HLL_energy,HLH_energy,HHL_energy,HHH_energy];
% energy_total= LLL_energy+LLH_energy+LHL_energy+LHH_energy+HLL_energy+HLH_energy+HHL_energy+HHH_energy;
energy_total= sum(subspaceEnergy);
P_relativeEnergy=subspaceEnergy./energy_total;
% 小波熵
waveletEnt=-sum((P_relativeEnergy.*log(P_relativeEnergy)));

%mean 
waveletMean= [sum(sum(sum(LLL))), sum(sum(sum(LLH))),sum(sum(sum(LHL))),sum(sum(sum(LHH))) , sum(sum(sum(HLL))), sum(sum(sum(HLH))),sum(sum(sum(HHL))),sum(sum(sum(HHH)))]./LLL_total;

waveletVar=[sum(sum(sum((LLL-waveletMean(1)).^2))), sum(sum(sum((LLH-waveletMean(2)).^2))),sum(sum(sum((LHL--waveletMean(3)).^2))),sum(sum(sum((LHH-waveletMean(4)).^2))) , sum(sum(sum((HLL-waveletMean(5)).^2))), sum(sum(sum((HLH-waveletMean(6)).^2))),sum(sum(sum((HHL-waveletMean(7)).^2))),sum(sum(sum((HHH-waveletMean(8)).^2)))]./(LLL_total-1);
size(subspaceEnergy)
size(energy_total)
size(P_relativeEnergy)
size(waveletEnt)
size(waveletMean)
size(waveletVar)
waveletFV=[subspaceEnergy,energy_total,P_relativeEnergy,waveletEnt,waveletMean,waveletVar];
end

