function R = imnoise_geometry(im,M, N, b)
% input:
%       几何geometry分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin < 3
   b = 0.5;
end
   % 产生几何分布噪声
  for i = 1:M
    for j=1:N
       a = double( floor(im(i,j)/30)+1 );
       R(i,j) = b .* (1-b).^(a-1);
    end
  end
end
