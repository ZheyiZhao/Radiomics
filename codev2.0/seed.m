%先做阈值分割，然后取最可能是肿瘤的区域
close all;
clear all;
% add all needed function paths
addpath .\coherenceFilter
addpath .\GLtree3DMex
addpath .\DRLSE_v0
addpath F:\medicalmatlab\levelset_segmentation_biasCorrection_v1
% addpath F:\360data\重要数据\桌面\26人MRI数据\testdata\f
% addpath F:\360data\重要数据\桌面\26人MRI数据\oridata
% addpath F:\360data\重要数据\桌面\26人MRI数据\癌症
% addpath F:\360data\重要数据\桌面\26人MRI数据\癌症分割\癌症

%% Compile
fprintf('COMPILING:\n')
mex GraphSeg_mex.cpp
fprintf('\tGraphSeg_mex.cpp: mex succesfully completed.\n') 

mex .\GLtree3DMex\BuildGLTree.cpp
fprintf('\tBuildGLTree : mex succesfully completed.\n') 

mex .\GLtree3DMex\KNNSearch.cpp
fprintf('\tKNNSearch : mex succesfully completed.\n') 

mex .\GLtree3DMex\DeleteGLTree.cpp
fprintf('\tDeleteGLTree : mex succesfully completed.\n\n') 
%end of Complie#
%load an gray image:
% 'cut_cancer_0.png'
% imageName ='cancer01.jpg' ;
% imageName ='F:\360data\重要数据\桌面\26人MRI数据\oridata\IMG-0004-00014.jpg' ;
% cmpName='F:\360data\重要数据\桌面\26人MRI数据\testdata\f\IMG-0004-00014.jpg';

imageName ='F:\360data\重要数据\桌面\26人MRI数据\癌症\cancer07.jpg' ;
cmpName='F:\360data\重要数据\桌面\26人MRI数据\癌症分割\癌症\cancer_result07.jpg';


% imageName = 'can.png';
load clown;
[positionMat  adjustImg]=NPC_setposition(imageName);

Img=double(adjustImg);
% if length(size(Img))>2
%     Img=rgb2gray(Img);
% end
% I=Img(:,:,1); 
 I=Img(positionMat(3) : positionMat(4) ,positionMat(1):positionMat(2)); 
I_gray = I;

%smooth the image by coherence filter
filted_I = CoherenceFilter(I_gray,struct('T',5,'rho',2,'Scheme','I', 'sigma', 1));
%k-nearest neighborhood model:

filted_I_t = filted_I ;
filted_I_t1 = I_gray ;
Lnn = graphSeg(filted_I, 0.5/sqrt(3), 10, 10, 1);
%display:
figure,
subplot(1, 2, 1), imshow(I_gray, []), title('original image');
label_LNN = label2rgb(Lnn);
% filted_I_t(positionMat(1) : positionMat(2) ,positionMat(3):positionMat(4))=label_LNN;
subplot(1, 2, 2), imshow(label_LNN), title('k nearest neighborhood based segmentation');


%Img=dicomread('D:\MATLAB\work\NPC\21065721');   %读取图像
%metadata = dicominfo('D:\MATLAB\work\NPC\21065721');%存储信息
%imagesc(Img);%显示图像
%Img=imread('cut_cancer_0.png'); 
%Img = imread('123.jpg');
% Img=imread('cancer2.png'); 
% if length(size(Img))>2
%     Img=rgb2gray(Img);
% end
% I=Img(:,:,1); 
% figure;imshow(Img);colormap;

%% 确定最有可能的肿瘤区域
%%%%%%%%%%%%%%%%%%
[m n]=size(I_gray);
%% function based on location of Nasopharynx,PL

pl=zeros(m,n);
p2=zeros(m,n);
%a=295;b=400;c=285;d=500;
a=floor(m/4);b=3*a;c=floor(n/4);d=3*c;
pl(a:b,c:d)=1;
p2(a,c:d)=1;
p2(b,c:d)=1;
p2(a:b,c)=1;
p2(a:b,d)=1;


