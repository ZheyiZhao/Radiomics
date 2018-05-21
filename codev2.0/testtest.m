%先做阈值分割，然后取最可能是肿瘤的区域
close all;
clear all;
% add all needed function paths
addpath .\coherenceFilter
addpath .\GLtree3DMex
addpath .\DRLSE_v0
addpath F:\medicalmatlab\levelset_segmentation_biasCorrection_v1

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
imageName ='IMG-0001-00011.jpg' ;
% imageName = 'can.png';
load clown;
[positionMat  adjustImg]=NPC_setposition('IMG-0001-00011.jpg');

Img=double(adjustImg);
% if length(size(Img))>2
%     Img=rgb2gray(Img);
% end
% I=Img(:,:,1); 
 I=Img(positionMat(3) : positionMat(4) ,positionMat(1):positionMat(2)); 
I_gray = I;

%smooth the image by coherence filter:
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