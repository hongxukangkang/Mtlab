function R = imnoise_B(im,M, N, b)
% input:
%       二项式B分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
% 考虑第floor(a/2)次命中
if nargin < 4
   b = 0.5;
end
   % 产生二项式分布噪声
    for i = 1:M
        for j=1:N
           a = double( floor(im(i,j)/30)+1 );
           R(i,j) = nchoosek(a,floor(a/2)) * b.^(floor(a/2)) .* (1-b).^(a- floor(a/2));
        end
    end
end