figure;
imshow(I_gray,[]);
title('further decision contour line');
hold on,
contour(pl,[0 0],'r'); 
% imshow(pl);

%% function based on Tumor Imge Intensities PI

pixel_sum=(b-a)*(d-c);
pC=0;
mPvc= zeros(pixel_sum,1);
for i=a:b
    for j=c:d
       if(I_gray(i,j)>=180)
           pC = pC+1;
           mPvc(pC,1)=  I_gray(i,j);    
       end     
    end
end


% pi=3.1415926;
% pI=zeros(m,n);
% for i=a:b
%     for j=c:d
%       pI(i,j)=(exp((-(double(I_gray(i,j))-mu_t)^2))/(2*(sigma_t^2)))/(sigma_t* sqrt(2*pi));%100
%     end
% end
%figure;
%title('equation2');
%imshow(pI);

%based on Non-Tumor Region,PN
% pn=zeros(m,n);
% level=graythresh(I_gray);
% pn=im2bw(I_gray,level)-1;
%figure;
%title('equation3');
%imshow(pn,[]);

P=zeros(m,n);
mu_t=mean(mPvc(1:pC,1));
sigma_t=std2(mPvc(1:pC,1));
eva_3sigma_L = mu_t-3*sigma_t;
eva_3sigma_U =  mu_t+3*sigma_t;
%all
for i=a:b
    for j=c:d
        if(I_gray(i,j)>=50)
        if(I_gray(i,j)>=eva_3sigma_L && (I_gray(i,j)<=eva_3sigma_U))
        P(i,j)=1;%
        end
        end
    end
end

%figure;
%title('all');
%imshow(P);
 
%% 多数决定少数 majority vote
Mask =(P>0);
A= filted_I_t1.*Mask;
figure;imshow(A,[]),title('majority vote');
%% 多数决定少数 majority vote

Res = zeros(m*n,1);
for i =1:m
    for j = 1:n
        if Mask(i,j)==1
            label_tmp = Lnn(i,j);
            Res(label_tmp,1)= Res(label_tmp,1)+1;
        end
    end
    
end



[Y,I1] = max(Res)
Mask2 =(-1)*ones(m,n);
% Mask2 =zeros(m,n);
for i =1:m
    for j = 1:n
        if Lnn(i,j)==I1
           Mask2(i,j)=1;
        end
    end
    
end
% sum2=zeros(1,d);
% tmp=0;index=0;
% for i=c:d
%     for j=a:b
%        if double(P(j,i))>0.85
%            sum2(1,i)=sum2(1,i)+1;
%        end 
%     end
%     if sum2(1,i)>tmp
%         tmp=sum2(1,i);
%         index=i;
%     end
% end
% 
% tmp2=0;
% index_num=floor(tmp/2);
% seed_row=0;
% for i=a:b
%     if double(P(i,index))>0.85
%         tmp2=tmp2+1;
%     end
%     if tmp2==index_num
%         seed_row=i;
%     end
% end

figure;imshow(filted_I_t1,[]),title('knn result');colormap;
hold on;
contour(Mask2,'g');  %
figure;
spy(Mask2);
% figure;
% spy(Mask2);



% hold on;
% plot(index,seed_row,'r')
% 
% 
% s=sprintf('最后种子点位置为:(%d,%d)\n',index,seed_row);
% text(index,seed_row,'*','color','red');
% disp(s);


%% levelset

