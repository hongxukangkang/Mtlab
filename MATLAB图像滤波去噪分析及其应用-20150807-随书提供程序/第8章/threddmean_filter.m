function Z = threddmean_filter(X,n,thred)
% 函数对输人图像进行超限邻域平均法滤波
%  函数输入
%        X：输人二维图像矩阵
%        n：掩膜尺寸
%        thred：阈值
%  函数输出
%        Z：输出图像矩阵，数据类型与输人相同
if size(X,3)~=1
    error('图像应该为2维矩阵')
end
if ~isa(X,'double')
    X = double(X)/255;  % 数据类型 
end
H = fspecial('average',n);    % 均值模板
Y = imfilter(X, H);
thre = abs(X-Y)>thred;  % 判断哪些是门限
Z = X;   % 赋值
Z(thre)=Y(thre);
Z = im2uint8(Z);  % 类型转换

end

