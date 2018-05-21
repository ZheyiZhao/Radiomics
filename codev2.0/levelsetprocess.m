function resMask=levelsetprocess(initLSF,imageN)
% V = spm_vol_nifti('no20140530_12123700000004t1tsetradarkfluids003a1001.nii');
% [Y,XYZ] = spm_read_vols(V);
% x1= Y(:,:,1);
% Img1=Y(:,:,19);
% Img1=double(Img1(:,:,1));
% Img = imread(imageN); % real miscroscope image of cells
Img=double(imageN);

%Img=imread('cancer.bmp');
%Img=double(Img(:,:,1));
%Img = dicomread('02.dcm');
%Img= double(Img);
%m=max(Img(:)); n = min(Img(:));
%Img = uint8((Img-n)*255 / (m-n));

iter_outer=50; 
iter_inner=10;   % inner iteration for level set evolution


A=255;
Img=A*normalize01(Img); % rescale the image intensities

%% 参数
% nu=0.001*A^2; % coefficient of arc length term
nu=0.001*A^2;
sigma =15; % scale parameter that specifies the size of the neighborhood,高斯核函数参数


timestep=5;
mu=0.1/timestep;  % coefficient for distance regularization term (regularize the level set function)


figure(1);
imagesc(Img,[0, 255]); colormap(gray); axis off; axis equal


% initialize level set function
% initialLSF = c0*ones(size(Img));
% initialLSF(90:200,150:250) = -c0;
u=initLSF;




hold on;
contour(u,[0 0],'r');  %如果只想在高度i处画一条等高线， 使用countour(Z, [i i])。
title('Initial contour');



figure(2);
%将矩阵A中的元素数值按大小转化为不同颜色，并在坐标轴对应位置处以这种颜色染色
imagesc(Img,[0, 255]); colormap(gray); axis off; axis equal
hold on;
contour(u,[0 0],'r');
title('Initial contour');

epsilon=10;
b=ones(size(Img));  %%% initialize bias field


%   H = FSPECIAL('gaussian',HSIZE,SIGMA) returns a rotationally
%   symmetric Gaussian lowpass filter  of size HSIZE with standard
%   deviation SIGMA (positive). HSIZE can be a vector specifying the
%   number of rows and columns in H or a scalar, in which case H is a
%   square matrix.
%   The default HSIZE is [3 3], the default SIGMA is 0.5.
K=fspecial('gaussian',4,sigma); % Gaussian kernel
KI=conv2(Img,K,'same'); %二维卷积
KONE=conv2(ones(size(Img)),K,'same');

[row,col]=size(Img);
N=row*col;

for n=1:iter_outer
    [u, b, C]= lse_bfe(u,Img, b, K,KONE, nu,timestep,mu,epsilon, iter_inner);

    if mod(n,2)==0
        pause(0.001);
        imagesc(Img,[0, 255]); colormap(gray); axis off; axis equal;
        hold on;
        contour(u,[0 0],'r');
        iterNum=[num2str(n), ' iterations'];
        title(iterNum);
        hold off;
    end
   
end

figure;
resMask = u>0;
spy(resMask),title('result mask');
% Mask =(Img>10);
% Img_corrected=normalize01(Mask.*Img./(b+(b==0)))*255;
% 
% figure(3); imagesc(b);  colormap(gray); axis off; axis equal;
% title('Bias field');
% 
% figure(4);
% imagesc(Img_corrected); colormap(gray); axis off; axis equal;
% title('Bias corrected image');
% 
% figure(5); imagesc(u);  colormap(gray); axis off; axis equal;
% title('contour u');


