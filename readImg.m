function imgRes = readImg( input_path, cnt)
%UNTITLED Summary of this function goes here
% 批量读取dicom 传入文件夹路径(ie /Users/huangkaiwei/Documents/MATLAB/t1/)和图片数量，图片命名为数字从一递增
if (nargin < 2)

    error(message('input arg error'));

end
clear imgRes;


% SB=strcat(str1,str2)
% pre=strcat(input_path,'ggxC');
pre=input_path;
x=strcat(pre,num2str(1),'.jpg')
imgRes= imread(x);
for i=2:1:cnt
x=strcat(pre,num2str(i),'.jpg')
d= imread(x);
imgRes = cat(3,imgRes,d);% 连接两个矩阵，这里将一层层的图片拼接到D中，成为3维矩阵
end

end

