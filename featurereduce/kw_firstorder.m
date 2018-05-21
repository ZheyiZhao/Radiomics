% 记分别为训练样本数据的一阶统计特征矩阵，纹理特征矩阵、形状特征矩阵和小波特征矩阵，对应的类标签矩阵为。矩阵的类标签个数为四个，分别对应着鼻咽癌的四个分期（t1，t2，t3，t4）.
% BEGIN
% 1.	计算样本的特征矩阵;
% 2.	筛选能较好区分分期和其他分期的特征;
% for j=1 : j<5 : j++
% 将鼻咽癌的类别分为分期和除了分期外两大类别;
% 根据t验证计算特征的概率P，然后根据p对特征进行重要性排序，得到k个特征的重要性向量;
% 根据KL散度计算特征的信息增益，然后根据信息增益对特征进行重要性排序，得到k个特征的重要性向量;
% endfor
% 3.	对于每个特征k，计算它的总的重要性
%  
% 4.	根据特征的值，选择的五个最优特征
% END
% firstOrderFV=[kw_mean ,kw_var,kw_skewness, kw_kurtosis,kw_energy,kw_ent,kw_max, kw_min ];
% clear;
load m.mat;

% grp1 = {'1' '1' '1' '1' '2' '2' '2' '2' '2' '3' '3' '3' '3' '4' '4' '4' '4' '1' '1' '2' '3' '3' '4' '4'}';
grp1 = {'1' '1' '1' '1' '2' '2' '2' '2' '2' '3' '3' '3' '3' '4' '4' '4' '4' }';

% ecdf(p);
% xlabel('P value');
% ylabel('CDF value')
[Sa Sb] =size(firstOrdertotalFv);
obs=firstOrdertotalFv';
kw_vote =zeros(1,Sb);
% GROUP = [1 1 1 1 2 2 2 2 2 3 3 3 3 4 4 4 4 1 1 2 3 3 4 4];
GROUP1 = [1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
dataTrain1=obs(:,1:17);

% dataTrainG1 = dataTrain(grp2idx(grp1)==1,:);
% dataTrainG2 = dataTrain(grp2idx(grp1)~=1,:);
% [h11,p11,ci11,stat11] = ttest2(dataTrainG1,dataTrainG2,[],[],'unequal');
[tI1 ,t1] = rankfeatures(dataTrain1,GROUP1,'Criterion', 'ttest');
[eI1 ,z1] = rankfeatures(dataTrain1,GROUP1,'Criterion', 'entropy');
subplot(2,2,1)

t1(isnan(t1))=0;
z1(isnan(z1))=0;
plot(t1);
  title('(a)t1分期与其他分期')
 xlabel('特征编号');
 ylabel('t绝对值')

%归一化
t1nor=t1./(sum(t1));
z1nor=z1./(sum(z1));
 for i=1:8
kw_vote(i)=kw_vote(i)+t1nor(i)+z1nor(i);
end

% for i=1:8
% kw_vote(tI1(i,1))=kw_vote(tI1(i,1))+(9-i);
% end
% for i=1:8
% kw_vote(eI1(i,1))=kw_vote(eI1(i,1))+(9-i);
% end
%区分t2分期
GROUP2 = [1 1 1 1 2 2 2 2 2 1 1 1 1 1 1 1 1 ];

 [tI2 ,t2] = rankfeatures(dataTrain1,GROUP2,'Criterion', 'ttest');
[eI2 ,z2] = rankfeatures(dataTrain1,GROUP2,'Criterion', 'entropy');
t2(isnan(t2))=0;
z2(isnan(z2))=0;

%归一化
t2nor=t2./(sum(t2));
z2nor=z2./(sum(z2));
 for i=1:8
kw_vote(i)=kw_vote(i)+t2nor(i)+z2nor(i);
end

subplot(2,2,2)
 plot(t2);
 title('(b)t2分期与其他分期')
 xlabel('特征编号');
 ylabel('t绝对值')


%区分t3分期
GROUP3 = [1 1 1 1 1 1 1 1 1 2 2 2 2 1 1 1 1 ];

[tI3 ,t3] = rankfeatures(dataTrain1,GROUP3,'Criterion', 'ttest');
[eI3 ,z3] = rankfeatures(dataTrain1,GROUP3,'Criterion', 'entropy');
t3(isnan(t3))=0;
z3(isnan(z3))=0;
%归一化
t3nor=t3./(sum(t3));
z3nor=z3./(sum(z3));
 for i=1:8
kw_vote(i)=kw_vote(i)+t3nor(i)+z3nor(i);
end

subplot(2,2,3)
 plot(t3);
 title('(c)t3分期与其他分期')
 xlabel('特征编号');
 ylabel('t绝对值')

%区分t4分期
GROUP4 = [1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 ];

[tI4 ,t4] = rankfeatures(dataTrain1,GROUP4,'Criterion', 'ttest');
[eI4 ,z4] = rankfeatures(dataTrain1,GROUP4,'Criterion', 'entropy');

t4(isnan(t4))=0;
z4(isnan(z4))=0;
%归一化
t4nor=t4./(sum(t4));
z4nor=z4./(sum(z4));
 for i=1:8
kw_vote(i)=kw_vote(i)+t4nor(i)+z4nor(i);
end

subplot(2,2,4)
plot(t4);
 title('(d)t4分期与其他分期')
 xlabel('特征编号');
 ylabel('t绝对值')

figure(2)


subplot(2,2,1)
plot(z1);
 title('(a)t1分期与其他分期')
 xlabel('特征编号');
 ylabel('KL散度');
 subplot(2,2,2)
plot(z2);
 title('(b)t2分期与其他分期')
 xlabel('特征编号');
 ylabel('KL散度');
  subplot(2,2,3)
plot(z3);
 title('(c)t3分期与其他分期')
 xlabel('特征编号');
 ylabel('KL散度');
 
  subplot(2,2,4)
plot(z4);
 title('(d)t4分期与其他分期')
 xlabel('特征编号');
 ylabel('KL散度');
 
 figure(3)
 plot(kw_vote);
  title('特征总权重值')
 xlabel('特征编号');
 ylabel('权重值');
 [firstordera,firstorderb]=sort(kw_vote);

% ecdf(z);
% xlabel('P value');
% ylabel('CDF value')