% Img=imread('cut_cancer_0.png');
% Img=double(Img(:,:,1));
% A=255;
% Img_levelset=I_gray; % rescale the image intensities
% nu=0.001*A^2; % coefficient of arc length term
% 
% A=255;
% Img=A*normalize01(Img); % rescale the image intensities
% nu=0.001*A^2; % coefficient of arc length term
% 
% sigma = 4; % scale parameter that specifies the size of the neighborhood,高斯核函数参数
% iter_outer=50; 
% iter_inner=10;   % inner iteration for level set evolution
% 
% timestep=.1;
% mu=1;  % coefficient for distance regularization term (regularize the level set function)
% 
% c0=1;
% 
% figure(1);
% imagesc(Img,[0, 255]); colormap(gray); axis off; axis equal
% 
% % initialize level set function
% % initialLSF = c0*ones(size(Img));
% % initialLSF(90:200,150:250) = -c0;
% % u=initialLSF;
% u=Mask2;
% 
% 
% 
% hold on;
% contour(u,[0 0],'r');  %如果只想在高度i处画一条等高线， 使用countour(Z, [i i])。
% title('Initial contour');
% 
% 
% 
% figure(2);
% %将矩阵A中的元素数值按大小转化为不同颜色，并在坐标轴对应位置处以这种颜色染色
% imagesc(Img,[0, 255]); colormap(gray); axis off; axis equal
% hold on;
% contour(u,[0 0],'r');
% title('Initial contour');
% 
% epsilon=1;
% b=ones(size(Img));  %%% initialize bias field
% 
% 
% %   H = FSPECIAL('gaussian',HSIZE,SIGMA) returns a rotationally
% %   symmetric Gaussian lowpass filter  of size HSIZE with standard
% %   deviation SIGMA (positive). HSIZE can be a vector specifying the
% %   number of rows and columns in H or a scalar, in which case H is a
% %   square matrix.
% %   The default HSIZE is [3 3], the default SIGMA is 0.5.
% K=fspecial('gaussian',round(2*sigma)*2+1,sigma); % Gaussian kernel
% KI=conv2(Img,K,'same'); %二维卷积
% KONE=conv2(ones(size(Img)),K,'same');
% 
% [row,col]=size(Img);
% N=row*col;
% 
% for n=1:iter_outer
%     [u, b, C]= lse_bfe(u,Img, b, K,KONE, nu,timestep,mu,epsilon, iter_inner);
% 
%     if mod(n,2)==0
%         pause(0.001);
%         imagesc(Img,[0, 255]); colormap(gray); axis off; axis equal;
%         hold on;
%         contour(u,[0 0],'r');
%         iterNum=[num2str(n), ' iterations'];
%         title(iterNum);
%         hold off;
%     end
%    
% end
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

% %% another
% % 参数设置
% n_iter = 600;
% lambda1 = 1;
% lambda2 = 1;
% miu = 0.5*255*255;
% del_t = 1;
% v = 0;
% I = imread('cut_cancer_0.png'); % real miscroscope image of cells
% 
% 
% I=double(I(:,:,1));
% m = max(I(:)); n = min(I(:));
% I = uint8((I-n)*255/(m-n));  % convert uint16 to uint8
% figure, imshow(I)
% 
% mask = Mask2;
% hold on, contour(mask, 'g');
% Img = double(I);
% % 水平集函数
% % phi>0,框内；phi<0,框外
% phi = bwdist(1-mask) - bwdist(mask);
% phi = phi/max(phi(:)-min(phi(:))); % 归一化原因？
% % 做循环
% for n = 1:n_iter
%     c1 = sum(Img(phi>=0))/max(1,length(Img(phi>=0)));
%     c2 = sum(Img(phi<0))/max(1,length(Img(phi<0)));
%     [dx, dy] = gradient(phi);
%     grad_norm = max(eps,sqrt(dx.^2+dy.^2));
%     curvature = divergence(dx./grad_norm, dy./grad_norm);  % 求归一化后的曲率
%     delta_eps = 1/pi./(1+phi.^2);
%     speed = delta_eps.*(miu*curvature - v - lambda1*(Img-c1).^2 + lambda2*(Img-c2).^2);
%     speed = speed/sqrt(sum(sum(speed.^2)));
%     
%     phi = phi + del_t*speed;
% end
% region_mask = sign(phi);
% % region_mask = uint8(round(region_mask));
% % 
% % 
% figure, imshow(I), hold on, contour(region_mask, 'b');
% 
% 
% %% end

