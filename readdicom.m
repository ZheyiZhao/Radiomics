function res = readdicom( input_path, cnt)
%UNTITLED Summary of this function goes here
% 批量读取dicom 传入文件夹路径(ie /Users/huangkaiwei/Documents/MATLAB/test/)和图片数量，图片命名为数字从一递增
if (nargin < 2)

    error(message('input arg error'));

end
% SB=strcat(str1,str2)
x=strcat(input_path,num2str(1));
res= dicomread(x);
for i=2:1:cnt
x=strcat(input_path,num2str(i));
d= dicomread(x);
res = cat(3,res,d);% 连接两个矩阵，这里将一层层的图片拼接到D中，成为3维矩阵
i
end

end

