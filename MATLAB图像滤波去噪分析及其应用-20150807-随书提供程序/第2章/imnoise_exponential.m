function R = imnoise_exponential(M, N, a,b)
% input:
%       指数exponential分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
   % 产生指数分布噪声
   if nargin <= 3
      a = 1; b = 0.25;
   end
   R = a*exp(b*randn(M, N));
end

