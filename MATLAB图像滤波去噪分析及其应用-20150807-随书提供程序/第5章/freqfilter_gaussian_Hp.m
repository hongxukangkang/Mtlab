function im5 = freqfilter_gaussian_Hp(im,D0)
% 高斯高通滤波器gaussian
% input:
%     M,N:频域滤波器的尺寸
%     D0：带阻滤波器的截止频率
%     n ：阶次
% output:
%       H：M x N的矩阵，表示频域滤波器矩阵，数据类型为double，
    if ~isa(im,'double')
        im1 = double(im)/255; 
    end
im2 = fft2(im1);      % 傅里叶变换
im3 = fftshift(im2);  % 中心化

[N1, N2] = size(im3);
n1 = fix(N1 / 2);
n2 = fix(N2 / 2);
for i = 1:N1
    for j = 2:N2
        D = sqrt((i-n1)^2+(j-n2)^2);
        h = 1- exp(-D.^2./2./D0./D0);  % 高斯高通滤波器
        result(i,j) = h * im3(i,j);
    end
end
result = ifftshift(result);    % 反中心化
im4 = ifft2(result);           % 反变换
im5 = im2uint8(real(im4));     % 滤波图像
end
