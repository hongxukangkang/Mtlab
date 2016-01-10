function z = harmonymean_filter(x,m,n)
% 谐波均值滤波
% 函数输入:
%         x：输入二维图像矩阵
%         m,n：滤波掩膜尺寸
% 函数输出:
%         z：输出图像矩阵，数据类型与输人相同
if ~isa(x,'double')
    x = double(x)/255;
end

z = m*n./imfilter(1./(x+eps),ones(m,n),'replicate'); % 谐波均值滤波
z = im2uint8(z);                                     % 类型转换

end

