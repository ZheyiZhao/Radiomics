%LVQ
clear al;
clc;

%%创建网络

%% LVQ神经网络的分类——乳腺肿瘤诊断
%


%% 导入数据
load m.mat;

sobelTotalFV(isnan(sobelTotalFV))=0;
hogTotalFV(isnan(hogTotalFV))=0;
firstOrdertotalFv(isnan(firstOrdertotalFv))=0;
cooctotalFv(isnan(cooctotalFv))=0;
glrmtotalFv(isnan(glrmtotalFv))=0;
shapetotalF(isnan(shapetotalF))=0;
wavelettotalFv(isnan(wavelettotalFv))=0;

%使用筛选特征
textureMat=[cooctotalFv,glrmtotalFv];
firstOrderSelFv=firstOrdertotalFv(:,[1 2 3 4 5 8]);
featureSelMat= [firstOrderSelFv textureMat(:,[12 13 38 51 52 191]), shapetotalF(:,[1 2 6]) ,wavelettotalFv(:,[14 8 4 21 15 30 10 34])];
% sobelTotalFV, hogTotalFV,
x=[firstOrdertotalFv shapetotalF];
featureMat1=x(1:17,:);
featureMat=featureMat1;
% grp1 = [1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4];
grp1 = [1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 ];
% testlabel =[1 1 2 3 3 4 4];
testlabel =[1 1 2 3 3 4 4];
% totallabel=[1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 2 3 3 4 4];
totallabel=[1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 2 3 3 4 4];

Train=featureMat';
Test1=featureSelMat(18:24,:);
Test=Test1';
% 训练数据
P_train=Train;
Tc_train=grp1;
T_train=ind2vec(Tc_train);
% 测试数据
P_test=Test;
Tc_test=testlabel;
%% 创建网络
count_1=length(find(Tc_train==1));
count_2=length(find(Tc_train==2));
totallen=length(find(Tc_train));
 count_3=length(find(Tc_train==3));
count_4=length(find(Tc_train==4));
rate_1=count_1/totallen;
rate_2=count_2/totallen;
 rate_3=count_3/totallen;
 rate_4=count_4/totallen;
net=newlvq(minmax(P_train),20,[rate_1 rate_2 rate_3 rate_4 ],0.01,'learnlv2');
% 设置网络参数
net.trainParam.epochs=2000;
net.trainParam.show=10;
net.trainParam.lr=0.1;
net.trainParam.goal=0.1;
%% 训练网络
net=train(net,P_train,T_train);
%% 仿真测试
T_sim=sim(net,P_test);
Tc_sim=vec2ind(T_sim);
result=[Tc_sim;Tc_test]
%% 结果显示
total_1=length(find(totallabel==1));
total_2=length(find(totallabel==2));
% total_3=length(find(totallabel==3));
% total_4=length(find(totallabel==4));
number_1=length(find(Tc_test==1));
number_2=length(find(Tc_test==2));
% number_3=length(find(Tc_test==3));
% number_4=length(find(Tc_test==4));
number_1_sim=length(find(Tc_sim==1 & Tc_test==1));
number_2_sim=length(find(Tc_sim==2 &Tc_test==2));
% number_3_sim=length(find(Tc_sim==3 & Tc_test==3));
% number_4_sim=length(find(Tc_sim==4 &Tc_test==4));
disp(['病例总数：' num2str(24)...
      '  t1：' num2str(total_1)...
      '  t2：' num2str(total_2)]);
disp(['训练集病例总数：' num2str(17)...
      '  t1：' num2str(count_1)...
      '  t2：' num2str(count_2)]);
disp(['测试集病例总数：' num2str(7)...
      '  t1：' num2str(number_1)...
      '  t2：' num2str(number_2)]);
disp(['t1确诊：' num2str(number_1_sim)...
      '  误诊：' num2str(number_1-number_1_sim)...
      '  确诊率p1=' num2str(number_1_sim/number_1*100) '%']);
disp(['t2确诊：' num2str(number_2_sim)...
      '  误诊：' num2str(number_2-number_2_sim)...
      '  确诊率p2=' num2str(number_2_sim/number_2*100) '%']);
 

