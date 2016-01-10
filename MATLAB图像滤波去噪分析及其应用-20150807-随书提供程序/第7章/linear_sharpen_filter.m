function im3 = linear_sharpen_filter(im,w)
% 线性锐化滤波器
% input:
%     im:原始图像，待滤波图像
%     D0：带阻滤波器的截止频率
%     n ：阶次
% output:
%       H：M x N的矩阵，表示频域滤波器矩阵，数据类型为double，
    if ~isa(im,'double')
        im1 = double(im)/255; 
    end
im2 = imfilter(im1,w,'replicate');   % 线性锐化处理
im3 = im1-im2;                       % im3为锐化后图像
end