%% version2
% Img_t = imread(imageName); % real miscroscope image of cells
% Img_t=double(Img_t(:,:,1));
% A=255;
% Img_t=A*normalize01(Img_t); % rescale the image intensities
% nu=0.0001*A^2; % coefficient of arc length term
% 
% sigma = 1; % scale parameter that specifies the size of the neighborhood,高斯核函数参数
% iter_outer=50; 
% iter_inner=10;   % inner iteration for level set evolution
% 
% timestep=.1;
% mu=1;  % coefficient for distance regularization term (regularize the level set function)
% 
% c0=1;
% 
% figure;
% imagesc(Img_t,[0, 255]); colormap(gray); axis off; axis equal
% 
% 
% % initialize level set function
% % scale resMask
% tmpMask=Mask2+1;
% [n_t,m_t] = size(tmpMask);
%  row = find(sum(tmpMask,2));
%  col = find(sum(tmpMask,1));
%  
% %   row_start = row(1);
%  row_start = row(1);
%   row_end = row(end);
%   col_start= col(1);
%   col_end = col(end);
%   
%  if row(1)>=2
%  row_start = 2;
%  end
%  if row_end<=(n_t-2);
%  row_end = row(end)+2;
%  end
%  
%   if col(1)>=2
%  col_start = col(1)-2;
%  end
%  if col_end<=(m_t-2);
%  col_end = col(end)+2;
%  end
%  col =col_start:col_end;
%  row =row_start:row_end;
%  % add two row and two col each side
% % scaleMask1 = 0.2*ones(n_t,m_t);
% % scaleMask1(row,col) = 1;
% 
% 
% u=Mask2(row,col);
% 
% Img_t=Img_t(row,col);
% 
% 
% 
% 
% hold on;
% contour(u,[0 0],'r');  %如果只想在高度i处画一条等高线， 使用countour(Z, [i i])。
% title('Initial contour');
% 
% 
% 
% figure;
% %将矩阵A中的元素数值按大小转化为不同颜色，并在坐标轴对应位置处以这种颜色染色
% imagesc(Img_t,[0, 255]); colormap(gray); axis off; axis equal
% hold on;
% contour(u,[0 0],'r');
% title('Initial contour');
% 
% epsilon=1;
% b=ones(size(Img_t));  %%% initialize bias field
% 
% 
% %   H = FSPECIAL('gaussian',HSIZE,SIGMA) returns a rotationally
% %   symmetric Gaussian lowpass filter  of size HSIZE with standard
% %   deviation SIGMA (positive). HSIZE can be a vector specifying the
% %   number of rows and columns in H or a scalar, in which case H is a
% %   square matrix.
% %   The default HSIZE is [3 3], the default SIGMA is 0.5.
% K=fspecial('gaussian',round(2*sigma)*2+1,sigma); % Gaussian kernel
% KI=conv2(Img_t,K,'same'); %二维卷积
% KONE=conv2(ones(size(Img_t)),K,'same');
% 
% [row,col]=size(Img_t);
% N=row*col;
% 
% for n=1:iter_outer
%     [u, b, C]= lse_bfe(u,Img_t, b, K,KONE, nu,timestep,mu,epsilon, iter_inner);
% 
%     if mod(n,2)==0
%         pause(0.001);
%         imagesc(Img_t,[0, 255]); colormap(gray); axis off; axis equal;
%         hold on;
%         contour(u,[0 0],'r');
%         iterNum=[num2str(n), ' iterations'];
%         title(iterNum);
%         hold off;
%     end
%    
% end
% Mask =(Img_t>10);
% Img_corrected=normalize01(Mask.*Img_t./(b+(b==0)))*255;
% 
% figure; imagesc(b);  colormap(gray); axis off; axis equal;
% title('Bias field');
% 
% figure(4);
% imagesc(Img_corrected); colormap(gray); axis off; axis equal;
% title('Bias corrected image');
% 
% figure(5); imagesc(u);  colormap(gray); axis off; axis equal;
% title('contour u');
% 
% figure;
% resMask = u>0;
% spy(resMask)

%%  v2 end

% Img_t = imread(imageName); % real miscroscope image of cells
% Img_t=double(Img_t(:,:,1));
Img_t= filted_I_t1;

