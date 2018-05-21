clear all
clc
D= imread('result3d25.jpg');
%循环读取图片
for i=24:-1:1
fname = sprintf('result3d%d.jpg',i);
x=fname;
d= imread(x);
D = cat(3,D,d);% 连接两个矩阵，这里将一层层的图片拼接到D中，成为3维矩阵
end
D = squeeze(D);%删除只有一行、一列的维数
[x y z D] = reducevolume(D, [2 2 1]);%按4 4 1抽取，减少数据量
D = smooth3(D); % 对数据进行平滑处理
fv=isosurface(x,y,z,D, 5,'verbose');%得到等值面、顶点
p = patch(fv,'FaceColor', [1,.75,.65], 'EdgeColor', 'none'); %定义图像颜色，光线
p2 = patch(isocaps(x,y,z,D, 5), 'FaceColor', 'interp', 'EdgeColor','none');
view(0,90);  %默认三维视角
axis tight; %设置坐标轴和数据范围一致
daspect([1 1 .3])%设置坐标轴长宽高之比
colormap(gray(100)) %获取当前色图，灰度层次100级
camlight;%默认右上方创建光源
lighting gouraud  %明暗度插值处理，平滑过渡
isonormals(x,y,z,D,p);%计算等值表面顶点的法向
