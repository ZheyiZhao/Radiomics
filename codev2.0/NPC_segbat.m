function [CR PM finalresMask, target]=NPC_segbat(imageName,cmpName)
% 
% imageName ='F:\360data\重要数据\桌面\26人MRI数据\癌症\cancer07.jpg' ;
% cmpName='F:\360data\重要数据\桌面\26人MRI数据\癌症分割\癌症\cancer_result07.jpg';

[positionMat  adjustImg]=NPC_setposition(imageName);

Img=double(adjustImg);

 I=Img(positionMat(3) : positionMat(4) ,positionMat(1):positionMat(2)); 
I_gray = I;

%smooth the image by coherence filter:
filted_I = CoherenceFilter(I_gray,struct('T',5,'rho',2,'Scheme','I', 'sigma', 1));
%k-nearest neighborhood model:

filted_I_t1 = I_gray ;
Lnn = graphSeg(filted_I, 0.5/sqrt(3), 10, 10, 1);
%display:
figure,
subplot(1, 2, 1), imshow(I_gray, []), title('original image');
label_LNN = label2rgb(Lnn);
subplot(1, 2, 2), imshow(label_LNN), title('k nearest neighborhood based segmentation');


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
% figure;
% spy(Mask2);
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

Img_t= filted_I_t1;

resMask = levelsetprocess(Mask2,Img_t);

A= resMask;
I=A;
bw=I;
figure,
subplot(1,3,1),imshow(bw,[]),title('原区域')


se1=strel('disk',1);%这里是创建一个半径为1的平坦型圆盘结构元素
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