% initialize LSF as binary step function
% initialize level set function
% scale resMask
% tmpMask=Mask2+1;
% [n_t,m_t] = size(tmpMask);
%  row = find(sum(tmpMask,2));
%  col = find(sum(tmpMask,1));
%  
% %   row_start = row(1);
%  row_start = row(1);
%   row_end = row(end);
%   col_start= col(1);
%   col_end = col(end);
%   
%  if row(1)>=2
%  row_start = 2;
%  end
%  if row_end<=(n_t-2);
%  row_end = row(end)+2;
%  end
%  
%   if col(1)>=2
%  col_start = col(1)-2;
%  end
%  if col_end<=(m_t-2);
%  col_end = col(end)+2;
%  end
%  col =col_start:col_end;
%  row =row_start:row_end;
%  % add two row and two col each side
% % scaleMask1 = 0.2*ones(n_t,m_t);
% % scaleMask1(row,col) = 1;
% 
% 
% % u=Mask2(row,col);
% 
% Img_t=Img_t(row,col);
phi=Mask2;


% %% parameter setting
% timestep=5;  % time step
% mu=0.2/timestep;  % coefficient of the distance regularization term R(phi)
% iter_inner=5;
% iter_outer=100;
% lambda=55; % coefficient of the weighted length term L(phi)
% alfa=1;  % coefficient of the weighted area term A(phi)
% epsilon=1.5; % papramater that specifies the width of the DiracDelta function
%   
% sigma=1.5;     % scale parameter in Gaussian kernel
% G=fspecial('gaussian',15,sigma);
% Img_smooth=conv2(Img_t,G,'same');  % smooth image by Gaussiin convolution-
% % Img_smooth=Img_t;  % smooth image by Gaussiin convolution-
% [Ix,Iy]=gradient(Img_smooth);
% f=Ix.^2+Iy.^2;
% g=1./(1+f);  % edge indicator function.
% 
% 
% 
% figure;
% mesh(-phi);   % for a better view, the LSF is displayed upside down
% hold on;  contour(phi, [0,0], 'r','LineWidth',2);
% title('Initial level set function');
% view([-80 35]);
% 
% figure;
% imagesc(Img_t,[0, 255]); axis off; axis equal; colormap(gray); hold on;  contour(phi, [0,0], 'r');
% title('Initial zero level contour');
% pause(0.5);
% 
% potential=1;  
% 
% if potential ==1
%     potentialFunction = 'single-well';  % use single well potential p1(s)=0.5*(s-1)^2, which is good for region-based model 
% elseif potential == 2
%     potentialFunction = 'double-well';  % use double-well potential in Eq. (16), which is good for both edge and region based models
% else
%     potentialFunction = 'double-well';  % default choice of potential function
% end
% 
% 
% % start level set evolution
% for n=1:iter_outer
%     phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);
%     if mod(n,2)==0
%         figure(100);
%         imagesc(Img_t,[0, 255]); axis off; axis equal; colormap(gray); hold on;  contour(phi, [0,0], 'r');
%     end
% end
% 
% % refine the zero level contour by further level set evolution with alfa=0
% alfa=0;
% iter_refine = 10;
% phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);
% 
% finalLSF=phi;
% figure;
% imagesc(Img_t,[0, 255]); axis off; axis equal; colormap(gray); hold on;  contour(phi, [0,0], 'r');
% hold on;  contour(phi, [0,0], 'r');
% str=['Final zero level contour, ', num2str(iter_outer*iter_inner+iter_refine), ' iterations'];
% title(str);
% 
% pause(1);
% figure;
% mesh(-finalLSF); % for a better view, the LSF is displayed upside down
% hold on;  contour(phi, [0,0], 'r','LineWidth',2);
% str=['Final level set function, ', num2str(iter_outer*iter_inner+iter_refine), ' iterations'];
% title(str);
% axis on;
% 
% figure;
% resMask = phi>0;
% spy(resMask)
resMask = levelsetprocess(Mask2,Img_t);
%%腐蚀  取最大连通 后
% A= resMask;
% I=A;
% bw=I;
% figure,
% subplot(1,3,1),imshow(bw,[]),title('原区域')
% 
% 
% se1=strel('disk',5);%这里是创建一个半径为5的平坦型圆盘结构元素
% A2=imerode(bw,se1);
% 
% subplot(1,3,2), imshow(A2, []),title('腐蚀的区域')
% L = bwlabel(A2);
% stats = regionprops(L);
% Ar = cat(1, stats.Area);
% ind = find(Ar ==max(Ar))
%     I1=zeros(size(I));
%     I1(L == ind) = 1;
%     I(L == ind) = 0;
% 
% subplot(1,3,3), imshow(I1, []),title('面积最大的区域')
% resMask=I1;
A= resMask;
I=A;
bw=I;
figure,
subplot(1,3,1),imshow(bw,[]),title('原区域')


