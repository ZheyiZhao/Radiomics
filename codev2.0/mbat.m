%% 批处理测试
close all;
clear all;
% add all needed function paths
addpath ./GraphSeg
addpath ./levelset_segmentation_biasCorrection_v1

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

imageNamePath='F:\360data\重要数据\桌面\26人MRI数据\癌症\cancer';
cmpNamePath='F:\360data\重要数据\桌面\26人MRI数据\癌症分割\癌症\cancer_result';

%% excel
excel = actxserver('excel.application'); % 打开一个excel操作对象
set(excel,'visible',2); % 使excel对象可见，即打开excel窗口，

% 实际应用时设置其为不可见
workbooks = excel.workbooks; % 创建工作本组对象
workbook = invoke(workbooks,'add'); % 添加一个工作本
sheets = excel.activeworkbook.sheets; % 获取当前活跃工作本的表单组，一个工作本有三个表单（sheets）
sheet = get(sheets,'item',1); % 获取表单组的一个表单
invoke(sheet,'activate'); % 激活该表单

for i = 1:2
    imgIndex =sprintf('%d',i);
    if(i<10)
         imgIndex =sprintf('%s%d','0',i);
    end
imageName=sprintf('%s%s%s',imageNamePath,imgIndex,'.jpg');
saveImgName=sprintf('%s%s%s','F:\360data\重要数据\桌面\newstory\mhmm\ref\zhao\初稿\segres\',imgIndex,'.jpg');
cmpName=sprintf('%s%s%s',cmpNamePath,imgIndex,'.jpg');

[CR ,PM, finalresMask, target]=NPC_segbat(imageName,cmpName);
CR_s=sprintf('%f',CR)
PM_s=sprintf('%d',PM)
figure,imshow(target,[]);

AIndex=sprintf('%s%d','a',i);
BIndex=sprintf('%s%d','b',i);
CIndex=sprintf('%s%d','c',i);
activesheet = excel.activesheet; % 获取当前活跃表单的句柄
activesheetrange = get(activesheet,'range',AIndex); % 设置写到范围
set(activesheetrange,'value',imageName); % 写入数据

activesheet = excel.activesheet; % 获取当前活跃表单的句柄
activesheetrange = get(activesheet,'range',BIndex); % 设置写到范围
set(activesheetrange,'value',CR_s); % 写入数据

activesheet = excel.activesheet; % 获取当前活跃表单的句柄
activesheetrange = get(activesheet,'range',CIndex); % 设置写到范围
set(activesheetrange,'value',PM_s); % 写入数据


 imwrite(target,saveImgName);

end
invoke(workbook,'saveas','res.xls'); % 保存文件
