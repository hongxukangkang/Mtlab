function R = imnoise_gaussian(M, N, a, b)
% input:
%       gaussian，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
if nargin == 1
   a = 0; b = 1;
   M = 1; N = 1;
elseif nargin == 3
   a = 0; b = 1;
end
   % 产生高斯分布噪声--白噪声
   R = a + b*randn(M, N);
end