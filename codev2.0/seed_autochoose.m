function p = seed_autochoose(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
close all;
cIM = imread('IMG-0001-00011.jpg');
m= rgb2gray(cIM);
figure, imshow(m, [0 200]), hold all
[nRow, nCol, nSli] = size(m);

 Flag=0;
P=[];
%遍历图边界找出头骨图的边缘端点
%找出图片上面第一行亮点,40是我经过测试后的较接近的值
for i=1:nRow
    for j=1:nCol
        if(m(i,j,1)>40)
            point1=[i,j];
            Flag=1;
            break;
        end
    end
    if(Flag==1)
        break;
    end
end
%找出图片下面第一行亮点
for i=nRow:-1:1
    for j=1:nCol
        if(m(i,j,1)>40)
            point2=[i,j];
            Flag=2;
            break;
        end
    end
    if(Flag==2)
        break;
    end
end
%找出图片左边第一列亮点
for i=1:nCol
    for j=1:nRow
        if(m(j,i,1)>40)
            point3=[j,i];
            Flag=3;
            break;
        end
    end
    if(Flag==3)
        break;
      
    end
end
%找出图片右边第一列亮点
for i=nCol:-1:1
    for j=1:nRow
        if(m(j,i,1)>40)
            point4=[j,i];
            Flag=4;
            break;
        end
    end
    if(Flag==4)
        break;
    end
end

colWid=point2(1)-point1(1); %下面第一行亮点的行坐标减去上面第一行亮点的行坐标得到列宽
rowWid=point4(2)-point3(2); %右边第一列亮点的列坐标减去左边第一列亮点的列坐标得到行宽
%如果列宽比较大则说明是列宽是头颅的长度，行宽是头颅宽度
if(abs(colWid)>abs(rowWid))
        %由于列宽是长度，那么piont3和point4是头颅前端点和后端点，取行长度中间的1/3作为目标区域的宽
        widbegin=point3(2)+round(rowWid*0.33);
        widend=point3(2)+round(rowWid*0.66);
        %取point3和point4中点所在行左扩右扩1/3的区域作为目标区域的长
        lenbegin=round((point3(1)+point4(1))/2);%取中点是防止point3和point4不在一条直线上，就取它们的中点部分
        lenend_tem1=lenbegin+round(colWid*0.33);
        lenend_tem2=lenbegin-round(colWid*0.33);
        %判断是左边1/3的区域还是右边1/3的区域包含鼻部，鼻部的总亮度要小一些
        if(sum(sum(m(lenbegin:lenend_tem1,widbegin:widend)),2)>sum(sum(m(lenend_tem2:lenbegin,widbegin:widend)),2))
            lenend=lenend_tem1;
        else
            lenend=lenbegin;
            lenbegin=lenend_tem2;
        end
        for i=lenbegin:lenend
        for  j=widbegin:widend
             P(end+1,:)=[i,j];
        end
        end
        %确定好区域后就将鼻部覆盖出来并将这部分图像截出保存为图片
        plot(P(:,2), P(:,1), 'LineWidth', 2);
        imwrite(m(lenbegin:lenend,widbegin:widend),'can.png');
        
        %一下所用到的方法式一样的，只是用于判断图片是否是正着放，倒着放，或左右反了的情况
else
        widbegin=point1(1)+round(colWid*0.33);
        widend=point1(1)+round(colWid*0.66);
        lenbegin=round((point1(2)+point2(2))/2);
        
        lenend_tem1=lenbegin+round(rowWid*0.33);
        lenend_tem2=lenbegin-round(rowWid*0.33);
    
        if(sum(sum(m(widbegin:widend,lenbegin:lenend_tem1)),2)>sum(sum(m(widbegin:widend,lenend_tem2:lenbegin)),2))
            lenend=lenend_tem1;
        else
            lenend=lenbegin;
            lenbegin=lenend_tem2;
            
        end
        for  i=widbegin:widend
             for j=lenbegin:lenend
            P(end+1,:)=[i,j];
        end
        end
         plot(P(:,2), P(:,1), 'LineWidth', 2);
         imwrite(m(widbegin:widend,lenbegin:lenend),'can.png');
end

      
end

