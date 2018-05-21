clear
figure('DefaultAxesXTick',[],'DefaultAxesYTick',[],...
    'DefaultAxesFontSize',8,'Color','w')
%     X=readdicom('/Users/huangkaiwei/Documents/MATLAB/3drec/4/p/t',24);
%   X=readImg('/Users/huangkaiwei/Documents/MATLAB/3drec/4/adc',7);
% X=readImg('/Users/huangkaiwei/Documents/MATLAB/3drec/3/adc',7);
%  X=readdicom('/Users/huangkaiwei/Documents/MATLAB/3drec/2/q/t',19);%du

%read image
X=readImg('/Users/huangkaiwei/Documents/MATLAB/3drec/3/t',5);
X(find(X>253))=0;
% X=readdicom('/Users/huangkaiwei/Documents/MATLAB/3drec/2/q/t',19);
XR = X;
Ds = squeeze(XR);%删除只有一行、一列的维数
% [x y z D] = reducevolume(D, [2 2 1]);%按4 4 1抽取，减少数据量

Ds = smooth3(Ds); % 对数据进行平滑处理
map = pink(90);
% fv=isosurface(x,y,z,Ds, 5,'verbose');%得到等值面、顶点
% p = patch(fv,'FaceColor', [1,.75,.65], 'EdgeColor', 'none'); %定义图像颜色，光线
% p2 = patch(isocaps(x,y,z,Ds, 5), 'FaceColor', 'interp', 'EdgeColor','none');
hiso = patch(isosurface(Ds,5),'FaceColor',[1,.75,.65],'EdgeColor','none');
hcap = patch(isocaps(XR,5),'FaceColor','interp','EdgeColor','none');
view(215,30);  %选择三维视角
axis tight; %设置坐标轴和数据范围一致
daspect([1 1 .3])%设置坐标轴长宽高之比
colormap(gray(100)) %获取当前色图，灰度层次100级
camlight;%默认右上方创建光源
lighting gouraud  %明暗度插值处理，平滑过渡
% isonormals(x,y,z,Ds,p);%计算等值表面顶点的法向
%---------
% XR = X;
% Ds = smooth3(XR);
% map = pink(90);
% hiso = patch(isosurface(Ds,5),'FaceColor',[1,.75,.65],'EdgeColor','none');
% hcap = patch(isocaps(XR,5),'FaceColor','interp','EdgeColor','none');
% colormap(map)
% daspect(gca,[1,1,.4])
% lightangle(305,30);
% fig = gcf;
% fig.Renderer = 'zbuffer';
% lighting gouraud  %明暗度插值处理，平滑过渡
isonormals(Ds,hiso)
hcap.AmbientStrength = .6;
hiso.SpecularColorReflectance = 0;
hiso.SpecularExponent = 50;
ax = gca;
ax.View = [215,30];
ax.Box = 'On';

axis tight
title('分割的鼻咽癌');
%  title('整个序列三维重建');