se1=strel('disk',1);%这里是创建一个半径为5的平坦型圆盘结构元素
A2=imerode(bw,se1);

subplot(1,3,2), imshow(A2, []),title('腐蚀的区域')
L = bwlabel(A2);
stats = regionprops(L);
Ar = cat(1, stats.Area);
ind = find(Ar ==max(Ar))
    I1=zeros(size(I));
    I1(L == ind) = 1;
    I(L == ind) = 0;

subplot(1,3,3), imshow(I1, []),title('面积最大的区域')
resMask=I1;

%% level set end 

%% HMRF EM refine

mex BoundMirrorExpand.cpp;
mex BoundMirrorShrink.cpp;

% I=imread(imageName);
% if length(size(I))>2
%     I=rgb2gray(I);
% end
% I=I(:,:,1); 
I=filted_I_t1;
Y=I;



Y=double(Y);
% Y=gaussianBlur(Y,3);
figure;
% ,'blurred image.png'
imshow(uint8(Y));

k=2;
EM_iter=10; % max num of iterations
MAP_iter=10; % max num of iterations

tic;
possMat = Y.*resMask;
negMat = Y.*(1-resMask);
% scale resMask
[n_t,m_t] = size(resMask);
 row = find(sum(possMat,2));
 col = find(sum(possMat,1));
 
  row_start = 1;
  row_end = n_t;
  col_start= 1;
  col_end = m_t;

 if row(1)>2
 row_start = row(1)-2;
 end
 if row(end)<=(n_t-2);
 row_end = row(end)+2;
 end
 
  if col(1)>2
 col_start = col(1)-2;
 end
 if col(end)<=(m_t-2);
 col_end = col(end)+2;
 end
%  col =(int8)(col_start:col_end);
%  row =(int8)(row_start:row_end);
 % add two row and two col each side
% scaleMask1 = zeros(n_t,m_t);
% scaleMask1(row,col) = 1;
cutMask= resMask(int8(row_start):int8(row_end),int8(col_start):int8(col_end));
%  yi_tmp= Y(int8(row_start):int8(row_end),int8(col_start):int8(col_end));   
cutImg= Y(int8(row_start):int8(row_end),int8(col_start):int8(col_end));    
% cutImg= calFeatures(yi_tmp);
% center_Row  = round((row_end-row_start+1)/2);
% center_Col  = round((col_end-col_start+1)/2);
% 
% center_Rad2 = (center_Row-row_start)*(center_Row-row_start)+(center_Col-col_start)*(center_Col-col_start);
Z= zeros(n_t,m_t);

%Z用来记录空间位置的限制,欧式度量
% for i=1:n_t
%     for j = 1:m_t
%        tmp = 0.01*((i-center_Row)*(i-center_Row)+(j-center_Col)*(j-center_Col)-center_Rad2);
%        Z(i,j)= tmp;
%     end
% end
% figure(11);
% imshow(label2rgb(Z));
% sY = Y.*scaleMask1;

% Z=1-scaleMask1;
% ,'scale image.png'
figure;
imshow(label2rgb(possMat)),title('poss mat');

possMat = cutImg.*cutMask;
negMat = cutImg.*(1-cutMask);

[n_c,m_c]=size(cutMask);
posPixels_t = zeros(n_c*m_c,1);
posCnt=0;
negPixels_t= zeros(n_c*m_c,1);
negCnt=0;
for i=1:n_c
    for j = 1:m_c
       if cutMask(i,j)==1
          posCnt=posCnt+1;
          posPixels_t(posCnt,1)=cutImg(i,j);
       else
          negCnt=negCnt+1;
          negPixels_t(negCnt,1)=cutImg(i,j);
       end
    end
