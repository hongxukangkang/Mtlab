function R = imnoise_lognormal(M, N, a,b)
% input:
%       对数正态lognormal分布，噪声的类型；
%       M,N：输出噪声图像矩阵的大小
%       a,b：各种噪声的分布参数
% output:
%       R: 输出的噪声图像矩阵，数据类型为double型
% 设定默认值
   % 产生对数正态分布噪声
   if nargin <= 3
      a = 1; b = 0.25;
   end
   x = log(randn(M, N));
   R = a*exp(b*x);
end