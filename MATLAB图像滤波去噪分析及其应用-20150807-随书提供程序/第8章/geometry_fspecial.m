function im2 = geometry_fspecial(im,m,n)
%函数对输入图像进行儿何均值滤波
% 函数输入:
%           x：输入二维图像矩阵
%           m,n：滤波掩膜尺寸
% 函数输出
%           im2：输出图像矩阵，数据类型与输人相同

    if ~isa(im,'double')
        im1 = double(im)/255;
    else 
        im1 = im;
    end
    im2 = exp( imfilter(log(im1),ones(m,n),'replicate') ).^(1/m/n); % 几何均值滤波
    im2 = im2uint8(im2);   % 数据类型转换 
end