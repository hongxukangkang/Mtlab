function im = conharmmean_filter(x,m,n,q)
% 逆谐波均值滤波
% 函数输入:
%         x：输入二维图像矩阵
%         m,n：滤波掩膜尺寸
% 函数输出:
%         im：输出图像矩阵，数据类型与输人相同
if ~isa(x,'double')
    x = double(x)/255;
end

im = imfilter(x.^(q+1),ones(m,n),'replicate');
im = im./(imfilter(x.^q,ones(m,n),'replicate')+eps);   % 逆谐波均值滤波
im = im2uint8(im);                                     % 类型转换
end