end

mu=[mean(negPixels_t(1:negCnt,1)); mean(posPixels_t(1:posCnt,1))];
sigma=[std2(negPixels_t(1:negCnt,1));std2(posPixels_t(1:posCnt,1))];
% X= resMask+1;
X= cutMask+1;
% X= (Mask2+1).*0.5;
% Y=Y.*scaleMask1;
[X, mu, sigma]=HMRF_EM(X,cutImg,Z,mu,sigma,k,EM_iter,MAP_iter);
figure;
% ,'final labels.png'
imshow(uint8(X*120));

toc;
%display:
subplot(4, 1, 1), imshow(I_gray, []), title('original image');
subplot(4, 1, 2), imshow(label2rgb(Lnn)), title('k nearest neighborhood based segmentation');
subplot(4, 1, 3), imshow(resMask, []), title('step 2 levelset');
subplot(4, 1, 4), imshow(label2rgb(X)), title('step 3 HMEF_EM refinement');

%% 取最大连通 后 腐蚀膨胀
A= X-1;
I=A;
bw=I;
figure,
subplot(1,3,1),imshow(bw,[]),title('原区域')
L = bwlabel(bw);
stats = regionprops(L);
Ar = cat(1, stats.Area);
ind = find(Ar ==max(Ar))
    I1=zeros(size(I));
    I1(L == ind) = 1;
    I(L == ind) = 0;

subplot(1,3,2), imshow(I1, []),title('面积最大的区域')
subplot(1,3,3),imshow(I, []),title('去掉面积最大的区域')
Img=double(adjustImg);
 targetMask = zeros(size(Img));
 targetsmallMask=zeros(size(resMask));
 targetsmallMask(int8(row_start):int8(row_end),int8(col_start):int8(col_end))=I1;
 targetMask(positionMat(3) : positionMat(4) ,positionMat(1):positionMat(2))=targetsmallMask;
 
 target = Img.*targetMask;
 figure,
 imshow(target,[]);
 
 figure,
 imshow(Img,[]);
 hold on;
contour(targetMask, [0,0], 'r','LineWidth',2);

 

% L = bwlabel(X);
% stats = regionprops(L);
% Ar = cat(1, stats.Area);
% ind = find(Ar ==max(Ar))
% 
% se=strel('disk',5');%圆盘型结构元素
% %闭运算在数学上是先膨胀再腐蚀的结果
% %闭运算的物理结果也是会平滑对象的轮廓，但是与开运算不同的是，闭运算
% %一般会将狭窄的缺口连接起来形成细长的弯口，并填充比结构元素小的洞
% maskres= X-1;
% 
% cutImg= cutImg.*maskres;
% fc=imclose(cutImg,se);%直接闭运算
% figure,
%  plot(222),imshow(fc);
%  title('直接闭运算');

%% cal cr pm

compareImg = imread(cmpName);
compareImg = double(compareImg(:,:,1));
compareMask = compareImg>100;
finalresMask = targetMask;
figure,
subplot(1,2,1),spy(compareMask),title('ground truth mask');
subplot(1,2,2),spy(finalresMask),title('final mask');


nGT = sum(sum(compareMask));
TPs= 0;
FPs= 0;
[cn, cm] = size(compareMask);
for i = 1:cn
    for j = 1:cm
        if(compareMask(i,j)==1 && finalresMask(i,j)==1)
            TPs = TPs+1;
        end
         if(compareMask(i,j)==0 && finalresMask(i,j)==1)
            FPs = FPs+1;
        end
    end
end

s=sprintf('TP 和 FP 为:[%d：%d]\n',TPs ,FPs);
 disp(s);
CR= (TPs -0.5*FPs)/nGT
PM = (TPs/nGT)*100
s=sprintf('CR 和 PM 为:[%f：%f]\n',CR ,PM);
 disp(s);

%  print(14,'-dpng','abc.png')
